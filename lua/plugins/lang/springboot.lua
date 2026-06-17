return {
  -- Plugin para suporte visual ao Spring Boot
  {
    "JavaHello/spring-boot.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    opts = function()
      local java_cmd = "java"
      local home = os.getenv("HOME")
      if home then
        -- Busca um executável Java 21+ instalado pelo mise
        local mise_java_dirs = vim.fn.glob(home .. "/.local/share/mise/installs/java/*", true, true)
        table.sort(mise_java_dirs, function(a, b) return a > b end)
        for _, dir in ipairs(mise_java_dirs) do
          local ver_str = dir:match("([^/]+)$")
          if ver_str then
            local main_ver = ver_str:match("-(%d+)") or ver_str:match("^(%d+)")
            if main_ver then
              local ver_num = tonumber(main_ver)
              if ver_num and ver_num >= 21 then
                local bin = dir .. "/bin/java"
                if vim.fn.executable(bin) == 1 then
                  java_cmd = bin
                  break
                end
              end
            end
          end
        end
      end
      return {
        java_cmd = java_cmd,
      }
    end,
    config = function(_, opts)
      require("spring_boot").setup(opts)
      require("spring_boot").init_lsp_commands()
    end,
  },

  -- Configuração mestre do JDTLS (Motor do Java)
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- Força Java 22 do mise para o JDTLS (ignora versão local do projeto)
      local java22_home = vim.fn.expand("~/.local/share/mise/installs/java/22")
      if vim.fn.isdirectory(java22_home) == 1 then
        vim.env.JAVA_HOME = java22_home
        vim.env.PATH = java22_home .. "/bin:" .. vim.env.PATH
      end

      -- Garante que opts.cmd seja uma tabela e adicione flags necessárias
      opts.cmd = opts.cmd or {}

      -- Força o java_home explicitamente no comando do jdtls
      if vim.fn.isdirectory(java22_home) == 1 then
        -- Remove qualquer --java-executable existente
        local filtered = {}
        local skip_next = false
        for _, arg in ipairs(opts.cmd) do
          if skip_next then
            skip_next = false
          elseif arg == "--java-executable" then
            skip_next = true
          else
            table.insert(filtered, arg)
          end
        end
        opts.cmd = filtered
        table.insert(opts.cmd, "--java-executable")
        table.insert(opts.cmd, java22_home .. "/bin/java")
      end
      
      -- 0. Ignora validação de versão do Java pelo wrapper do Mason
      -- Evita o erro "jdtls requires at least Java 21" quando o sistema já tem Java 21+
      local has_no_validate = false
      for _, arg in ipairs(opts.cmd) do
        if arg == "--no-validate-java-version" then has_no_validate = true break end
      end
      if not has_no_validate then
        table.insert(opts.cmd, "--no-validate-java-version")
      end

      -- 1. Ativa suporte a Lombok (Essencial para Spring Boot)
      local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
      if vim.fn.filereadable(lombok_path) == 1 then
        local has_lombok = false
        for _, arg in ipairs(opts.cmd) do
          if arg:find("--javaagent") then has_lombok = true break end
        end
        if not has_lombok then
          table.insert(opts.cmd, "--javaagent:" .. lombok_path)
        end
      end

      -- 2. Carrega as Extensões do Spring Boot no JDTLS
      opts.init_options = opts.init_options or {}
      opts.init_options.bundles = opts.init_options.bundles or {}
      
      local ok, spring_boot = pcall(require, "spring_boot")
      if ok then
        local spring_bundles = spring_boot.java_extensions()
        vim.list_extend(opts.init_options.bundles, spring_bundles)
      end

      -- 3. Habilita diagnósticos avançados e validação Spring
      opts.settings = opts.settings or {}
      opts.settings.java = opts.settings.java or {}
      opts.settings.java.errors = {
        incompleteClasspath = { severity = "warning" },
      }
      
      -- Configurações específicas do Spring Boot LS
      opts.settings["spring-boot"] = {
        ls = {
          errors = { enabled = true },
          checkOnSave = true,
        },
      }

      return opts
    end,
  },
}
