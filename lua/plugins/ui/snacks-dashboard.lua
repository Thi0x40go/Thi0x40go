return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.keys = opts.dashboard.preset.keys or {}
      
      local pos = #opts.dashboard.preset.keys > 0 and #opts.dashboard.preset.keys or 1
      
      -- Add HTTP deste Projeto
      table.insert(opts.dashboard.preset.keys, pos, {
        icon = "󱂛 ",
        key = "H",
        desc = "HTTP deste Projeto",
        action = ":lua require('util.quick_request').open_project_http()",
      })

      -- Add Dbee before the Quit option (usually the last one)
      table.insert(opts.dashboard.preset.keys, pos + 1, {
        icon = " ",
        key = "D",
        desc = "Banco de Dados (Dbee)",
        action = ":lua require('dbee').toggle()",
      })

    end,
  }
}
