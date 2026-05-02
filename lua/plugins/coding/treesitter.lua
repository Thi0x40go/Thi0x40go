return {
  -- adicionar mais parsers ao treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "cmake",
        "css",
        "csv",
        "diff",
        "dot",
        "editorconfig",
        "gitcommit",
        "go",
        "gomod",
        "graphql",
        "html",
        "html_tags",
        "javascript",
        "json",
        "jsx",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "nginx",
        "python",
        "php",
        "phpdoc",
        "query",
        "regex",
        "tsx",
        "twig",
        "typescript",
        "vim",
        "yaml",
        "sql",
      },
    },
  },
  -- Visto que `vim.tbl_deep_extend`, só consegue mesclar tabelas e não listas, o código acima
  -- iria sobrescrever `ensure_installed` com o novo valor.
  -- Se você preferir estender a configuração padrão, use o código abaixo:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- adiciona tsx e typescript ao treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },
}
