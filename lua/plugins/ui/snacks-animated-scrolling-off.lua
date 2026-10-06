return {
	"folke/snacks.nvim",
	opts = {
		scroll = {
			enabled = false, -- Disable scrolling animations
		},
    winbar = {
      enabled = false, -- Desativa a barra no topo para não repetir com a de baixo
    },
    bigfile = {
      enabled = true,
      notify = true,
      size = 1.0 * 1024 * 1024, -- 1MB
      line_length = 500, -- Detecta arquivos minificados com linhas > 500 caracteres em média
    },
  },
}
