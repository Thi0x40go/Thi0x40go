return {
  desc = "Notifica no Slack ao finalizar",
  -- Define quais parâmetros esse componente aceita
  params = {
    channel = { desc = "Canal do Slack", type = "string", default = "#deploy" },
  },
  constructor = function(opts)
    return {
      on_complete = function(self, task, status)
        if status == "FAILURE" then
          -- Lógica fictícia de notificação
          vim.notify("Falha na task! Avisando " .. opts.channel, vim.log.levels.ERROR)
        end
      end,
    }
  end,
}

