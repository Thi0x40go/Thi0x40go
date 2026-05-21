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
      table.insert(tasks, {
        name = "Java: Maven Run (Spring Boot)",
        builder = function()
          return {
            cmd = { mvn, "spring-boot:run" },
            components = { { "on_output_quickfix", open_on_exit = "failure" }, "default" },
          }
        end,
      })
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
