return {
  {
    "Thi0x40go/kiro-cli.nvim",
    -- dir = "~/.config/nvim/kiro.nvim",
    name = "kiro.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {
      trust_all_tools = true,
    },
    keys = {
      {
        "<leader>ak",
        function()
          require("kiro").toggle({ position = "float" })
        end,
        desc = "Kiro CLI (Flutuante)",
        mode = { "n", "t" }
      },
    },
    config = function(_, opts)
      require("kiro").setup(opts)
    end,
  },
}
