return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true, -- Ativa o Blame inline por padrão
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- Aparece no fim da linha
        delay = 300, -- Delay de 300ms ao parar o cursor
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> • <summary>",
    },
    keys = {
      { "<leader>uB", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Alternar Git Blame Inline (Liga/Desliga)" },
    },
  },
}
