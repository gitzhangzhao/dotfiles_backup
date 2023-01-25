" File              : .vimrc
" Author            : zhangzhao <zhangzhao@ihep.ac.cn>
" Date              : 07.06.2022
" Last Modified Date: 07.06.2022
" Last Modified By  : zhangzhao <zhangzhao@ihep.ac.cn>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             universal settings                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                                " disable vi mode
set et
set sm
set lbr
set go=                                         " don't graphically buttons
set sw=4
set fo+=mB
set number                                      " Line numbers on
set report=0                                    " report which line has been changed
set lazyredraw                                  " draw delay
set ignorecase                                  " case insensitive search
set updatetime=500
set signcolumn=yes
set linespace=0
set backspace=2                                 " backspace for indent, eol and start
set history=1000                                " history number
set ttimeoutlen=0                               " reduce reaction time
set shortmess=atOI                              " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set mousemodel=popup
set selection=inclusive
set fileformats=unix,dos                        " Use Unix as the standard file type
set runtimepath+=~/.vim/snippets                " define my snippets
set fillchars=stl:\ ,stlnc:\ ,fold:\ ,vert:\│   " fill character
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility

" row and column line background
set cul
" set cuc
autocmd InsertLeave,WinEnter * set cul " smart highlight row and column line background
" autocmd InsertLeave,WinEnter * set cuc
autocmd InsertEnter,WinLeave * set nocul
" autocmd InsertEnter,WinLeave * set nocuc

" fold
set foldenable                                                   " enable fold
" autocmd FileType c,cpp setlocal foldmethod=syntax              " fold for c and cpp
" autocmd FileType python,verilog,vim setlocal foldmethod=indent " fold for py,verilog and vim
" set to expr for Treesitter
set foldmethod=expr
set foldlevel=999
set foldexpr=nvim_treesitter#foldexpr()
" <space> for fold
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


" index
set autoindent " auto indet
set cindent    " indent style : C

" tab
set softtabstop=4 " Let backspace delete indent
set tabstop=4     " An indentation every four columns
set shiftwidth=4  " Use indents of 4 spaces
set expandtab

" split
set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current

" searching highlight
set hlsearch 
set incsearch

" codeing
set encoding=utf-8
scriptencoding utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=utf8,gb2312,gbk,gb18030;
set termencoding=utf-8
set helplang=cn

" syntax highlighting
syntax on
syntax enable

" save global variables
set viminfo+=!
set iskeyword+=_,$,@,%,#,-

" filetype
filetype on
filetype plugin indent on " Automatically detect file types
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript

" autoread and autowrite
set autoread 
set autowrite " Automatically write a file when leaving a modified buffer

" backup
set nobackup
set nowritebackup
setlocal noswapfile
" set backup
" set writebackup
" set backupdir=~/.vim/tmp
" set backupext=.bak
" set noundofile
" silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)

" mouse
set mouse=a " automatically enable mouse usage
set mousehide " hide the mouse cursor while typing
set selectmode=mouse,key

" match
set showmatch    " Show matching brackets/parentthesis
set matchtime=5  " Show matching time
set scrolloff=10 " Minumum lines to keep above and below cursor
set matchpairs+=<:>
" format
set formatexpr=CocActionAsync('formatSelected')

" hidden characters
set list
set listchars=tab:↳\ ,trail:·,extends:↷,precedes:↶
",eol:↴,space:⋅

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                key binding                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" H and L move to beginning or end of a line
nnoremap H 0
nnoremap L $

" visual mode is the same as normal mode
vnoremap H 0
vnoremap L $

" delete to beginning or end of a line
nnoremap dL d$
nnoremap dH d0

" same as dL
nnoremap cL c$
nnoremap cH c0

" copy to beginning or end of a line
nnoremap yL y$
nnoremap yH y0

" switch windows
nnoremap th <C-w>h
nnoremap tj <C-w>j
nnoremap tk <C-w>k
nnoremap tl <C-w>l

" x don't save to clipboard
nnoremap x "_x
nnoremap X "_X

