return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>Rr", function() require("kulala").run() end, desc = "Rodar requisição (atual)" },
      { "<leader>Ra", function() require("kulala").run_all() end, desc = "Rodar todas as requisições" },
      { "<leader>Rp", function() require("kulala").jump_prev() end, desc = "Ir para requisição anterior" },
      { "<leader>Rn", function() require("kulala").jump_next() end, desc = "Ir para próxima requisição" },
      { "<leader>Re", function() require("kulala").set_selected_env() end, desc = "Selecionar ambiente (Env)" },
      { "<leader>Ri", function() require("kulala").inspect() end, desc = "Inspecionar requisição (cURL)" },
      { "<leader>Rc", function() require("kulala").copy() end, desc = "Copiar como cURL" },
    },
    opts = {
      -- Configurações visuais
      display_mode = "split",
      split_direction = "vertical",
      default_view = "body",
    },
  },
}
