return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- Configuração para Vue / Nuxt
        volar = {
          filetypes = { "vue", "javascript", "typescript", "javascriptreact", "typescriptreact", "json" },
          init_options = {
            vue = {
              hybridMode = true, -- Modo híbrido é mais estável no Neovim
            },
          },
        },
        vtsls = {
          -- Adiciona o plugin do Vue ao servidor de TypeScript
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = vim.fn.stdpath("data") .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                    languages = { "vue" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
          },
        },
        -- Desativa o omnisharp explicitamente para não conflitar com o Roslyn
        omnisharp = {
          enabled = false,
        },
        pyright = {},
        twiggy = {
          filetypes = { "twig", "html.twig", "html", "htmldjango" },
        },
        emmet_ls = {
          filetypes = {
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "svelte",
            "pug",
            "typescriptreact",
            "vue",
            "twig",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
            includeLanguages = {
              twig = "html",
            },
          },
        },
      },
    },
  },
}
