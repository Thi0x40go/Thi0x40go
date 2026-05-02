return {
  name = "Mise - Node 14",
  params = function()
    return {
      comando = {
        desc = "Comando obrigatório",
        type = "string",
      },
    }
  end,
  builder = function(params)
    return {
cmd = {
  "mise x node@14.17.0 --",
  params.comando
}
    }
  end,
}
