require("config.remote_clipboard").setup()
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

-- Desativa providers opcionais não usados para inicialização mais rápida e sem avisos
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0

-- Desativa Inlay Hints globalmente (Padrão LazyVim e Neovim)
vim.g.lazyvim_lsp_inlay_hint = false

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
vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
  local opts = vim.tbl_deep_extend("force", { border = border }, config or {})
  return vim.lsp.handlers.hover(err, result, ctx, opts)
end
vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
  local opts = vim.tbl_deep_extend("force", { border = border }, config or {})
  return vim.lsp.handlers.signatureHelp(err, result, ctx, opts)
end
vim.diagnostic.config({ float = { border = border } })

