return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = opts.dashboard or {}
      opts.dashboard.preset = opts.dashboard.preset or {}
      opts.dashboard.preset.keys = opts.dashboard.preset.keys or {}
      
      local pos = #opts.dashboard.preset.keys > 0 and #opts.dashboard.preset.keys or 1
      
      -- Add Git Worktree before Quit
      table.insert(opts.dashboard.preset.keys, pos, {
        icon = "󰙅 ",
        key = "w",
        desc = "Git Worktrees",
        action = function()
          require("telescope").load_extension("git_worktree")
          local ext = require("telescope").extensions.git_worktree
          if ext.git_worktree then
            ext.git_worktree()
          elseif ext.git_worktrees then
            ext.git_worktrees()
          end
        end,
      })
    end,
  }
}
