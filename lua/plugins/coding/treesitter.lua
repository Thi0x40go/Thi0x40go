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

      -- Desativa treesitter em arquivos grandes ou com muitas linhas para evitar lentidão extrema
      opts.highlight = opts.highlight or {}
      local orig_disable = opts.highlight.disable
      opts.highlight.disable = function(lang, buf)
        if type(orig_disable) == "function" and orig_disable(lang, buf) then
          return true
        end
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > (500 * 1024) then
          return true
        end
        if vim.api.nvim_buf_line_count(buf) > 6000 then
          return true
        end
      end
    end,
  },
}
