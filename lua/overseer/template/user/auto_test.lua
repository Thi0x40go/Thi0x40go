return {
  name = "Auto-Test (Watch)",
  builder = function()
    return {
      -- Comando a ser executado
      cmd = { "npm", "test" },
      components = {
        "default",
        -- O segredo está aqui:
        {
          "restart_on_save",
          -- Caminhos para vigiar (pode ser relativo ou absoluto)
          paths = { vim.fn.getcwd() },
          delay = 200, -- Espera 200ms após o save para rodar
          interrupt = true, -- Interrompe a execução anterior se uma nova começar
        },
      },
    }
  end,
}
