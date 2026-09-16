return {
  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { 
      "hrsh7th/cmp-emoji",
      "onsails/lspkind.nvim", -- Adiciona ícones ao autocomplete
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, { name = "codeium", group_index = 1, priority = 100 })
      table.insert(opts.sources, { name = "emoji" })

      -- Configura a formatação para usar o lspkind
      opts.formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
          symbol_map = { Codeium = "" },
        }),
      }
    end,
  },
}