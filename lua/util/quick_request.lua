-- lua/util/quick_request.lua
local M = {}

function M.create_request()
  local line = vim.api.nvim_get_current_line()
  local ft = vim.bo.filetype
  local method, path

  -- Lógica para Java Spring
  if ft == "java" then
    method, path = line:match("@(%w+)Mapping%(\"(.-)\"%)")
    if not method then
      method, path = line:match("@(%w+)Mapping%(.-value%s*=%s*\"(.-)\"")
    end
  
  -- Lógica para Express / Node.js
  elseif ft == "javascript" or ft == "typescript" then
    method, path = line:match("%.(%w+)%(['\"](.-)['\"]")
  
  -- Lógica para C# (ASP.NET)
  elseif ft == "cs" then
    method, path = line:match("%[(%w+)%(\"(.-)\"%)%]")
  end

  if method and path then
    method = method:upper()
    -- Ajuste para nomes de métodos comuns
    if method == "HTTPGET" then method = "GET" end
    if method == "HTTPPOST" then method = "POST" end
    
    -- Limpa o path se tiver variáveis {id} ou :id
    local clean_path = path:gsub("{.-}", "1"):gsub(":([%w_]+)", "1")
    
    local content = {
      "### Requisição Rápida (" .. ft .. ")",
      method .. " http://localhost:8080" .. clean_path,
      "Content-Type: application/json",
      "",
      (method == "POST" or method == "PUT") and "{\n  \"example\": \"data\"\n}" or ""
    }

    vim.cmd("vsplit")
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "quick_request_" .. os.time() .. ".http")
    vim.api.nvim_buf_set_option(buf, "filetype", "http")
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
    vim.api.nvim_win_set_buf(0, buf)
    
    vim.notify("Requisição gerada para " .. ft .. "!", vim.log.levels.INFO)
  else
    vim.notify("Não encontrei uma rota ou mapeamento nesta linha.", vim.log.levels.WARN)
  end
end

return M
