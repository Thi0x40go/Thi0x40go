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

vim.keymap.set("n", "<leader>cr", "<cmd>OverseerRun<cr>", { desc = "Run Current File (Overseer)" })

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
