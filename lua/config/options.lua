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

-- Conexões de banco de dados (usado pelo vim-dadbod / LazyVim extra lang.sql)
g.dbs = {
  { name = "apphealth-local", url = "postgresql://apphealth:apphealth@localhost:5432/apphealth" },
}

-- Configuração para usar bash interativo e carregar .bashrc/aliases
o.shell = "/bin/bash"
o.shellcmdflag = "-ic"

-- Desativa Inlay Hints globalmente (Padrão LazyVim e Neovim)
vim.g.lazyvim_lsp_inlay_hint = false

-- FORÇA BRUTA: Sobrescreve a função de Inlay Hint para não fazer nada
-- Isso impede que erros de 'col: out of range' apareçam na tela
if vim.lsp.inlay_hint then
  vim.lsp.inlay_hint.enable = function() end
end

-- Desativa o texto de erro/aviso que aparece escrito ao lado do código (virtual text)
vim.diagnostic.config({
  virtual_text = false,
})

-- Modern Window Borders (Splits)
o.fillchars = {
  horiz = "─",
  horizup = "┴",
  horizdown = "┬",
  vert = "│",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  eob = " ", -- Esconde o ~ no final do buffer
}

-- Bordas arredondadas para janelas flutuantes (LSP e diagnósticos)
local border = "rounded"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = border })
vim.diagnostic.config({ float = { border = border } })

