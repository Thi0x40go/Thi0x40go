return {
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    keys = {
      { "<leader>Rh", function() require("util.quick_request").find_global_http() end, desc = "  Buscar HTTP (Todos)" },
      { "<leader>RH", function() require("util.quick_request").open_project_http() end, desc = "󱂛  HTTP deste Projeto" },
      { "<leader>Rr", function() require("kulala").run() end, desc = "󰐊  Executar Requisição" },
      { "<leader>Ra", function() require("kulala").run_all() end, desc = "󰑮  Executar Todas" },
      { "<leader>Rp", function() require("kulala").jump_prev() end, desc = "󰮳  Anterior" },
      { "<leader>Rn", function() require("kulala").jump_next() end, desc = "󰮲  Próxima" },
      { "<leader>Re", function() require("kulala").set_selected_env() end, desc = "󰅟  Selecionar Env" },
      { "<leader>Ri", function() require("kulala").inspect() end, desc = "󰠮  Inspecionar (cURL)" },
      { "<leader>Rc", function() require("kulala").copy() end, desc = "󰆏  Copiar cURL" },
      { "<leader>Rg", function() require("kulala").download_graphql_schema() end, desc = "󰡄  GraphQL Schema" },
    },
    opts = {
      -- Configurações visuais
      display_mode = "split",
      split_direction = "vertical",
      default_view = "body",
    },
  },
}
