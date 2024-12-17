vim.api.nvim_set_option("clipboard", "unnamed")
vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' '
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.cursorline = true
vim.opt.autoread = true
--vim.cmd 'colorscheme embark'
vim.cmd 'set relativenumber'

vim.cmd 'set tabstop=4'
vim.cmd 'set shiftwidth=4'
vim.cmd 'set expandtab'

vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set({'n', 'v'}, 'gj', 'G')
vim.keymap.set({'n', 'v'}, 'gk', 'gg')
vim.keymap.set({'n', 'v'}, 'gl', '$')
vim.keymap.set({'n', 'v'}, 'gh', '0')
vim.keymap.set('n', 'ca', 'ggVG"+y')
--vim.keymap.set('n', 'rn', ':w<CR>:!g++ % -o a.out && ./a.out && rm a.out<CR>')
vim.keymap.set('n', 'rn', function()
    vim.cmd 'w'
    vim.cmd '!g++ % -o a.out'
    vim.cmd 'term ./a.out' 
    vim.cmd '!rm ./a.out'
end, {silent = true})
vim.keymap.set('n', 'da', 'ggVGx')
vim.keymap.set('v', 'jk', '<esc>') 

vim.keymap.set('n', '<C-g>', function()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local total_lines = vim.api.nvim_buf_line_count(0)
  print("Line: " .. row .. ", Column: " .. (col + 1) .. ", Total Lines: " .. total_lines)
end, { desc = "Enhanced Ctrl+g" })

vim.keymap.set('n','da','ggVGx');
vim.keymap.set('n',' h', ':lua require("harpoon.mark").add_file()<CR>');
vim.keymap.set('n',' l', ':lua require("harpoon.ui").toggle_quick_menu()<CR>');
vim.keymap.set('n', ' j', ':lua require("harpoon.ui").nav_next()<CR>');                   
vim.keymap.set('n', ' k' ,':lua require("harpoon.ui").nav_prev()<CR>');                   


