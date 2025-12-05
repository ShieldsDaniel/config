return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      }

      local branch = {
        "branch",
        icons_enabled = true,
        icon = "",
        cond = hide_in_width
      }

      local diff = {
        "diff",
        colored = true,
        symbols = { added = " ", modified = " ", removed = " " },
        cond = hide_in_width
      }

      local mode = {
        "mode",
        icon = '',
        colored = true,
        -- icon = '',
      }

      local filetype = {
        "filetype",
        cond = hide_in_width,
        icon = { align = "right" },
        colored = true,
      }

      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = ' ',
          section_separators = {},
          globalstatus = true,
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          always_show_tabline = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
        },
        sections = {
          lualine_a = { mode },
          lualine_b = { branch, diff, diagnostics },
          lualine_c = { 'filename' },
          lualine_x = {},
          lualine_y = { filetype },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {}
        },
        extensions = { 'fugitive', 'fzf', 'lazy', 'man', 'quickfix' }
      })
    end
  }
}
