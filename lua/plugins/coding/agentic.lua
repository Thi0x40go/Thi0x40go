return {
  {
    "carlos-algms/agentic.nvim",
    cmd = { "Agentic", "AgenticToggle", "AgenticNewSession" },
    opts = {
      provider = "kiro-acp", -- Usa o Kiro CLI nativamente via Agent Client Protocol (ACP)
      providers = {
        ["kiro-acp"] = {
          name = "Kiro ACP",
          command = "kiro-cli",
          args = { "acp", "--agent-engine", "v3", "--auth-method", "cli" },
          env = {},
        },
      },
      windows = {
        position = "right",
        width = "40%",
      },
    },
    keys = {
      {
        "<leader>ak",
        function()
          require("agentic").toggle()
        end,
        mode = { "n", "v", "i" },
        desc = "Abrir Chat Agentic (Kiro ACP)",
      },
      {
        "<C-\\>",
        function()
          require("agentic").toggle()
        end,
        mode = { "n", "v", "i" },
        desc = "Alternar Chat Agentic (IA)",
      },
      {
        "<leader>ac",
        function()
          require("agentic").add_selection_or_file_to_context()
        end,
        mode = { "n", "v" },
        desc = "Adicionar seleção/arquivo ao contexto",
      },
      {
        "<leader>an",
        function()
          require("agentic").new_session()
        end,
        mode = { "n", "v", "i" },
        desc = "Nova sessão de chat AI",
      },
    },
  },
}
