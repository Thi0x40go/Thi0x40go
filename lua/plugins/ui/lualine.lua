return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "stevearc/overseer.nvim" },
    opts = function(_, opts)
      local overseer = require("overseer")

      table.insert(opts.sections.lualine_x, {
        "overseer",
        label = "",
        colored = true,
        symbols = {
          [overseer.STATUS.RUNNING] = " ",
          [overseer.STATUS.SUCCESS] = " ",
          [overseer.STATUS.FAILURE] = " ",
          [overseer.STATUS.CANCELED] = "󰜺 ",
        },
      })

      table.insert(opts.sections.lualine_x, "encoding")
      table.insert(opts.sections.lualine_x, {"filetype"})
    end,
  },
}
