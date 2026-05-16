return {
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach", -- Carrega assim que um servidor LSP (C#, Java, etc) se conectar
    opts = {
      disable = { filetypes = { "css", "scss", "less" } },
      -- Configuração visual estilo IntelliJ
      text_format = function(symbol)
        local res = {}

        -- 1. Contador de Usos (LSP)
        if symbol and symbol.references and symbol.references > 0 then
          local usage = symbol.references <= 1 and "uso" or "usos"
          table.insert(res, string.format("󰌹 %s %s", symbol.references, usage))
        end

        -- 2. Git Blame (Quem mexeu por último)
        local ok, gitsigns = pcall(require, "gitsigns")
        if ok and symbol and symbol.bufnr then
          local line_data = vim.api.nvim_buf_get_var(symbol.bufnr, "gitsigns_blame_line_dict")
          if line_data and line_data.author and line_data.author ~= "Not Committed Yet" then
            local date = os.date("%d/%m/%y", line_data.author_time)
            table.insert(res, string.format(" %s, %s", line_data.author, date))
          end
        end

        if #res == 0 then return nil end
        return "  " .. table.concat(res, " • ")
      end,
      -- Define em quais tipos de símbolos ele deve mostrar a contagem
      kinds = {
        vim.lsp.protocol.SymbolKind.Class,
        vim.lsp.protocol.SymbolKind.Method,
        vim.lsp.protocol.SymbolKind.Function,
        vim.lsp.protocol.SymbolKind.Interface,
      },
      vt_position = "end_of_line", -- Nome correto do parâmetro: vt_position
      request_pending_text = false, -- Desativa o "loading..." chato
    },
  },
}
