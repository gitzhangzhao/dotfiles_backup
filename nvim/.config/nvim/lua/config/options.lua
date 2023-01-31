-- universal
local o = vim.o
local g = vim.g
local wo = vim.wo
local bo = vim.bo
local set = vim.opt

-- update time (affect many plugins)
set.updatetime = 500
-- set signcolumn=yes
-- ignore case insensitive
set.ignorecase = true

set.laststatus = 3

-- row and column line background
set.cul = true
-- set.cuc = true
vim.cmd [[
" smart highlight row and column line background
autocmd InsertLeave,WinEnter * set cul 
" autocmd InsertLeave,WinEnter * set cuc
autocmd InsertEnter,WinLeave * set nocul
" autocmd InsertEnter,WinLeave * set nocuc
]]

-- fold
set.foldenable = true
set.foldmethod = 'expr'
set.foldlevel = 999
set.foldexpr = 'nvim_treesitter#foldexpr()'
-- <space> for fold
vim.cmd [[
function! OnSpace()
    if foldlevel('.')
        if foldclosed('.') != -1
            return 'zO'
        else
            return 'za'
        endif
    else
        return "\<Space>"
    endif
endfunction
nnoremap <silent> <Space> @=(OnSpace())<CR>
]]

-- tab
-- Let backspace delete indent
set.softtabstop = 4
-- An indentation every four columns
set.tabstop = 4
-- Use indents of 4 spaces
set.shiftwidth = 4
set.expandtab = true

-- split
-- Puts new vsplit windows to the right of the current
set.splitright = true
-- Puts new split windows to the bottom of the current
set.splitbelow = true

-- codeing
set.encoding = 'utf-8'
set.fileencodings = { 'utf8', 'gb2312', 'gbk', 'gb18030' }

-- syntax
vim.cmd('syntax enable')

-- save global variables
-- set viminfo+=!
-- set iskeyword+=_,$,@,%,#,-

-- filetype
vim.cmd [[
filetype plugin indent on 
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
" autocmd filetype verilog setlocal commentstring=//\ %s
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
]]

-- backup
o.backup = false
o.writebackup = false
vim.cmd('setlocal noswapfile')

-- mouse
-- automatically enable mouse usage
set.mouse = 'a'
-- hide the mouse cursor while typing
set.mousehide = true
set.selectmode = { 'mouse', 'key' }

-- scroll remine
-- minumum lines to keep above and below cursor
set.scrolloff = 10

-- hidden characters
set.list = true
vim.cmd [[
set listchars=tab:↳\ ,trail:·,extends:↷,precedes:↶
]]

-- Disable continuation of comments to the next line
vim.cmd [[
augroup FORMATOPTIONS
    autocmd!
    autocmd filetype * set fo-=c fo-=r fo-=o
augroup END
]]

-- prevent nvim from clearing cb on exit
vim.cmd [[
    autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))
]]

-- color setting
vim.opt.termguicolors = true

-- cursor
vim.cmd [[
au VimEnter * set guicursor= | call chansend(v:stderr, "\x1b[ q")
au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
au WinLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
]]


