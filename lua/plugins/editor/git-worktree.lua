return {
  {
    "polarmutex/git-worktree.nvim",
    version = "^2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      {
        "<leader>gws",
        function()
          local ext = require("telescope").extensions.git_worktree
          if ext.git_worktree then
            ext.git_worktree()
          elseif ext.git_worktrees then
            ext.git_worktrees()
          end
        end,
        desc = "Listar / Trocar Worktree",
      },
      {
        "<leader>gwc",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "Criar Novo Worktree",
      },
    },
  },
}
