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

      -- Exibe o número de buffers carregados
      table.insert(opts.sections.lualine_x, {
        function()
          local is_loaded = vim.api.nvim_buf_is_loaded
          local tbl = vim.api.nvim_list_bufs()
          local loaded_bufs = 0
          for i = 1, #tbl do
            if is_loaded(tbl[i]) and vim.bo[tbl[i]].buflisted then
              loaded_bufs = loaded_bufs + 1
            end
          end
          return loaded_bufs
        end,
        icon = "󰈔",
        color = { fg = "DarkCyan", gui = "bold" },
      })

      table.insert(opts.sections.lualine_x, "encoding")
      table.insert(opts.sections.lualine_x, { "filetype" })
    end,
  },
}
