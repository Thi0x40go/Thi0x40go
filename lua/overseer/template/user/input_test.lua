-- lua/overseer/template/user/input_test.lua
return {
  name = "Tarefa com Input",
  params = {
    my_flag = {
      type = "boolean",
      name = "Ativar flag especial?",
      default = false, -- Com default, OverseerRun pula. Use OverseerBuild ou <C-e>
      order = 1,
    },
    env_choice = {
      type = "enum",
      name = "Ambiente",
      choices = { "dev", "prod" },
      default = "dev",
      order = 2,
    }
  },
  builder = function(params)

    return {
      cmd = { "echo", "Rodando..." },
      env = { 
        FLAG = params.my_flag and "1" or "0",
        ENV = params.env_choice 
      }
    }
  end,
}
