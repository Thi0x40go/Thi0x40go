local M = {}

-- Caminho base global
local global_http_path = vim.fn.expand("~/Projects/http/")

-- Garante que o diretório global existe
if vim.fn.isdirectory(global_http_path) == 0 then
  vim.fn.mkdir(global_http_path, "p")
end

--- Pega o nome do projeto atual
local function get_project_name()
  local project_root = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  return project_root
end

--- Abre o seletor do Telescope para arquivos HTTP globais
function M.find_global_http()
  require("telescope.builtin").find_files({
    prompt_title = "Global HTTP Requests",
    cwd = global_http_path,
  })
end

--- Cria ou abre o arquivo HTTP específico do projeto na pasta global
function M.open_project_http()
  local project_name = get_project_name()
  local file_path = global_http_path .. project_name .. ".http"
  
  -- Verifica se o arquivo já existe antes de abrir
  local is_new_file = vim.fn.filereadable(file_path) == 0

  vim.cmd("edit " .. file_path)

  -- Se for um arquivo novo, insere o template padrão
  if is_new_file then
    local template = {
      "### Configurações de Ambiente (Variáveis)",
      "@baseUrl = http://localhost:8080/api",
      "@token = seu_token_jwt_aqui",
      "",
      "# ==========================================",
      "# API: " .. project_name,
      "# ==========================================",
      "",
      "### 1. GET Simples (Sem Auth)",
      "# @name GetAllItems",
      "GET {{baseUrl}}/items",
      "Accept: application/json",
      "",
      "### 2. GET com Query Params (Com Auth)",
      "# @name GetItemWithFilters",
      "GET {{baseUrl}}/items?status=active&limit=10",
      "Authorization: Bearer {{token}}",
      "Accept: application/json",
      "",
      "### 3. POST com Body JSON (Com Auth)",
      "# @name CreateItem",
      "POST {{baseUrl}}/items",
      "Content-Type: application/json",
      "Authorization: Bearer {{token}}",
      "",
      "{",
      "  \"name\": \"Novo Item\",",
      "  \"description\": \"Item criado via Neovim e Kulala\",",
      "  \"active\": true",
      "}",
      "",
      "### 4. PUT para Atualização (Com Auth)",
      "# @name UpdateItem",
      "PUT {{baseUrl}}/items/1",
      "Content-Type: application/json",
      "Authorization: Bearer {{token}}",
      "",
      "{",
      "  \"status\": \"inactive\"",
      "}",
      "",
      "### 5. DELETE (Com Auth)",
      "# @name DeleteItem",
      "DELETE {{baseUrl}}/items/1",
      "Authorization: Bearer {{token}}",
      "",
      "### 6. GraphQL Query",
      "# @name GraphQLSearch",
      "POST {{baseUrl}}/graphql",
      "Content-Type: application/json",
      "Authorization: Bearer {{token}}",
      "",
      "query {",
      "  findAllEntidade(searchDTO: {}, pageableDTO: {pageNumber: 0, pageSize: 10}) {",
      "    content {",
      "      id",
      "    }",
      "    totalElements",
      "  }",
      "}",
      ""
    }
    
    -- Inserir as linhas no buffer atual
    vim.api.nvim_buf_set_lines(0, 0, -1, false, template)
    
    -- Salva o arquivo automaticamente após inserir o template
    vim.cmd("write")
  end
end

return M
