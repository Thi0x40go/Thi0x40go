return {
  {
    "neovim/nvim-lspconfig",
    opts =
    {
      servers =
      {
        emmet_language_server =
        {
          filetypes =
          { "html", "css", "scss", "javascript", "typescript", "vue", "twig", "htmldjango" }
        }
      }
    }
  }
}
