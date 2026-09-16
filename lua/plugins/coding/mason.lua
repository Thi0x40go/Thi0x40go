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
        "bash-language-server",
        "css-lsp",
        "emmet-language-server",
        "json-lsp",
        "markdownlint",
        "typescript-language-server",
        "vtsls",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
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
