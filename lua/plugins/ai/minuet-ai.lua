return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("minuet").setup({
        provider = "gemini",
        provider_options = {
          gemini = {
            model = "gemini-2.5-flash",
            max_tokens = 32,
            stream = true,
          },
          -- openai_fim_compatible = {
          --   model = "qwen2.5-coder:3b",
          --   end_point = "http://127.0.0.1:11434/v1/completions",
          --   api_key = "TERM",
          --   name = "Ollama",
          --   stream = false,
          --   optional = {
          --     max_tokens = 24,
          --     temperature = 0.2,
          --   },
          -- }
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
        debounce = 200,
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
