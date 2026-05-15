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
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Documentação (Hover)" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", mode = { "n", "v" }, desc = "Ações de Código" },
      { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Ver Erros da Linha" },
      { "gh", "<cmd>Lspsaga finder<cr>", desc = "Procurar Usos/Referências" },
      { "gr", "<cmd>Lspsaga finder ref<cr>", desc = "Encontrar Usos (Find Usages)" },
      { "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "Espiar Definição" },
      { "<leader>cs", "<cmd>Lspsaga outline<cr>", desc = "Ver Estrutura do Código" },
      { "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "Renomear" },
      { "<leader>cr", false }, -- Desativa o atalho original do LazyVim para não conflitar
    },
  },
}
