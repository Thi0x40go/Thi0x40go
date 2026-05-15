return {
  {
    "NickJAllen/java-helpers.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    keys = {
      {
        "<leader>jn",
        function()
          require("java-helpers").create_java_file()
        end,
        desc = "Novo Arquivo Java (Menu)",
      },
      {
        "<leader>jc",
        function()
          require("java-helpers").create_java_class()
        end,
        desc = "Criar Classe Java",
      },
      {
        "<leader>ji",
        function()
          require("java-helpers").create_java_interface()
        end,
        desc = "Criar Interface Java",
      },
      {
        "<leader>je",
        function()
          require("java-helpers").create_java_enum()
        end,
        desc = "Criar Enum Java",
      },
    },
    opts = {
      -- Configurações opcionais
      template_dir = nil, -- Usa os templates padrão do plugin
    },
  },
}