" add a new line in normal mode
nnoremap <C-L> o<Esc>
nnoremap <C-H> O<Esc>

" switch window
nnoremap <silent> gh <c-w>h
nnoremap <silent> gl <c-w>l

" searching location
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" move a line up and down quickly
nnoremap K  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap J  :<c-u>execute 'move +'. v:count1<cr>

" same as K J but in visual mode
vnoremap <silent> K :m '<-2gv=gv<cr>gv
vnoremap <silent> J :m '>+1gv=gv<cr>gv

" quit ex mode
nnoremap Q <Nop>

" undo the undo
nnoremap U <C-r>

" noremap <CR> gd

" jump to marked
nnoremap ' `

" add ; in normal mode
nnoremap ; $a;<ESC>
nnoremap , $a,<ESC>

" set clipboard
" visual: Ctrl+c copy the selected area; normal: Ctrl+c copy a line
" defaut to use system clipboard
" set clipboard=unnamedplus
nnoremap <C-c> "+Y
vnoremap <C-c> "+y

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Define <F1>-<F4> mapping                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <F3> for compile code
" <F4> for run code


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Define <F5>-<F8> mapping                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <F5> for undotree
nnoremap <silent><F5> :UndotreeToggle<CR>

" <F6> for nerd tree
nnoremap <silent><F6> :NERDTreeToggle<CR>

" <F8> for quickfix_toggle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Define <F9>-<F12> mapping                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <F9> format
nnoremap <silent><F9> :Format<CR>
xmap <silent><F9> <Plug>(coc-format-selected)


" <F10> format verilog
" autocmd FileType verilog nnoremap <silent><F10> :AsyncRun -save=1 -post=checktime -silent istyle $(VIM_FILEPATH) && rm $(VIM_FILEPATH).orig <CR>

" <F12> switching between header and implementaion
nnoremap <silent><F12> :CocCommand clangd.switchSourceHeader<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-plug                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" download pulg.vim
" plug.vim {{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()
" indent line
Plug 'lukas-reineke/indent-blankline.nvim'
" surroud
Plug 'tpope/vim-surround'
" C-a/x
Plug 'tpope/vim-speeddating'
" more repeat
Plug 'tpope/vim-repeat'
" pairs
Plug 'jiangmiao/auto-pairs'
" comment
Plug 'tpope/vim-commentary'
" quickly move
Plug 'psliwka/vim-smoothie'
Plug 'easymotion/vim-easymotion'
" git state
" Plug 'airblade/vim-gitgutter'
" format with a common character
Plug 'junegunn/vim-easy-align'
" multiline selected
Plug 'mg979/vim-visual-multi',{'branch': 'master'}
" input state
Plug 'h-hg/fcitx.nvim'
" number
Plug 'myusuf3/numbers.vim'
" show the context of the current buffer contents
" Plug 'wellle/context.vim'
" statistics startup time
" Plug 'dstein64/vim-startuptime'
" status line
Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" header
Plug 'alpertuna/vim-header'
" nerdtree
Plug 'preservim/nerdtree',{ 'on':  'NERDTreeToggle' }
" snippets
Plug 'honza/vim-snippets'
" text objects
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'glts/vim-textobj-comment'
Plug 'tommcdo/vim-exchange'
" themes
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'jacoborus/tender.vim'
" Plug 'cocopon/iceberg.vim'
" Plug 'junegunn/seoul256.vim'
" lastplace
Plug 'farmergreg/vim-lastplace'
" undotree
Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
" sudo
Plug 'lambdalisue/suda.vim'
" disable search highlighting
Plug 'romainl/vim-cool'
" command line completion
Plug 'gelguy/wilder.nvim'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'for': ['markdown']}
" LeaderF
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension', 'on': ['Leaderf','LeaderfFunction'] }
" translate
Plug 'voldikss/vim-translator'
" treesitter and context
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
" highlight the word under current cursor
Plug 'RRethy/vim-illuminate'
" highlight sets of matching text
Plug 'andymass/vim-matchup'
" improve starup time
Plug 'lewis6991/impatient.nvim'
" enhance the fold looks
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
" better git signs
Plug 'lewis6991/gitsigns.nvim'
" scroll bar
Plug 'petertriho/nvim-scrollbar'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          settings after plug#end                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for improve startup time
lua require('impatient')

