-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- C# / .NET Mappings
vim.keymap.set("n", "<leader>cR", function()
  local ok, dotnet = pcall(require, "easy-dotnet")
  if ok then
    dotnet.run()
  else
    vim.notify("easy-dotnet not loaded yet", vim.log.levels.WARN)
  end
end, { desc = "Run .NET Project" })

vim.keymap.set("n", "<leader>ct", function()
  local ok, dotnet = pcall(require, "easy-dotnet")
  if ok then
    dotnet.testrunner()
  else
    vim.notify("easy-dotnet not loaded yet", vim.log.levels.WARN)
  end
end, { desc = "Test .NET Project" })

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

-- Quick Request (Spring, Express, ASP.NET)
vim.keymap.set("n", "<leader>rj", function()
  require("util.quick_request").create_request()
end, { desc = "Gerar Requisição API (Kulala)" })

