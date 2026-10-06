-- Autocmds are automatically loaded on the VeryLazy event
-- Autocmds padrão que são sempre definidos: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.html",
  callback = function()
    vim.bo.filetype = "twig"
  end,
})

-- Função para aplicar as cores das bordas
local function set_window_borders()
  -- Borda da janela ativa (Azul moderno e fino)
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3d59a1", bold = false })
  -- Borda da janela inativa (Mais sutil/escuro)
  vim.api.nvim_set_hl(0, "WinSeparatorNC", { fg = "#1f2335", bold = false })
  -- Força o link para garantir compatibilidade
  vim.api.nvim_set_hl(0, "VertSplit", { link = "WinSeparator" })

  -- Opcional: Escurece levemente o fundo da janela inativa para destacar a ativa
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "#16161e" })
end

-- Aplica ao carregar o arquivo
set_window_borders()

-- Reaplica sempre que o tema mudar
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = set_window_borders,
})


-- ==============================================================================
-- Otimização para Arquivos Longos / Pesados (Long Lines & Big Files)
-- ==============================================================================
local large_file_group = vim.api.nvim_create_augroup("LargeFileOptimization", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre", "BufReadPost" }, {
  group = large_file_group,
  callback = function(ev)
    local buf = ev.buf
    local file = ev.file or vim.api.nvim_buf_get_name(buf)

    -- Verifica tamanho físico do arquivo (> 800 KB)
    local is_large = false
    if file and file ~= "" then
      local ok, stat = pcall(vim.uv.fs_stat, file)
      if ok and stat and stat.size > (800 * 1024) then
        is_large = true
      end
    end

    -- Se não for grande pelo tamanho, verifica se tem muitas linhas (> 5000 linhas)
    -- ou se tem linhas extremamente longas (> 1500 caracteres, ex: JSON/JS minificado)
    if not is_large and ev.event == "BufReadPost" then
      local line_count = vim.api.nvim_buf_line_count(buf)
      if line_count > 5000 then
        is_large = true
      else
        -- Amostra as primeiras 50 linhas para detectar minificação ou linhas longas
        local lines = vim.api.nvim_buf_get_lines(buf, 0, math.min(line_count, 50), false)
        for _, l in ipairs(lines) do
          if #l > 1500 then
            is_large = true
            break
          end
        end
      end
    end

    if is_large then
      vim.b[buf].is_large_file = true
      vim.opt_local.wrap = false -- Desativa quebra de linha (evita travamento de renderização)
      vim.opt_local.foldmethod = "manual" -- Desativa cálculo recursivo de dobras
      vim.opt_local.statuscolumn = "" -- Desativa renderização de colunas pesadas
      vim.opt_local.cursorline = false -- Desativa highlight de linha atual
      vim.opt_local.relativenumber = false
      vim.opt_local.swapfile = false
      vim.b[buf].completion = false -- Desativa auto-complete no buffer
      
      -- Desativa Treesitter highlight para este buffer
      pcall(vim.treesitter.stop, buf)
      
      -- Desativa NoMatchParen se disponível
      if vim.fn.exists(":NoMatchParen") ~= 0 then
        pcall(vim.cmd, "NoMatchParen")
      end
    end
  end,
})
-- C# BOM Fix: Remove <feff> (Byte Order Mark) automaticamente
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePre" }, {
  pattern = "*.cs",
  callback = function()
    -- Só executa se for um arquivo real, editável e com nome válido
    if vim.bo.modifiable and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
      local pos = vim.fn.getpos(".")
      pcall(function()
        vim.cmd("silent! %s/\\%uFEFF//g")
      end)
      vim.fn.setpos(".", pos)
      vim.opt_local.bomb = false
    end
  end,
})

-- Mata/desconecta todos os servidores LSP (como jdtls/Java) ao fechar o Neovim para evitar processos órfãos
vim.api.nvim_create_autocmd("VimLeavePre", {
  desc = "Stop all active LSP clients to prevent orphaned background processes",
  callback = function()
    local clients = vim.lsp.get_clients and vim.lsp.get_clients() or vim.lsp.get_active_clients()
    for _, client in ipairs(clients) do
      pcall(function()
        client:stop(true)
      end)
    end
  end,
})

return {}