" these configurations may be overridden by plugins
" set comment strings
autocmd filetype verilog setlocal commentstring=//\ %s
augroup FORMATOPTIONS
    autocmd!
    autocmd filetype * set fo-=c fo-=r fo-=o " Disable continuation of comments to the next line
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                plug settings                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentline
" let g:indentLine_char     = '┊'
" let g:html_indent_inctags = "html,body,head,tbody"
" let g:html_indent_script1 = "inc"
" let g:html_indent_style1  = "inc"
" let g:indentLine_setConceal = 2
" let g:indentLine_concealcursor = ""

" number.vim
let g:numbers_exclude = ['gundo', 'minibufexpl', 'nerdtree']

" vim-surround
vmap " S"
vmap ] S]
vmap [ S]
vmap ' S'
vmap > S>
vmap < S>
vmap / S/
vmap ) S)
vmap ( S)
vmap } S}
vmap { S}

" vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" color settings
set termguicolors
set t_Co=256
" background color
" highlight LineNr guibg       = NONE
" highlight SignColumn guibg   = NONE
" highlight Normal guibg       = NONE
" highlight CursorLineNr guibg = NONE
" highlight Cursor guifg=white
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
" cursor color
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10
" keep cursor shape to underline
au VimEnter * set guicursor= | call chansend(v:stderr, "\x1b[ q")
au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
au WinLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")

" themes
" theme style
set background=dark
" themes selection
" gruvbox
" let g:gitgutter_override_sign_column_highlight = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_bold = 1
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
" paper
" colorscheme Paper
" everforest
let g:everforest_backgroud                 = 'soft'
let g:everforest_sign_column_background    = 'none'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_current_word              = 'underline'
let g:everforest_ui_contrast               = 'low'
let g:everforest_better_performance        = 1
let g:everforest_enable_italic             = 1
let g:everforest_show_eob                  = 0
colorscheme everforest
" colorscheme nord
" onedark
" let g:onedark_terminal_italics = 1
" colorscheme onedark

" NerdTree
let g:NERDTreeDirArrowExpandable   = ''
let g:NERDTreeDirArrowCollapsible  = ''
let NERDTreeShowHidden             = 1
let NERDTreeMinimalUI              = 1
let NERDTreeMapOpenInTab           = ''
" close the buffer when only NERDTree exits
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-cpp-enhanced-highlight
let g:cpp_member_variable_highlight              = 1
let g:cpp_class_scope_highlight                  = 1
let g:cpp_class_decl_highlight                   = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight        = 1
let g:cpp_concepts_highlight                     = 1

" airline
let g:airline_powerline_fonts                    = 1
let g:Powerline_symbols                          = 'fancy'

" vim-header
let g:header_auto_add_header    = 0
let g:header_field_author       = 'zhangzhao'
let g:header_field_author_email = 'zhangzhao@ihep.ac.cn'

" context.vim
let g:context_add_mappings = 0
let g:context_highlight_tag = '<hide>'

" smoothie
let g:smoothie_no_default_mappings = 1
silent! nmap <unique> <C-J> <Plug>(SmoothieDownwards)
silent! nmap <unique> <C-K> <Plug>(SmoothieUpwards)
silent! vmap <unique> <C-J> <Plug>(SmoothieDownwards)
silent! vmap <unique> <C-K> <Plug>(SmoothieUpwards)

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '<':'>'}

" suda
let g:suda_smart_edit = 1

" easymotion
noremap f <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
noremap fl <Plug>(easymotion-lineforward)
noremap fh <Plug>(easymotion-linebackward)
noremap f. <Plug>(easymotion-repeat)

