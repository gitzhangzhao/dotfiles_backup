-- update time (affect many plugins)
vim.opt.updatetime = 500

-- don't show mode
vim.opt.showmode = false

-- redraw time
vim.opt.redrawtime = 100

-- reduce reaction time
vim.opt.ttimeoutlen = 0

-- number
vim.opt.number = true
vim.opt.relativenumber = true

-- ignore case insensitive
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- disable nvim intro
vim.opt.signcolumn = 'yes'

-- hide cmd-line when it's not being used.
vim.opt.cmdheight = 0

-- global status line
vim.opt.laststatus = 3

-- dont show mode in cmd
vim.opt.showcmd = false

-- row and column line background
vim.opt.cul = true
-- set.cuc = true

-- line background
vim.cmd [[
" smart highlight row and column line background
autocmd InsertLeave,WinEnter * set cul 
" autocmd InsertLeave,WinEnter * set cuc
autocmd InsertEnter,WinLeave * set nocul
" autocmd InsertEnter,WinLeave * set nocuc
]]

-- last position
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- fold
vim.opt.foldenable = true
vim.opt.foldmethod = 'expr'
vim.opt.foldlevel = 99
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
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
vim.opt.softtabstop = 4
-- An indentation every four columns
vim.opt.tabstop = 4
-- Use indents of 4 spaces
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indent
-- Take indent for new line from previous line
vim.opt.autoindent = true

-- split
-- Puts new vsplit windows to the right of the current
vim.opt.splitright = true
-- Puts new split windows to the bottom of the current
vim.opt.splitbelow = true

-- codeing
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = { 'utf8', 'gb2312', 'gbk', 'gb18030' }

-- -- message
vim.opt.shortmess = 'atOTIscFS'

-- syntax
vim.cmd('syntax enable')

-- filetype
vim.cmd [[
filetype plugin indent on 
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
" autocmd filetype verilog setlocal commentstring=//\ %s
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
au BufRead,BufNewFile *.{db}   set filetype=perl
au BufRead,BufNewFile *.{dbd}   set filetype=perl
]]

-- backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.cmd('setlocal noswapfile')

-- mouse
-- automatically enable mouse usage
vim.opt.mouse = 'a'
-- hide the mouse cursor while typing
vim.opt.mousehide = true
vim.opt.selectmode = { 'mouse', 'key' }

-- scroll remine
-- minumum lines to keep above and below cursor
vim.opt.scrolloff = 10

-- hidden characters
vim.opt.list = true
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
vim.o.termguicolors = true

-- keep cursor shape
vim.cmd [[
au VimEnter * set guicursor= | call chansend(v:stderr, "\x1b[ q")
au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
au WinLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
]]

-- auto read file when changed outside of vim
vim.opt.autoread = true

-- Ignore case when completing file names and directories.
vim.opt.wildignorecase = true
