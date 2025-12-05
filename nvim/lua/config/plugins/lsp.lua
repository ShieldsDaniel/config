return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
        'saghen/blink.cmp',
        -- { 'mason-org/mason.nvim',          config = true },
        -- { 'mason-org/mason-lspconfig.nvim' },
        {
          "mason-org/mason-lspconfig.nvim",
          opts = {},
          dependencies = {
            {
              "mason-org/mason.nvim",
              opts = {
                ui = {
                  icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                  }
                }
              }
            },
            "neovim/nvim-lspconfig",
          },
        },
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      },
    },
    init_options = {
      userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        rust = "html",
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local on_attach = function(_, bufnr)
        -- in this case, we create a function that lets us more easily define mappings specific
        -- for lsp related items. it sets the mode, buffer and description for us each time.
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'lsp: ' .. desc
          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('<leader>do', vim.lsp.buf.hover, 'LSP: Show [D][o]cumentation')
        nmap('<leader>di', vim.diagnostic.open_float, 'LSP: Show [D][i]agnostic')
        nmap('<leader>ff', vim.lsp.buf.format, 'LSP: [F]ormat [F]ile')

        -- Create a command `:Format` local to the LSP buffer
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })
      end

      vim.lsp.config('clangd', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config('html',
        { capabilities = capabilities, on_attach = on_attach, filetypes = { 'html', 'twig', 'hbs' } })
      vim.lsp.config('rust_analyzer', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config('ts_ls', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config('emmet_ls', { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config('angularls', {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'html.angular', 'html', 'htmlangular' }
      })
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        on_attach = on_attach,
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            globals = { "vim" }
          }
        },
      })
      -- vim.lsp.config('eslint', { capabilities = capabilities, on_attach = on_attach })

      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   callback = function(args)
      --     local client = vim.lsp.get_client_by_id(args.data.client_id)
      --     if not client then
      --       return
      --     end
      --     if client:supports_method('textDocument/formatting') then
      --       -- Format the current buffer on save
      --       vim.api.nvim_create_autocmd('BufWritePre', {
      --         buffer = args.buf,
      --         callback = function()
      --           vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
      --           print(client.name)
      --           if client.name == 'ts_ls' then
      --             vim.cmd(':silent %!prettier --stdin-filepath %<CR>')
      --             vim.cmd(':w<CR>')
      --           end
      --         end,
      --       })
      --     end
      --   end,
      -- })

      -- Diagnostic keymaps
      vim.keymap.set('n', '<leader>dm', vim.diagnostic.open_float, { desc = 'Open floating [D]iagnostic [M]essage' })
      vim.keymap.set('n', '<leader>dl', vim.diagnostic.setqflist, { desc = 'Open [D]iagnostics [L]ist' })
    end
  },
}
