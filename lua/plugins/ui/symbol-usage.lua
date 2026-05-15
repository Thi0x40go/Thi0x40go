return {
  {
    "Wansmer/symbol-usage.nvim",
    event = "LspAttach", -- Carrega assim que um servidor LSP (C#, Java, etc) se conectar
    opts = {
      -- Configuração visual estilo IntelliJ
      text_format = function(symbol)
        local res = {}
        if symbol.references and symbol.references > 0 then
          local usage = symbol.references <= 1 and "uso" or "usos"
          table.insert(res, string.format("󰌹 %s %s", symbol.references, usage))
        end
        return table.concat(res, " ")
      end,
      -- Define em quais tipos de símbolos ele deve mostrar a contagem
      kinds = {
        vim.lsp.protocol.SymbolKind.Class,
        vim.lsp.protocol.SymbolKind.Method,
        vim.lsp.protocol.SymbolKind.Function,
        vim.lsp.protocol.SymbolKind.Interface,
      },
      vt_role = "above", -- Mostra acima da linha (estilo CodeLens)
    },
  },
}
