return {
  {
    "folke/snacks.nvim",
    opts = {
      -- Adiciona atalho para o Lazydocker
    },
    keys = {
      {
        "<leader>ad",
        function()
          Snacks.terminal.toggle("lazydocker", { win = { position = "float" } })
        end,
        desc = "Gerenciar Docker (Lazydocker)",
      },
    },
  },
}
