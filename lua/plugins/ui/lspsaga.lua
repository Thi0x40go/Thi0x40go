return {
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
        },
        ui = {
          code_action = "", -- Desativa o ícone de lâmpada no final da linha (bug visual)
        },
        hover = {
          open_link = "gx",
        },
        definition = {
          edit = "<CR>",
        },
      })
    end,
    keys = {
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Documentation (Saga)" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", mode = { "n", "v" }, desc = "Code Action (Saga)" },
      { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics (Saga)" },
      { "gh", "<cmd>Lspsaga finder<cr>", desc = "LSP Finder (Saga)" },
      { "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition (Saga)" },
      { "<leader>cr", "<cmd>Lspsaga rename<cr>", desc = "Rename (Saga)" },
    },
  },
}
