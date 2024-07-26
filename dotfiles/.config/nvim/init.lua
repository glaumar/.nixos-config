if vim.g.vscode then
   -- VSCode extension
else
    -- ordinary Neovim

end

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = true

--  add an empty line below the current line
vim.api.nvim_set_keymap('n', '<space><space>', 'o<Esc>', { noremap = true, silent = true })
