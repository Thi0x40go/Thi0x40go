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
      { "<leader>nt", "<cmd>ObsidianTomorrow<cr>", desc = "󰔗  Amanhã (Tomorrow)" },
      { "<leader>nd", "<cmd>ObsidianToday<cr>", desc = "󰃭  Hoje (Daily Note)" },
      { "<leader>ny", "<cmd>ObsidianYesterday<cr>", desc = "󰔒  Ontem (Yesterday)" },
      { "<leader>nc", "<cmd>ObsidianTemplate<cr>", desc = "󰏫  Completar com Template" },
      { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "󰈞  Pular para Nota" },
      { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "󰍉  Procurar nas Notas" },
      {
        "<leader>nP",
        function()
          vim.cmd("ObsidianPasteImg " .. vim.fn.input("Image Name: "))
        end,
        desc = "󰄄  Colar Imagem",
      },
    },
    opts = {
      completion = {
        nvim_cmp = false, -- Desativado para evitar erro 'module cmp not found'
        min_chars = 2,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Obsidian Vault/",
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
