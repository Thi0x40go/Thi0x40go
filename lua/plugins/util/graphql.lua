return {
  {
    "Thi0x40go/graphql-explorer.nvim",
    dir = "~/scratch/graphql-explorer.nvim/",
    opts = {
      connections = {
        {
          name = "Countries API",
          url = "https://countries.trevorblades.com/",
          headers = {}
        },
        {
          name = "Local Dev",
          url = "http://localhost:4000/",
          headers = {
            ["Authorization"] = "Bearer seu-token-aqui"
          }
        }
      }
    },
    config = function(_, opts)
      require("graphql-explorer").setup(opts)
    end,
    keys = {
      { "<leader>gxs", "<cmd>GraphQLSelectConnection<cr>", desc = "Selecionar Conexão GraphQL" },
      { "<leader>gxe", "<cmd>GraphQLExplorerToggle<cr>", desc = "Abrir/Fechar Schema Explorer" },
      { "<leader>gxr", "<cmd>GraphQLExecute<cr>", desc = "Executar Query GraphQL" },
      { "<leader>gxd", "<cmd>GraphQLDownloadSchema<cr>", desc = "Baixar Schema do Endpoint" },
    }
  }
}
