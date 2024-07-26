if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
    vim.opt.number = true
    vim.opt.relativenumber = true

    vim.o.foldmethod = 'syntax'
    vim.o.foldenable = true
end
