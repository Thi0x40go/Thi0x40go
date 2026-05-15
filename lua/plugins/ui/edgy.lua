return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      left = {
        {
          ft = "neo-tree",
          title = "Projeto",
          size = { width = 30 },
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
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
      },
    },
  },
}
