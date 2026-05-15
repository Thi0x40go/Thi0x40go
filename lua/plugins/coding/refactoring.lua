return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
    keys = {
      { "<leader>re", ":Refactor extract ", mode = "x", desc = "Extrair Função" },
      { "<leader>rf", ":Refactor extract_to_file ", mode = "x", desc = "Extrair Função para Arquivo" },
      { "<leader>rv", ":Refactor extract_var ", mode = "x", desc = "Extrair Variável" },
      { "<leader>ri", ":Refactor inline_var", mode = { "n", "x" }, desc = "Inline Variável" },
      { "<leader>rb", ":Refactor extract_block", mode = "n", desc = "Extrair Bloco" },
      { "<leader>rbf", ":Refactor extract_block_to_file", mode = "n", desc = "Extrair Bloco para Arquivo" },
    },
  },
}
