return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      animate = {
        enabled = false, -- Desativa animações que podem parecer "quebradas"
      },
      left = {
        {
          ft = "neo-tree",
          title = "Projeto",
          size = { width = 40 },
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
        },
        {
          ft = "neo-tree",
          title = "Buffers",
          size = { width = 40 },
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
        },
      },
      right = {
        {
          ft = "neotest-summary",
          title = "Testes",
          size = { width = 35 },
        },
        {
          ft = "lspsagaoutline",
          title = "Estrutura",
          size = { width = 30 },
        },
      },
      bottom = {
        {
          ft = "toggleterm",
          title = "Terminal",
          size = { height = 0.4 },
        },
        {
          ft = "lazyterm",
          title = "Terminal",
          size = { height = 0.4 },
        },
        {
          ft = "qf",
          title = "Quickfix",
        },
        {
          ft = "help",
          size = { height = 20 },
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        {
          ft = "nm", -- Neogit / Git logs
          title = "Git Status",
        },
      },
    },
  },
}
