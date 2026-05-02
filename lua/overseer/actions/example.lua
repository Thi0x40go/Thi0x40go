return {
  ["Abrir no Browser (Debug)"] = {
    desc = "Abre URL associada à tarefa (Forçado)",
    run = function(task)
      if task.metadata.url then
        vim.fn.jobstart({ "xdg-open", task.metadata.url })
      else
        vim.notify("Nenhuma URL encontrada na metadata da tarefa", vim.log.levels.WARN)
      end
    end,
  },
  ["Reiniciar com Debug"] = {
    desc = "Reinicia a tarefa com flag DEBUG",
    run = function(task)
      print("teste")
      task:restart()
    end,
  },
}
