return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,         -- do not set background color
        dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        overrides = function(colors) -- add/modify highlights
            return {}
        end,
        theme = "wave",              -- Load "wave" theme
        -- theme = "lotus",              -- Load "wave" theme
        background = {               -- map the value of 'background' option to a theme
            dark = "wave",           -- try "dragon" !
            light = "lotus"
        },
      })
      vim.cmd("colorscheme kanagawa")
      -- vim.cmd("colorscheme kanagawa-lotus")
    end,
  },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = function()
  --     local gruvbox = require("gruvbox")
  --     gruvbox.setup({
  --       terminal_colors = true,
  --       undercurl = true,
  --       underline = true,
  --       bold = true,
  --       italic = {
  --         strings = true,
  --         emphasis = true,
  --         comments = true,
  --         operators = false,
  --         folds = true,
  --       },
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       invert_intend_guides = false,
  --       inverse = true,
  --       contrast = "", -- can be "hard", "soft" or empty string
  --       palette_overrides = {},
  --       overrides = {
  --         ["@lsp.type.member.typescript"] = { fg = gruvbox.palette.bright_blue },
  --         ["htmlTagN"] = { fg = gruvbox.palette.bright_yellow },
  --       },
  --       dim_inactive = false,
  --       transparent_mode = true,
  --     })
  --     vim.cmd("colorscheme gruvbox")
  --     vim.o.background = "dark"
  --     -- INFO: Workaround for the inverse option above, that messed up the statusline colors
  --     vim.api.nvim_set_hl(0, "StatusLine", { reverse = false })
  --     vim.api.nvim_set_hl(0, "StatusLineNC", { reverse = false })
  --   end
  -- },
}
