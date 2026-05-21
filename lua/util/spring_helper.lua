-- lua/overseer/template/user/spring_request.lua
-- Este script permite criar requisições Kulala rápidas a partir de anotações Spring
local M = {}

function M.create_request()
  local line = vim.api.nvim_get_current_line()
  local method, path = line:match("@(%w+)Mapping%(\"(.-)\"%)")
  
  if not method then
    -- Tenta sem aspas ou com value=
    method, path = line:match("@(%w+)Mapping%(.-value%s*=%s*\"(.-)\"")
  end

  if method then
    method = method:upper()
    if method == "REQUEST" then method = "GET" end -- Fallback
    
    -- Limpa o path se tiver variáveis {id}
    local clean_path = path:gsub("{.-}", "1")
    
    local content = {
      "### Requisição Rápida Spring Boot",
      method .. " http://localhost:8080" .. clean_path,
      "Content-Type: application/json",
      "",
      method == "POST" or method == "PUT" and "{\n  \"id\": 1\n}" or ""
    }

    -- Cria um novo buffer temporário tipo HTTP
    vim.cmd("vsplit")
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "spring_request_" .. os.time() .. ".http")
    vim.api.nvim_buf_set_option(buf, "filetype", "http")
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
    vim.api.nvim_win_set_buf(0, buf)
    
    vim.notify("Requisição gerada! Ajuste a porta se necessário.", vim.log.levels.INFO)
  else
    vim.notify("Nenhuma anotação Spring Mapping encontrada nesta linha.", vim.log.levels.WARN)
  end
end

return M
