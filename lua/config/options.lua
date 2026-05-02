-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o = vim.opt -- For the opt
local g = vim.g -- For the globals

-- views can only be fully collapsed with the global statusline
o.laststatus = 3
o.spelllang = { "pt_br", "en" }
o.spell = true
o.swapfile = false
o.wrap = true
o.relativenumber = false
vim.g.lazyvim_prettier_needs_config = false
g.autoformat = false

-- Configuração para usar bash interativo e carregar .bashrc/aliases
o.shell = "/bin/bash"
o.shellcmdflag = "-ic"

-- -- Desativa o texto de erro/aviso que aparece escrito ao lado do código (virtual text)
-- vim.diagnostic.config({
--   virtual_text = false,
-- })
