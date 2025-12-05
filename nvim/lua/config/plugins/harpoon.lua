return {
  {
    'theprimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- 'nvim-lua/popup.nvim',
    },
    config = function()
      local harpoonMark = require('harpoon.mark')
      local harpoonUi = require('harpoon.ui')
      local set = vim.keymap.set

      set('n', '<leader>ha', harpoonMark.add_file, { desc = '[H]arpoon [A]dd file' })
      set('n', '<leader>hc', harpoonMark.clear_all, { desc = '[H]arpoon [C]lear all files' })
      set('n', '<leader>ht', harpoonUi.toggle_quick_menu, { desc = '[H]arpoon [T]oggle menu' })

      set('n', '<leader>hn', function() harpoonUi.nav_file(1) end, { desc = '[H]arpoon file 1' })
      set('n', '<leader>he', function() harpoonUi.nav_file(2) end, { desc = '[H]arpoon file 2' })
      set('n', '<leader>hi', function() harpoonUi.nav_file(3) end, { desc = '[H]arpoon file 3' })
      set('n', '<leader>ho', function() harpoonUi.nav_file(4) end, { desc = '[H]arpoon file 4' })
      set('n', '<leader>hh', function() harpoonUi.nav_file(5) end, { desc = '[H]arpoon file 5' })
      set('n', '<leader>h,', function() harpoonUi.nav_file(6) end, { desc = '[H]arpoon file 6' })
      set('n', '<leader>h.', function() harpoonUi.nav_file(7) end, { desc = '[H]arpoon file 7' })
    end
  },
}
