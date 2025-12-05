return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Git: [G]it [S]tatus' })
      -- vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'Git: [G]it [P]ush' })
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs                        = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged                 = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable          = true,
      signcolumn                   = true,
      numhl                        = false,
      linehl                       = false,
      word_diff                    = false,
      watch_gitdir                 = {
        follow_files = true
      },
      auto_attach                  = true,
      attach_to_untracked          = false,
      current_line_blame           = false,
      current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil,
      max_file_length              = 40000,
      preview_config               = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
      on_attach                    = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']g', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']g', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, { desc = 'Git: [g]it next hunk' })

        map('n', '[g', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[g', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, { desc = 'Git: [g]it prev hunk' })
        vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = 'Git: [G]it [b]lame line' })
        vim.keymap.set('n', '<leader>gba', gitsigns.blame, { desc = 'Git: [G]it [B]lame [a]ll' })
        vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Git: [G]it [p]review hunk' })
      end,
    }
  },
}
