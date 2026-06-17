return {
  {
    "seblyng/roslyn.nvim",
    enabled = false,
    ft = "cs",
    opts = {
      -- Desativa o Razor para evitar os avisos de path não encontrado
      razor = { enabled = false },
      -- O roslyn.nvim tentará encontrar o servidor instalado via Mason automaticamente
    },
  },
}
