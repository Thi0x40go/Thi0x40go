-- lua/overseer/template/user/build_project.lua
return {
  name = "Build do Projeto",
  params = {
    -- Define parâmetros que o usuário preencherá em um menu
    mode = {
      type = "enum",
      name = "Modo de Compilação",
      choices = { "debug", "release" },
      default = "debug",
    },
    clean = {
      type = "boolean",
      name = "Limpar antes de compilar?",
      default = false,
    },
  },
  builder = function(params)
    local cmd = { "./build.sh" }
    if params.clean then
      table.insert(cmd, "--clean")
    end
    table.insert(cmd, "--" .. params.mode)
    return {
      cmd = cmd,
      components = {
        "default",
        "slack_notify",
        -- Componente personalizado: toca um som se falhar (se tiver o utilitário)
        { "on_exit_set_status" },
      },
    }
  end,
}
