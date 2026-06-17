return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "MattiasMTS/cmp-dbee",
    },
    keys = {
      {
        "<leader>D",
        function()
          require("dbee").toggle()
        end,
        desc = "DBee",
      },
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      pcall(require, "lazy")
      if package.loaded["lazy"] then
        require("lazy").load({ plugins = { "nvim-lspconfig" } })
      end
      require("dbee").setup( --[[optional config]])
    end,
  },
  {
    "MattiasMTS/cmp-dbee",
    dependencies = {
      {"kndndrj/nvim-dbee"}
    },
    ft = "sql",
    opts = {},
    config = function(_, opts)
      require("cmp-dbee").setup(opts)
      -- Monkey patch para remover o schema (ex: "public.") do nome das tabelas
      vim.schedule(function()
        local ok, Conn = pcall(require, "cmp-dbee.connection")
        if ok and Conn and type(Conn.get_flatten_structure) == "function" then
          Conn.get_flatten_structure = function(self)
            local exist = self.flatten_structure[self.id]
            if exist then return exist end

            local get_flatten_structure = function(iterable)
              local out = {}
              vim.tbl_map(function(node)
                if #node.children > 0 then
                  vim.tbl_map(function(child)
                    table.insert(out, {
                      name = child.name, -- Removido o node.name .. "."
                      schema = node.name,
                      type = child.type,
                      children = {},
                    })
                  end, node.children)
                end
              end, iterable)
              return out
            end

            local structure = self.structures[self.id]
            if structure then
              local flatten = get_flatten_structure(structure)
              self.flatten_structure[self.id] = flatten
              return flatten
            end
          end
        end
      end)
    end,
  },
  {
    "saghen/blink.compat",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "saghen/blink.compat" },
    opts = {
      sources = {
        compat = { "cmp-dbee" },
        providers = {
          ["cmp-dbee"] = { kind = "Db" }
        }
      }
    }
  },
}
