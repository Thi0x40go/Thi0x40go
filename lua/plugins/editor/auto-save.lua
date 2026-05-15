return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- lazy load on command
    event = { "InsertLeave", "TextChanged" }, -- optional for eager loading
    opts = {
      enabled = false, -- Começa desativado por padrão (conforme pedido)
      trigger_events = { "InsertLeave", "TextChanged" },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        
        -- Não salva em buffers especiais ou se estiver em modo visual
        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), { "neo-tree", "dbui" }) then
          return true
        end
        return false
      end,
    },
    keys = {
      { "<leader>ua", "<cmd>ASToggle<cr>", desc = "Alternar Auto-Save (Liga/Desliga)" },
    },
  },
}
