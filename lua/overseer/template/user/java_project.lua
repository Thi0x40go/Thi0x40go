-- lua/overseer/template/user/java_project.lua
local function get_mvn_cmd()
  return vim.fn.filereadable("mvnw") == 1 and "./mvnw" or "mvn"
end

local function get_gradle_cmd()
  if vim.fn.filereadable("gradlew") == 1 then
    return "./gradlew"
  elseif vim.fn.filereadable("gradlew.bat") == 1 then
    return "gradlew.bat"
  else
    return "gradle"
  end
end

return {
  generator = function(opts, cb)
    local tasks = {}
    
    -- Maven Project
    if vim.fn.filereadable("pom.xml") == 1 then
      local mvn = get_mvn_cmd()
      
      -- Coleta sub-módulos Maven dinamicamente
      local choices = { "" }
      local poms = vim.fn.glob("*/pom.xml", true, true)
      for _, pom_path in ipairs(poms) do
        local module_name = pom_path:match("([^/]+)/pom.xml$")
        if module_name then
          table.insert(choices, module_name)
        end
      end

      local default_module = ""
      for _, choice in ipairs(choices) do
        if choice == "apphealth-back" then
          default_module = "apphealth-back"
          break
        end
      end
      if default_module == "" and #choices > 1 then
        default_module = choices[2]
      end

      -- 1. Standard Run
      table.insert(tasks, {
        name = "Java: Maven Run (Spring Boot)",
        builder = function()
          return {
            cmd = { mvn, "spring-boot:run" },
            components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
          }
        end,
      })

      -- 2. Run with Args (Generic)
      table.insert(tasks, {
        name = "Java: Maven Run (Spring Boot) with Args",
        params = {
          module = {
            type = "enum",
            name = "Module (-pl)",
            choices = choices,
            default = default_module,
            desc = "Select maven sub-module to run",
          },
          args = {
            type = "string",
            name = "Arguments",
            default = default_module == "apphealth-back" and "--application.amazon.sqs-consumer.enabled=false" or "",
            desc = "e.g., --application.amazon.sqs-consumer.enabled=false",
          },
        },
        builder = function(params)
          local run_cmd = { mvn, "spring-boot:run" }
          if params.module and params.module ~= "" then
            table.insert(run_cmd, "-pl")
            table.insert(run_cmd, params.module)
          end
          if params.args and params.args ~= "" then
            table.insert(run_cmd, "-Dspring-boot.run.arguments=" .. params.args)
          end
          return {
            cmd = run_cmd,
            components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
          }
        end,
      })

      -- 3. Dedicated task for apphealth-back if it exists
      if vim.fn.filereadable("apphealth-back/pom.xml") == 1 then
        table.insert(tasks, {
          name = "Java: Maven Run apphealth-back (No SQS)",
          builder = function()
            return {
              cmd = {
                mvn,
                "spring-boot:run",
                "-pl",
                "apphealth-back",
                "-Dspring-boot.run.arguments=--application.amazon.sqs-consumer.enabled=false",
              },
              components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
            }
          end,
        })
      end

      -- 4. Clean Install
      table.insert(tasks, {
        name = "Java: Maven Clean Install",
        builder = function()
          return {
            cmd = { mvn, "clean", "install", "-DskipTests" },
            components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
          }
        end,
      })
    end

    -- Gradle Project
    if vim.fn.filereadable("build.gradle") == 1 or vim.fn.filereadable("build.gradle.kts") == 1 then
      local gradle = get_gradle_cmd()
      table.insert(tasks, {
        name = "Java: Gradle bootRun",
        builder = function()
          return {
            cmd = { gradle, "bootRun" },
            components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
          }
        end,
      })
      table.insert(tasks, {
        name = "Java: Gradle Build",
        builder = function()
          return {
            cmd = { gradle, "build", "-x", "test" },
            components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
          }
        end,
      })
    end

    cb(tasks)
  end,
  condition = {
    callback = function()
      return vim.fn.filereadable("pom.xml") == 1 or 
             vim.fn.filereadable("build.gradle") == 1 or 
             vim.fn.filereadable("build.gradle.kts") == 1
    end,
  },
}
