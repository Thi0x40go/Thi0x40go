return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {
      mode = "cursor",
      max_lines = 3, -- No máximo 3 linhas fixas no topo
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 20, -- Número máximo de linhas para mostrar em um contexto multiline
      trim_scope = "outer", -- Onde cortar se exceder o limite
    },
    keys = {
      {
        "[c",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        desc = "Pular para o topo da função/classe",
      },
    },
  },
}
