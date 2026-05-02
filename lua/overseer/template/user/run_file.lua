-- lua/overseer/template/user/run_file.lua
return {
  name = "Executar Arquivo Atual",
  builder = function()
    -- Pega o arquivo atual
    local file = vim.fn.expand("%:p")
    local cmd = {}
    
    -- Define o comando baseado no tipo de arquivo
    if vim.bo.filetype == "python" then
      cmd = { "python3", file }
    elseif vim.bo.filetype == "javascript" then
      cmd = { "node", file }
    elseif vim.bo.filetype == "lua" then
      cmd = { "lua", file }
    elseif vim.bo.filetype == "cs" then
      cmd = { "dotnet", "run" }
      return {
        cmd = cmd,
        cwd = vim.fn.expand("%:p:h"),
        components = {
          { "on_output_quickfix", open_on_exit = "failure" },
          "default",
        },
      }
    else
      -- Retorna falso se não souber executar
      return false
    end
    return {
      cmd = cmd,
      components = {
        -- Abre o quickfix se houver erro na saída
        { "on_output_quickfix", open_on_exit = "failure" },
        "default",
      },
    }
  end,
  -- Condição: só aparece se o arquivo tiver algo escrito
  condition = {
    callback = function(search)
      return vim.fn.expand("%") ~= ""
    end,
  },
}