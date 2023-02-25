local map = vim.keymap.set
local opt = { silent = true, noremap = true }

-- buffer
map('n', 'gh', '0', opt )
map('n', 'gl', '$', opt )

map('v', 'gh', '0', opt )
map('v', 'gl', '$', opt )

map('n', 'dL', 'd$', opt )
map('n', 'dH', 'd0', opt )

map('n', 'cL', 'c$', opt )
map('n', 'cH', 'c0', opt )

map('n', 'yL', 'y$', opt )
map('n', 'yH', 'y0', opt )

map('n', 'th', '<c-w>h', opt )
map('n', 'tj', '<c-w>j', opt )
map('n', 'tk', '<c-w>k', opt )
map('n', 'tl', '<c-w>l', opt )

vim.cmd [[
    nnoremap x "_x
    nnoremap X "_X
]]

map('n', '<c-L>', 'o<ESC>', opt )
map('n', '<c-H>', 'O<ESC>', opt )

vim.cmd [[
map <expr> n  'Nn'[v:searchforward]
map <expr> N  'nN'[v:searchforward]
]]

map('n', 'Q', '<Nop>', opt )

map('n', 'U', '<c-r>', opt )

-- vim.cmd("nnoremap ' `")

-- map('n', ';', '$a;<ESC>', opt )
map('n', ',', '$a,<ESC>', opt )

vim.cmd [[
    nnoremap <c-c> "+Y
    vnoremap <c-c> "+y
]]

vim.cmd [[
vnoremap / :<c-u>let temp_variable=@"<CR>gvy:<c-u>let @/='\V<C-R>=escape(@",'/\')<CR>'<CR>:let @"=temp_variable<CR>:<c-u>set hlsearch<CR>
]]
