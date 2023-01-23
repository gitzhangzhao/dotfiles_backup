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

" prevent vim from clearing the clipboard on exit
autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))

" row and column line background
set cul
" set cuc
autocmd InsertLeave,WinEnter * set cul " smart highlight row and column line background
" autocmd InsertLeave,WinEnter * set cuc
autocmd InsertEnter,WinLeave * set nocul
" autocmd InsertEnter,WinLeave * set nocuc

" fold
set foldenable                                                 " enable fold
autocmd FileType c,cpp setlocal foldmethod=syntax              " fold for c and cpp
autocmd FileType python,verilog,vim setlocal foldmethod=indent " fold for py,verilog and vim
set foldlevel=9999
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
"带有如下符号的单词不要被换行分割
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
" set backup
" set writebackup
" set backupdir=~/.vim/tmp
" set backupext=.bak
" set noswapfile
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

" hidden characters
set list
set listchars=tab:↳\ ,trail:·,extends:↷,precedes:↶

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

noremap <CR> gd

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

" <F7> for tagbar
nnoremap <silent><F7> :TagbarToggle<CR>

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
call plug#begin('~/.vim/plugged')
" indent line
Plug 'Yggdroot/indentLine'
" tpope'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
" pairs
Plug 'jiangmiao/auto-pairs'
" comment
Plug 'tpope/vim-commentary'
" code syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra',{ 'for': ['c', 'bison', 'flex', 'cpp'] }
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
" quickly move
Plug 'psliwka/vim-smoothie'
Plug 'easymotion/vim-easymotion'
" git state
Plug 'airblade/vim-gitgutter'
" format with a common character
Plug 'junegunn/vim-easy-align'
" multiline selected
Plug 'mg979/vim-visual-multi',{'branch': 'master'}
" input
Plug 'vim-scripts/fcitx.vim'
" number
Plug 'myusuf3/numbers.vim'
" show the context of the current buffer contents
Plug 'wellle/context.vim'
" statistics startup time
" Plug 'dstein64/vim-startuptime'
" enhance vim diff
Plug 'chrisbra/vim-diff-enhanced'
" status line
Plug 'kshenoy/vim-signature'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" header
Plug 'alpertuna/vim-header'
" nerd tree and tagbar
Plug 'preservim/nerdtree',{ 'on':  'NERDTreeToggle' }
Plug 'preservim/tagbar',{ 'on': 'TagbarToggle' }
" highlight cursor word
Plug 'RRethy/vim-illuminate'
" generate tags(ctags,global) automatically
Plug 'ludovicchabant/vim-gutentags'
" snippets
Plug 'honza/vim-snippets'
" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
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
" window switch
Plug 't9md/vim-choosewin', { 'on': 'ChooseWin' }
" fast fold
Plug 'Konfekt/FastFold'
" match highlight
Plug 'andymass/vim-matchup'
" command line completion
Plug 'gelguy/wilder.nvim'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" markdown preview
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
" LeaderF
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension', 'on': ['Leaderf','LeaderfFunction'] }
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          settings after plug#end                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
let g:indentLine_char     = '┊'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"
let g:indentLine_setConceal = 2
let g:indentLine_concealcursor = ""

" number.vim
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

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

" themes settings
set t_Co=256
" background 
" highlight LineNr guibg       = NONE
" highlight SignColumn guibg   = NONE
" highlight Normal guibg       = NONE
" highlight CursorLineNr guibg = NONE
" highlight Cursor guifg=white
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10

" themes configuration
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
colorscheme everforest
let g:everforest_sign_column_background    = 'none'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_current_word              = 'underline'
let g:everforest_ui_contrast               = 'low'
let g:everforest_better_performance        = 1
let g:everforest_enable_italic             = 1
let g:everforest_show_eob                  = 0
" colorscheme nord
" onedark
" let g:onedark_terminal_italics = 1
" colorscheme onedark

" gtags && gutentags"
let g:gutentags_modules           = ['ctags', 'gtags_cscope']
let g:gutentags_ctags_executable  = '/usr/bin/ctags'
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
" gutentags搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root      = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile     = '.tags'
" 将自动生成的 cctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir         = expand('~/.cache/tags')
" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args  = ['--fields=+niazS']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--extra=+q']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" ctags使用快捷键
" nnoremap <CR> <c-]>
" 增加cscope使用的快捷键(C-[和esc按键一致，可以直接esc+s进行查找)
nnoremap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-[>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>

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

" vim-gitgutter
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_preview_win_floating = 1
nnoremap gp <Plug>(GitGutterPreviewHunk)

" context.vim
let g:context_add_mappings = 0
let g:context_highlight_tag = '<hide>'

" tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = max([25, winwidth(0) / 5])

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
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))

" choose-window
let g:choosewin_overlay_enable = 1
nnoremap <silent> gw :ChooseWin<cr>

" LeaderF
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
noremap <silent><C-f> :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s", expand("<cword>"))<CR><CR>
noremap <silent><C-g> :<C-U><C-R>=printf("Leaderf rg -e %s", expand("<cword>"))<CR><CR>
noremap <silent><C-m> :<C-U><C-R>=printf("Leaderf mru  %s", "")<CR><CR>
noremap <silent><leader>f :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap <silent><leader>g :<C-U><C-R>=printf("Leaderf! function --right %s", "")<CR><CR>

" coc
" install extensions
let g:coc_global_extensions = ['coc-clangd', 'coc-snippets', 'coc-json', 'coc-sh', 'coc-prettier', 'coc-tabnine']

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
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> D :call ShowDocumentation()<CR>
" do the 'hover' Automatically
autocmd CursorHold *.c,*.cpp,*.h,*.sh call ShowDocumentation()
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming
nmap rn <Plug>(coc-rename)
" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')
" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
let g:airline#extensions#coc#enabled = 1
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" markdown-preview
let g:mkdp_auto_start = 1
let g:mkdp_open_to_the_world = 1
let g:mkdp_port = '8080'
let g:mkdp_theme = 'light'
