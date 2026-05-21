return {
  -- Plugin para suporte visual ao Spring Boot
  {
    "JavaHello/spring-boot.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
    },
    config = function(_, opts)
      require("spring_boot").setup(opts)
      require("spring_boot").init_lsp_commands()
    end,
  },

  -- Configuração mestre do JDTLS (Motor do Java)
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- 1. Ativa suporte a Lombok (Essencial para Spring Boot)
      local lombok_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar"
      if vim.fn.filereadable(lombok_path) == 1 then
        opts.cmd = opts.cmd or {}
        table.insert(opts.cmd, "--javaagent:" .. lombok_path)
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
    end,
  },
}
