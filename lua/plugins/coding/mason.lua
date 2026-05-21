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
        "chrome-debug-adapter",
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
      },
    },
  }
}
