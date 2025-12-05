return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      animate = {
        enabled = false,
        config = function()
          vim.g.snacks_animate = false
        end
      },
      bigfile = { enabled = true },
      dashboard = require("config.plugins.snacks.dashboard"),
      explorer = { enabled = false },
      git = { enabled = false },
      gitbrowse = { enabled = false },
      image = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = false },
      picker = { enabled = true },
      notifier = {
        enabled = true,
        -- config = function()
        --   require("notify").setup({
        --     background_colour = "#1D2021",
        --   })
        -- end
      },
      quickfile = { enabled = true },
      rename = {
        enabled = true,
        config = function()
          vim.api.nvim_create_autocmd("User", {
            pattern = "OilActionsPost",
            callback = function(event)
              if event.data.actions.type == "move" then
                require('snacks.rename').rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
              end
            end,
          })
        end
      },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      toggle = { enabled = true },
      words = { enabled = true },
    },
    keys = require("config.plugins.snacks.keybinds"),
  },
}
