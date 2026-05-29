return {
    -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "graphql-language-service-cli",
        "bash-language-server",
        "css-lsp",
        "debugpy",
        "deno",
        "docker-language-server",
        "dotenv-linter",
        "emmet-language-server",
        "gitlint",
        "gofumpt",
        "gopls",
        "htmlhint",
        "json-lsp",
        "jsonlint",
        "luaformatter",
        "markdownlint",
        "roslyn",
        "vscode-spring-boot-tools",
        "typescript-language-server",
        "sqls",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- Impede que o mason-lspconfig tente encontrar servidores para o dashboard do snacks
      -- Isso resolve o erro "No LSP servers found for filetype snacks_dashboard"
      handlers = {
        function(server_name)
          if vim.bo.filetype == "snacks_dashboard" then
            return
          end
          require("lspconfig")[server_name].setup({})
        end,
      },
    },
  },
}
