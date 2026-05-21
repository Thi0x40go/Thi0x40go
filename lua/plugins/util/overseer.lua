return {
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerToggle", "OverseerTaskAction", "OverseerShell" },
  keys = {
    {
      "<leader>ow",
      "<cmd>OverseerToggle<cr>",
      desc = "Lista de tarefas",
    },
    {
      "<leader>oo",
      "<cmd>OverseerRun<cr>",
      desc = "Executar tarefa",
    },
    {
      "<leader>ot",
      "<cmd>OverseerTaskAction<cr>",
      desc = "Ação da tarefa",
    },
    {
      "<leader>os",
      "<cmd>OverseerShell<cr>",
      desc = "Shell interativo",
    },
  },
  opts = {
    -- Carrega explicitamente os templates customizados
    templates = {
      "builtin",
      "user.run_file",
      "user.frontend_dev",
      "user.java_project",
      "user.auto_test",
      "user.build_project",
      "user.input_test",
      "user.orchestrator-build-run",
      "user.orchestrator-test-suite",
    },
    -- Estratégia padrão: terminal (abre um buffer de terminal)
    strategy = "terminal",
    -- Configuração da janela lateral de tarefas
    task_list = {
      direction = "right",
      min_width = 25,
      max_width = 40,
      default_detail = 1,
      bindings = {
        ["?"] = "ShowHelp",
        ["<CR>"] = "RunAction",
        ["<C-e>"] = "Edit",
        ["o"] = "Open",
        ["<C-v>"] = "OpenVsplit",
        ["<C-s>"] = "OpenSplit",
        ["<C-f>"] = "OpenFloat",
        ["p"] = "TogglePreview",
      },
    },
    -- actions = require("overseer.actions.example"),
    component_aliases = {
      default = {
        "on_exit_set_status",
        "on_complete_notify",
      },
    },
  },
}
