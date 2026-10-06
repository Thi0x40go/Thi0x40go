return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        max_file_size = 256 * 1024, -- Desativa em arquivos > 256KB para evitar lag
        exclude_filetypes = {
          bigfile = true,
          snacks_dashboard = true,
        },
        priority = 15,
        style = {
          { fg = "#806d9c" }, -- Cor vibrante para o escopo
          { fg = "#c21f30" }, -- Cor secundária para aninhamento profundo
        },
        use_treesitter = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        duration = 200, -- Animação suave de 200ms
        delay = 100,
      },
      indent = {
        enable = true,
        max_file_size = 256 * 1024,
        exclude_filetypes = {
          bigfile = true,
          snacks_dashboard = true,
        },
        priority = 10,
        chars = {
          "│", -- Caractere limpo para indentação normal
        },
      },
      line_num = {
        enable = true,
        max_file_size = 256 * 1024,
        style = "#C678DD",
        priority = 20,
      },
      blank = {
        enable = true,
        chars = {
          " ",
        },
        style = {
          vim.api.nvim_get_hl(0, { name = "Whitespace" }),
        },
      },
    })
  end,
}
