return {
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Abrir Visão de Diff (Local)" },
      { "<leader>gdm", "<cmd>DiffviewOpen origin/develop...HEAD<cr>", desc = "Diff com origin/develop (Estilo PR)" },
      { "<leader>gdc", "<cmd>DiffviewFileHistory --range=origin/develop..HEAD<cr>", desc = "Commits da Branch (Estilo GitLab)" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Fechar Visão de Diff" },
    },
    opts = {
      enhanced_diff_hl = true,
      use_icons = true,
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
          winbar_info = true,
        },
        file_history = {
          layout = "diff2_horizontal",
          winbar_info = true,
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 32,
        },
      },
      hooks = {
        diff_buf_read = function()
          vim.opt_local.wrap = false
          vim.opt_local.colorcolumn = ""
          vim.opt_local.cursorline = true
          vim.opt_local.fillchars:append({ diff = "╱" })
        end,
      },
    },
    config = function(_, opts)
      require("diffview").setup(opts)

      -- Cores suaves de diff inspiradas no TokyoNight / Screenshot do README (Issue #546)
      local function setup_diff_hl()
        vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#20303b" })
        vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#37222c" })
        vim.api.nvim_set_hl(0, "DiffChange", { bg = "#1f2231" })
        vim.api.nvim_set_hl(0, "DiffText", { bg = "#394b70" })
        vim.api.nvim_set_hl(0, "DiffviewDiffDelete", { fg = "#3b4261" })
      end

      setup_diff_hl()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = setup_diff_hl,
      })
    end,
  },
}
