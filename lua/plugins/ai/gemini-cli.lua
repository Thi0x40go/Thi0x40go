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
      { "<leader>gb", "<cmd>GeminiBuild<cr>", desc = "Build Gemini Bridge" },
      { "<leader>gr", "<cmd>GeminiRestartServer<cr>", desc = "Restart Gemini Server" },
      { 
        "<leader>ag", 
        function()
          Snacks.terminal.toggle("gemini", { win = { position = "float" } })
        end, 
        desc = "Toggle Gemini CLI (Floating)" 
      },
      { 
        "<leader>ah", 
        function()
          Snacks.terminal.toggle("gemini", { win = { position = "bottom" } })
        end, 
        desc = "Toggle Gemini CLI (Horizontal)" 
      },
      { 
        "<leader>av", 
        function()
          Snacks.terminal.toggle("gemini", { win = { position = "right" } })
        end, 
        desc = "Toggle Gemini CLI (Vertical)" 
      },
    },
  },
}
