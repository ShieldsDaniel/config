-- Set highlight on search
vim.o.hlsearch       = true
vim.o.background     = "dark"

-- Make line numbers default
vim.o.relativenumber = true
vim.o.numberwidth    = 4

-- offset
vim.o.scrolloff      = 8
vim.o.sidescrolloff  = 8

-- Indenting and tabs
vim.o.tabstop        = 4
vim.o.softtabstop    = 4
vim.o.shiftwidth     = 4
vim.o.expandtab      = true

-- status line
vim.go.laststatus    = 3
vim.o.laststatus     = 3

-- Backups and Undo Tree
vim.o.swapfile       = false
vim.o.undodir        = os.getenv('HOME') .. '/.vim/undodir'

-- Save undo history
vim.o.undofile       = true

-- Save undo history
vim.o.undofile       = true

-- Decrease update time
vim.o.updatetime     = 250
vim.o.timeoutlen     = 300

vim.o.splitbelow     = false

-- log level
vim.log.level        = 'off'

vim.cmd [[highlight IndentBlanklineChar guifg=#928374 gui=nocombine]]

-- Setup spell checking
vim.opt.spell = true
vim.opt.spelllang = 'en'
vim.opt.spelloptions = 'camel'

local spellGroup = vim.api.nvim_create_augroup('SpellGroup', { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "typescript",
    "html",
    "javascript",
    "markdown",
    "text",
    "scss",
    "css",
    "json",
    "rust",
    "scss",
    "elm",
    "lua",
  },
  callback = function()
    vim.schedule(function()
      match = vim.fn.expand("<amatch>")
      vim.opt_local.spell = true;
      vim.opt_local.spelllang = 'en';
      if match ~= "text" then
        vim.opt_local.spelloptions = 'camel';
        vim.opt_local.spellcapcheck = '';
      end
    end)
  end,
  group = spellGroup,
})
