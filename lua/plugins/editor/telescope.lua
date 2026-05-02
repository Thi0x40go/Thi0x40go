return {
  -- Exemplo: Telescope overrides
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      live_grep = {
        additional_args = function()
          return {
            "--hidden",
            "--no-ignore-vcs",
            "--glob",
            "!.git/*",
          }
        end,
      },
    },
  },

  -- Exemplo: Habilitar plugin extra do LazyVim (se fosse via import)
  -- { import = "lazyvim.plugins.extras.editor.aerial" },
}
