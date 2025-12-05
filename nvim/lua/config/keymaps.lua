local set = vim.keymap.set

set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
set("n", "<space>x", ":.lua<CR>")
set("v", "<space>x", ":lua<CR>")

-- Remap for dealing with word wrap
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Allow moving highlighted lines up and down
set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected text down' })
set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected text up' })

-- Keep cursor in the middle when moving in larger jumps
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- Copy/Paste to/from system clipboard
set('n', '<leader>yy', '"*yy', { desc = 'Yank to system clipboard' })
set('n', '<leader>p', '"*p', { desc = 'Paste from system clipboard' })
set('v', '<leader>y', '"*y', { desc = 'Yank to system clipboard' })
set('x', '<leader>y', '"*y', { desc = 'Yank to system clipboard' })

-- Allow for pasting without losing current yanked register
set('x', '<leader>p', '"_dP', { desc = 'Paste in visual mode without overwriting yank register' })

-- Utils
set('i', '<C-c>', '<Esc>')
set('n', 'Q', '<nop>')
set('i', '<Esc><BS>', '<C-w>')
set('n', '<leader>hl', vim.cmd.nohlsearch, { desc = 'Search [H]igh[l]ight clear' })

-- Quickfix/Location List helpers
set('n', '<leader>qo', vim.cmd.copen, { desc = '[Q]uickfix list [O]pen' })
set('n', '<leader>qc', vim.cmd.cclose, { desc = '[Q]uickfix list [C]lose' })

-- Cool/fun remaps
set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Find and [R]eplace [A]ll occurrences of word under cursor' })

-- Personal
set('n', '<C-f>', '<cmd>silent !tmux neww project-selector<CR>', { desc = 'Open new/existing tmux session' })
set('n', '<C-s>', '<cmd>silent !tmux split-window -p 40 -h cheatsheet --vim<CR>', { desc = 'Open cheatsheet' })

set('n', 's', '<Nop>')
set('n', 'S', '<Nop>')

set('n', '<leader>ex', '<cmd>! chmod +x %<CR>', { desc = 'Make file [ex]ecutable' })
