-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>cx", "<cmd>OverseerRun<cr>", { desc = "Executar (Overseer)" })

-- Guia de Comandos (Cheatsheet)
vim.keymap.set("n", "<leader>?", function()
  Snacks.win({
    file = vim.fn.stdpath("config") .. "/CHEATSHEET.md",
    width = 0.6,
    height = 0.7,
    wo = {
      conceallevel = 3,
      concealcursor = "nvc",
    },
  })
end, { desc = "Ver Guia de Comandos" })

-- Atalhos para o Layout Edgy
vim.keymap.set("n", "<leader>be", "<cmd>Neotree buffers<cr>", { desc = "Ver Arquivos Abertos (Buffers)" })
vim.keymap.set("n", "<leader>ge", "<cmd>Neogit<cr>", { desc = "Git Status (Neogit)" })
