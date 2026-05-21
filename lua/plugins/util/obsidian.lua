return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ot", "<cmd>ObsidianTomorrow<cr>", desc = "Obsidian: Amanhã (Tomorrow note)" },
      { "<leader>od", "<cmd>ObsidianToday<cr>", desc = "Obsidian: Hoje (Daily note)" },
      { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Obsidian: Ontem (Yesterday note)" },
      { "<leader>oc", "<cmd>ObsidianTemplate<cr>", desc = "Obsidian: Completar com Template" },
      { "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian: Pular para nota (Quick Switch)" },
      { "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian: Procurar nas notas" },
      {
        "<leader>oP",
        function()
          vim.cmd("ObsidianPasteImg " .. vim.fn.input("Image Name: "))
        end,
        desc = "Obsidian: Colar Imagem",
      },
    },
    opts = {
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Documentos/Obsidian Vault/",
        },
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end
        local out = {}
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,
    },
  },
}
