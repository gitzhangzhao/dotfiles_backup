local opt = { silent = true, noremap = true }

-- buffer keymap
vim.keymap.set('n', 'gh', '0', opt )
vim.keymap.set('n', 'gl', '$', opt )

vim.keymap.set('v', 'gh', '0', opt )
vim.keymap.set('v', 'gl', '$', opt )

vim.keymap.set('n', 'dL', 'd$', opt )
vim.keymap.set('n', 'dH', 'd0', opt )

vim.keymap.set('n', 'cL', 'c$', opt )
vim.keymap.set('n', 'cH', 'c0', opt )

vim.keymap.set('n', 'yL', 'y$', opt )
vim.keymap.set('n', 'yH', 'y0', opt )

vim.keymap.set('n', 'th', '<c-w>h', opt )
vim.keymap.set('n', 'tj', '<c-w>j', opt )
vim.keymap.set('n', 'tk', '<c-w>k', opt )
vim.keymap.set('n', 'tl', '<c-w>l', opt )

vim.keymap.set('n', 'x', '"_x', opt)
vim.keymap.set('n', 'X', '"_X', opt)

vim.keymap.set('n', '<c-l>', 'o<ESC>', opt )
vim.keymap.set('n', '<c-h>', 'O<ESC>', opt )

vim.cmd [[
map <expr> n  'Nn'[v:searchforward]
map <expr> N  'nN'[v:searchforward]
]]

vim.keymap.set('n', 'Q', '<Nop>', opt )

vim.keymap.set('n', 'U', '<c-r>', opt )

-- vim.cmd("nnoremap ' `")

-- vim.keymap.set('n', ';', '$a;<ESC>', opt )
vim.keymap.set('n', ',', '$a,<ESC>', opt )

vim.cmd [[
    nnoremap <c-c> "+Y
    vnoremap <c-c> "+y
]]

vim.cmd [[
vnoremap / :<c-u>let temp_variable=@"<CR>gvy:<c-u>let @/='\V<C-R>=escape(@",'/\')<CR>'<CR>:let @"=temp_variable<CR>:<c-u>set hlsearch<CR>
]]
