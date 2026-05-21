return {
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern" },
        patterns = { ".git", "Makefile", "package.json", "pom.xml", "build.gradle" }, -- Adicionado padrões Java
      })
      require("telescope").load_extension("projects")
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Procurar Projetos (Telescope)" },
    },
  },
}