" wilder
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': ['<tab>', '<Down>'],
      \ 'previous_key': '<s-tab>',
      \ })
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'highlights': {
      \   'border': 'Normal',
      \ },
      \ 'border': 'rounded',
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ })))

" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_ShowRelativePath = 0
let g:Lf_UseCache = 0
let g:Lf_HideHelp = 1
let g:Lf_UseVersionControlTools = 0
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
noremap <silent><C-f> :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s", expand("<cword>"))<CR><CR>
noremap <silent><C-g> :<C-U><C-R>=printf("Leaderf rg -e %s", expand("<cword>"))<CR><CR>
noremap <silent><leader>f :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap <silent><leader>g :<C-U><C-R>=printf("Leaderf! function --right %s", "")<CR><CR>

" coc
" install extensions
let g:coc_global_extensions = ['coc-clangd', 'coc-snippets', 'coc-json', 'coc-sh', 'coc-prettier', 'coc-tabnine', 'coc-vimlsp']
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use `g[` and `g[` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
" Use K to show documentation in preview window
nnoremap <silent> D :call ShowDocumentation()<CR>
" do the 'hover' Automatically
autocmd CursorHold *.c,*.cpp,*.h,*.sh,*.vim silent call ShowDocumentation()
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    silent call CocActionAsync('doHover')
  else
    silent call feedkeys('D', 'm')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming
nmap gn <Plug>(coc-rename)
" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
let g:airline#extensions#coc#enabled = 1
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" for coc-git
nmap <silent> gm <Plug>(coc-git-commit)
nmap <silent> gk <Plug>(coc-git-chunkinfo)

" markdown-preview
let g:mkdp_auto_start = 1
let g:mkdp_port = '8080'
let g:mkdp_open_to_the_world = 1
let g:mkdp_theme = 'light'

" vim-translator
nmap <silent> gt <Plug>TranslateW
vmap <silent> gt <Plug>TranslateWV
let g:translator_window_max_width = 0.9
let g:translator_window_max_height = 0.9

" indent_blanline
let g:indent_blankline_space_char_blankline = " "
let g:indent_blankline_show_first_indent_level = v:false
highlight IndentBlanklineContextStart guifg=#C678DD gui=underline
highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine
let g:indent_blankline_show_current_context = "true"
" let g:indent_blankline_show_current_context_start = "true"
let g:indent_blankline_use_treesitter_scope = "true"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             settings for lua                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua<<EOF
-- treesitter
require'nvim-treesitter.configs'.setup {
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {"vim", "c", "make", "markdown", "json", "diff", "cpp", "bash"},
    -- 启用代码高亮功能
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
        -- 启用增量选择
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
        }
        },
    illuminate = {
        enable = true
    },
    matchup = {
        enable = true
    },
    indent = {
        enable = true
    }
    }

-- ufo
local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end
-- global handler
-- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
-- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
require('ufo').setup({
    fold_virt_text_handler = handler
})

-- gitsigns
require('gitsigns').setup {
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },

  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Actions
    map('n', 'gp', gs.preview_hunk)
    map('n', 'gb', gs.toggle_current_line_blame)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}

-- scroll bar
require("scrollbar").setup({
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    hide_if_all_visible = false, -- Hides everything if all lines are visible
    throttle_ms = 100,
    handle = {
        text = " ",
        color = nil,
        color_nr = nil, -- cterm
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Cursor = {
            text = "•",
            priority = 0,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
        },
        Search = {
            text = { "-", "=" },
            priority = 1,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 2,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 3,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 4,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 5,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 6,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "Normal",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsDelete",
        },
    },
    excluded_buftypes = {
        "terminal",
    },
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "noice",
    },
    autocmd = {
        render = {
            "BufWinEnter",
            "TabEnter",
            "TermEnter",
            "WinEnter",
            "CmdwinLeave",
            "TextChanged",
            "VimResized",
            "WinScrolled",
        },
        clear = {
            "BufWinLeave",
            "TabLeave",
            "TermLeave",
            "WinLeave",
        },
    },
    handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = false, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
    },
})
require('scrollbar.handlers.gitsigns').setup()
EOF
