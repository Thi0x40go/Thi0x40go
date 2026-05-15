return {
  {
    "vaijab/gemini-cli.nvim",
    build = ":GeminiBuild",
    opts = {
      -- Sincronização de contexto automática com o Gemini CLI
    },
    config = function(_, opts)
      require("gemini").setup(opts)
    end,
    keys = {
      { "<leader>gb", "<cmd>GeminiBuild<cr>", desc = "Compilar Ponte do Gemini" },
      { "<leader>gr", "<cmd>GeminiRestartServer<cr>", desc = "Reiniciar Servidor Gemini" },
      {
        "<leader>ag",
        function()
          Snacks.terminal.toggle("gemini", { win = { position = "float" } })
        end,
        desc = "Gemini CLI (Flutuante)",
        mode = { "n", "t" }
      },
      {
        "<leader>ah",
        function()
          Snacks.terminal.toggle("gemini", { win = { position = "bottom" } })
        end,
        desc = "Gemini CLI (Horizontal)",
        mode = { "n", "t" }
      },
      {
        "<leader>av",
        function()
          Snacks.terminal.toggle("gemini", { win = { position = "right" } })
        end,
        desc = "Gemini CLI (Vertical)",
        mode = { "n", "t" }
      },
    },
  },
}
