return {
  {
    "Vigemus/iron.nvim",
    keys = {
      {
        "<leader>sc",
        function()
          require("iron.core").repl_for(vim.bo.filetype)
        end,
        desc = "Abrir REPL",
      },
      {
        "<leader>sl",
        function()
          require("iron.core").send_line()
        end,
        desc = "Enviar linha para REPL",
      },
      {
        "<leader>sv",
        function()
          require("iron.core").visual_send()
        end,
        mode = "v",
        desc = "Enviar seleção para REPL",
      },
    },
    main = "iron.core",
    opts = {
      config = {
        scratch_repl = true,
        repl_definition = {
          cs = {
            command = { "dotnet-repl", "--default-kernel", "csharp" },
          },
        },
        repl_open_cmd = function(bufnr)
          return require("iron.view").split.vertical.botright(0.4)(bufnr)
        end,
      },
    },
  },
}
