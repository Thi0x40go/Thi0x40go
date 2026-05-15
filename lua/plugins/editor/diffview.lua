return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Abrir Visão de Diff" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Fechar Visão de Diff" },
    },
    opts = {},
  },
}
