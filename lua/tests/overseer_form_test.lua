-- lua/tests/overseer_form_test.lua
local form = require("overseer.form")

local schema = {
  required_str = {
    desc = "String obrigatória",
    type = "string",
  },

  optional_str = {
    desc = "String opcional",
    type = "string",
    optional = true,
  },

  password_str = {
    desc = "Senha (oculta)",
    type = "string",
    optional = true,
    conceal = true,
  },

  default_str = {
    desc = "String com default",
    type = "string",
    default = "foobar",
  },

  required_num = {
    desc = "Número obrigatório",
    type = "number",
  },

  optional_bool = {
    desc = "Boolean opcional",
    type = "boolean",
    optional = true,
  },

  optional_enum = {
    desc = "Enum opcional",
    type = "enum",
    optional = true,
    choices = { "first", "second", "third" },
  },
}

form.open("Teste Overseer Form", schema, {}, function(params)
  vim.notify(vim.inspect(params), vim.log.levels.INFO)
  print(vim.inspect(params))
end)
