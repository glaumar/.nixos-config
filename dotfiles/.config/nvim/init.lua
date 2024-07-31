if vim.g.vscode then
   -- VSCode extension
else
    -- ordinary Neovim

end

-- hilight line and column
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- code fold
vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = true

-- use system clipboard by default
vim.opt.clipboard = 'unnamedplus'

-- set <space> as leader key
vim.g.mapleader = ' '
--  add an empty line below the current line
vim.api.nvim_set_keymap('n', '<leader><space>', 'o<Esc>', { noremap = true, silent = true })
-- no highlight
vim.api.nvim_set_keymap('n', '<leader>h', ':nohlsearch<CR>', { noremap = true, silent = true })
-- close other bufferks
vim.api.nvim_set_keymap('n', '<leader>bo', ':%bd!|e #|bd #|normal`"<CR>', { noremap = true, silent = true })

-- use register z
vim.api.nvim_set_keymap('n', '<leader>z', '"z', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>z', '"z', { noremap = true, silent = true })
