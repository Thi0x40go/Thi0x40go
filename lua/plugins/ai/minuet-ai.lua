return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local api_key = os.getenv("GEMINI_API_KEY")
      if not api_key then
        vim.notify("Minuet AI: GEMINI_API_KEY não encontrada!", vim.log.levels.ERROR)
      end

      require("minuet").setup({
        provider = "gemini",
        provider_options = {
          gemini = {
            model = "gemini-2.5-flash",
            system = "Você é um auto-completar ultra-curto. Forneça APENAS a continuação imediata da palavra ou linha. Proibido gerar funções, blocos ou comentários.",
            max_tokens = 32,
            stream = true,
          },
        },
        virtualtext = {
          enable = true,
          auto_trigger_ft = { "*" },
          keymap = {
            accept = "<A-y>",
            next = "<A-n>",
            prev = "<A-p>",
            dismiss = "<A-e>",
          },
        },
        throttle = 1000, -- Aumentado para estabilidade
        debounce = 400,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      if not opts.sources then opts.sources = {} end
      table.insert(opts.sources, 1, {
        name = "minuet",
        group_index = 1,
        priority = 100,
      })

      opts.performance = opts.performance or {}
      opts.performance.fetching_timeout = 2000
    end,
  },
}
