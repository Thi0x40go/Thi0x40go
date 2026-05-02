return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
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
        priority = 10,
        chars = {
          "│", -- Caractere limpo para indentação normal
        },
        style = {
          "#E06C75",
          "#E5C07B",
          "#98C379",
          "#56B6C2",
          "#61AFEF",
          "#C678DD",
        },
      },
      line_num = {
        enable = true,
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

