local blame_cache = {}

return {
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach",
    opts = {
      disable = { filetypes = { "css", "scss", "less" } },
      
      text_format = function(symbol)
        local res = {}

        -- 1. Contador de Usos (LSP)
        if symbol and symbol.references and symbol.references > 0 then
          local usage = symbol.references <= 1 and "uso" or "usos"
          table.insert(res, string.format("󰌹 %s %s", symbol.references, usage))
        end

        -- 2. Git Blame Robusto (Local Cache)
        if symbol and symbol.bufnr and symbol.line then
          local file = vim.api.nvim_buf_get_name(symbol.bufnr)
          if file ~= "" and vim.fn.filereadable(file) == 1 then
            local line = symbol.line + 1
            local cache_key = file .. ":" .. line
            
            if blame_cache[cache_key] then
              if blame_cache[cache_key] ~= "nil" then
                table.insert(res, blame_cache[cache_key])
              end
            else
              -- Chamada rápida ao Git (síncrona apenas na primeira vez)
              local cmd = string.format("git blame -L %d,%d --porcelain %s", line, line, vim.fn.shellescape(file))
              local out = vim.fn.systemlist(cmd)
              
              local author, time
              if out and #out > 0 then
                for _, l in ipairs(out) do
                  if l:match("^author ") then author = l:sub(8) end
                  if l:match("^author%-time ") then time = tonumber(l:sub(13)) end
                end
              end

              if author and author ~= "Not Committed Yet" and time then
                local date = os.date("%d/%m/%y", time)
                local blame_text = string.format(" %s, %s", author, date)
                table.insert(res, blame_text)
                blame_cache[cache_key] = blame_text
              else
                blame_cache[cache_key] = "nil"
              end
            end
          end
        end

        if #res == 0 then return nil end
        return "  " .. table.concat(res, " • ")
      end,
      
      kinds = {
        vim.lsp.protocol.SymbolKind.Class,
        vim.lsp.protocol.SymbolKind.Method,
        vim.lsp.protocol.SymbolKind.Function,
        vim.lsp.protocol.SymbolKind.Interface,
        vim.lsp.protocol.SymbolKind.Constructor,
        vim.lsp.protocol.SymbolKind.Property,
      },
      vt_position = "end_of_line",
      request_pending_text = false,
    },
  },
}
