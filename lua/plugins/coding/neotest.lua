return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Issafalcon/neotest-dotnet",
      "fredrikaverpil/neotest-golang",
      "marilari88/neotest-vitest",
    },
    keys = {
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Alternar Painel de Testes" },
      { "<leader>tn", function() require("neotest").run.run() end, desc = "Rodar Teste Próximo" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Rodar Testes do Arquivo" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Ver Log do Teste" },
    },
    opts = function()
      return {
        adapters = {
          require("neotest-dotnet"),
          require("neotest-golang"),
          require("neotest-vitest"),
          require("neotest-jdtls"),
        },
      }
    end,
  },
}
