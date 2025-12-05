return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
      cmdline = {
        completion = { ghost_text = { enabled = false } },
        keymap = {
          preset = 'cmdline',
          ['<C-d>'] = {
            function(cmp)
              if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then return cmp.accept() end
            end,
            'show_and_insert',
            'select_next',
          },
        },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {},
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', {
        silent = true,
        expr = true,
        desc = "[A]ccept Copilot suggestion"
      })
      vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Next()', {
        silent = true,
        expr = true,
        desc = "Next ([J] movement) Copilot suggestion"
      })
      vim.api.nvim_set_keymap("i", "<C-k>", 'copilot#Previous()', {
        silent = true,
        expr = true,
        desc = "Previous ([K] movement) Copilot suggestion"
      })
      vim.keymap.set("i", "<C-s>", '<cmd>Copilot panel<cr>', {
        desc = "[C]opilot [S]uggestions"
      })
    end
  },
}
