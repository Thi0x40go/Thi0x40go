return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.keys = opts.dashboard.preset.keys or {}
      
      -- Add Dbee before the Quit option (usually the last one)
      local pos = #opts.dashboard.preset.keys > 0 and #opts.dashboard.preset.keys or 1
      table.insert(opts.dashboard.preset.keys, pos, {
        icon = " ",
        key = "D",
        desc = "Open Dbee (Database)",
        action = ":lua require('dbee').toggle()",
      })
    end,
  }
}
