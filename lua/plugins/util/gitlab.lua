return {
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "dlyongemallo/diffview.nvim", -- Maintained fork of "sindrets/diffview.nvim".
      "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
      "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
    },
    build = function () require("gitlab.server").build(true) end, -- Builds the Go binary
    config = function()
      require("gitlab").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "gl", group = "GitLab", icon = "" },
        { "gla", group = "Assignee", icon = "󰦽" },
        { "glaa", desc = "Add Assignee", icon = "󰦽" },
        { "glad", desc = "Delete Assignee", icon = "󰦾" },
        { "gll", group = "Label", icon = "󰓹" },
        { "glla", desc = "Add Label", icon = "󰓹" },
        { "glld", desc = "Delete Label", icon = "󰓻" },
        { "glr", group = "Reviewer/Review", icon = "󰦿" },
        { "glra", desc = "Add Reviewer", icon = "󰦿" },
        { "glrd", desc = "Delete Reviewer", icon = "󰧀" },
        { "glrr", desc = "Rebase", icon = "󰜛" },
        { "glA", desc = "Approve MR", icon = "󰄵" },
        { "glR", desc = "Revoke MR Approval", icon = "󰅙" },
        { "glM", desc = "Merge MR", icon = "󰜘" },
        { "glm", desc = "Merge Automatically", icon = "󰜙" },
        { "glc", desc = "Choose MR", icon = "󰏘" },
        { "gls", desc = "Summary", icon = "󰧮" },
        { "glo", desc = "Open in Browser", icon = "󰖟" },
        { "glp", desc = "Pipeline status", icon = "󱖟" },
        { "glC", desc = "Create MR", icon = "󰜗" },
      })
    end,
  },
}

