return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_git_status = true,
      enable_diagnostics = true,
      filesystem = {
        group_empty_dirs = true, -- Agrupa pastas vazias no estilo IntelliJ (ex: src/main/java)
      },
      window = {
        popup = {
          position = { col = "5%", row = "2" },
          size = function(state)
            local root_name = vim.fn.fnamemodify(state.path, ":t")
            local sw = vim.o.columns
            return { width = math.floor(sw * 0.50), height = "15" }
          end,
        },
      },
    },
  },
}
