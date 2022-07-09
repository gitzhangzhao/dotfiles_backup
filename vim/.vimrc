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
set showcmd                                     " Show partial commands in status line and Selected characters/lines in visual mode
set report=0                                    " report which line has been changed
set lazyredraw                                  " draw delay
set ignorecase                                  " case insensitive search
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
set encoding=UTF-8
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
set backup
set writebackup
set backupdir=~/.vim/tmp
set backupext=.bak
set noswapfile
set noundofile
silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)

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

" wrapped lines goes down/up to next row, rather than next line in file
noremap j gj
noremap k gk

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
nnoremap <silent> gw :ChooseWin<cr>
nnoremap <silent> gh <c-w>h
nnoremap <silent> gl <c-w>l
nnoremap <silent> gj <c-w>j
nnoremap <silent> gk <c-w>k

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

" jump to marked
nnoremap ' `

" <CR> for search
nnoremap <CR> gd

" add ; in normal mode
nnoremap ; $a;<ESC>
nnoremap , $a,<ESC>

" set clipboard
" visual: Ctrl+c copy the selected area; normal: Ctrl+c copy a line
" defaut to use system clipboard
" set clipboard=unnamedplus
nnoremap <C-c> "+Y
vnoremap <C-c> "+y

" convert between dec and hex
" command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
" function! s:Dec2hex(line1, line2, arg) range
"     if empty(a:arg)
"         if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
"             let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
"         else
"             let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
"         endif
"         try
"             execute a:line1 . ',' . a:line2 . cmd
"         catch
"             echo 'Error: No decimal number found'
"         endtry
"     else
"         echo printf('%x', a:arg + 0)
"     endif
" endfunction

" command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
" function! s:Hex2dec(line1, line2, arg) range
"     if empty(a:arg)
"         if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
"             let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
"         else
"             let cmd = 's/0x\x\+/\=submatch(0)+0/g'
"         endif
"         try
"             execute a:line1 . ',' . a:line2 . cmd
"         catch
"             echo 'Error: No hex number starting "0x" found'
"         endtry
"     else
"         echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
"     endif
" endfunction

" nnoremap <silent> ghd :Hex2dec<CR>
" nnoremap <silent> gdh :Dec2hex<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Define <F5>-<F8> mapping                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <F5> for undotree
nnoremap <silent><F5> :UndotreeToggle<CR>

" <F7> for nerd tree
nnoremap <silent><F7> :NERDTreeToggle<CR>

" <F8> for tagbar
nnoremap <silent><F6> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Define <F9>-<F12> mapping                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <F9> format Markdown
autocmd FileType markdown nnoremap <silent><F9> :AsyncRun -save=1 -post=checktime -silent chmod o+w $(VIM_FILEPATH) && docker run --rm -v $(VIM_FILEDIR):/work tmknom/prettier --write --parser=markdown $(VIM_FILENAME) && chmod o-w $(VIM_FILEPATH) <CR>

" <F10> format verilog
autocmd FileType verilog nnoremap <silent><F10> :AsyncRun -save=1 -post=checktime -silent istyle $(VIM_FILEPATH) && rm $(VIM_FILEPATH).orig <CR>

" <F11> format C
autocmd FileType c,cpp nnoremap <silent><F11> :ClangFormat<CR>
autocmd FileType c,cpp vnoremap <silent><F11> :ClangFormat<CR>

" <F12> jump to header (:A)
function! s:a(cmd)
    let name = expand('%:r')
    let ext = tolower(expand('%:e'))
    let sources = ['c', 'cc', 'cpp', 'cxx']
    let headers = ['h', 'hh', 'hpp', 'hxx']
    for pair in [[sources, headers], [headers, sources]]
        let [set1, set2] = pair
        if index(set1, ext) >= 0
            for h in set2
                let aname = name.'.'.h
                for a in [aname, toupper(aname)]
                    if filereadable(a)
                        execute a:cmd a
                        return
                    end
                endfor
            endfor
        endif
    endfor
endfunction
command! A call s:a('e')
command! AV call s:a('botright vertical split')
nnoremap <silent><F12> :A<CR>
nnoremap <silent>\<F12> :AV<CR>

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
" static checking
Plug 'dense-analysis/ale' ,{ 'for' : [ 'c', 'cpp', 'python', 'verilog', 'sh' ] }
" code syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra',{ 'for': ['c', 'bison', 'flex', 'cpp'] }
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
" code format
Plug 'rhysd/vim-clang-format',{ 'on': 'ClangFormat', 'for' : [ 'c', 'cpp' ] }
" quickly move
Plug 'psliwka/vim-smoothie'
Plug 'easymotion/vim-easymotion'
" git state
Plug 'airblade/vim-gitgutter'
" enhance search
Plug 'junegunn/vim-slash'
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
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }, }
Plug 'junegunn/fzf.vim', {'on': ['Files', 'Rg'] }
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
Plug 'SirVer/ultisnips'
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
" Plug 'jacoborus/tender.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'cocopon/iceberg.vim'
" Plug 'junegunn/seoul256.vim'
" markdown
Plug 'godlygeek/tabular', { 'for': ['markdown'] }
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
            !cargo build --release --locked
        else
            !cargo build --release --locked --no-default-features --features json-rpc
        endif
    endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') , 'for': ['markdown'] }
" lastplace
Plug 'farmergreg/vim-lastplace'
" undotree
Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
" minimap
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
" sudo
Plug 'lambdalisue/suda.vim'
" disable search highlighting
Plug 'romainl/vim-cool'
" set paste mode
Plug 'roxma/vim-paste-easy'
" shell commands
Plug 'skywind3000/asyncrun.vim'
" window switch
Plug 't9md/vim-choosewin', { 'on': 'ChooseWin' }
" fast fold
Plug 'Konfekt/FastFold'
" match highlight
Plug 'andymass/vim-matchup'
" command line completion
Plug 'gelguy/wilder.nvim'
" code completion
Plug 'jayli/vim-easycomplete'
" translator
Plug 'voldikss/vim-translator'
" convert between dec and hex
Plug 'glts/vim-magnum'
Plug 'glts/vim-radical'
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

" number.vim
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree', 'minimap']

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
let g:everforest_sign_column_background    = 'none'
let g:everforest_diagnostic_text_highlight = 1
let g:everforest_diagnostic_line_highlight = 1
let g:everforest_current_word              = 'underline'
let g:everforest_ui_contrast               = 'low'
let g:everforest_better_performance        = 1
let g:everforest_enable_italic             = 1
let g:everforest_show_eob                  = 0
colorscheme everforest
" onedark
" let g:onedark_terminal_italics = 1
" colorscheme onedark

" ale
" let g:ale_linters_explicit =1
let g:ale_sign_column_always         = 1
let g:ale_set_highlights             = 0
let g:ale_sign_warning               = ''
let g:ale_sign_error                 = ''
let g:ale_sign_info                  = ''
let g:ale_lint_on_enter              = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str         = 'E'
let g:ale_echo_msg_warning_str       = 'W'
let g:ale_echo_msg_info_str          = 'I'
let g:ale_echo_msg_format            = '[%linter%] %s [%severity%]'
" 禁用默认INSERT模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
let g:ale_lint_on_text_changed       = 'normal'
let g:ale_lint_on_insert_leave       = 1

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

" fzf
nnoremap <C-f> :Files <CR>
nnoremap <C-g> :Rg    <CR>

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

" vim-markdown
let g:vim_markdown_folding_disabled    = 1
let g:vim_markdown_conceal             = 0
let g:vim_markdown_conceal_code_blocks = 0

" markdown-composer
let g:markdown_composer_address = "192.168.31.102"
let g:markdown_composer_port    = 8080

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '<':'>'}

" easycomplete
let g:easycomplete_diagnostics_enable = 0
let g:easycomplete_lsp_checking       = 0
let g:easycomplete_menu_skin = {
        \   "buf": {
        \      "kind":"",
        \      "menu":"[B]",
        \    },
        \   "snip": {
        \      "kind":"",
        \      "menu":"[S]",
        \    },
        \   "dict": {
        \      "kind":"",
        \      "menu":"[D]",
        \    },
        \   "tabnine": {
        \      "kind":"",
        \      "menu":"[TN]",
        \    },
        \ }
  let g:easycomplete_filetypes = {"r": {
        \ "whitelist": []
        \ }}
  let g:easycomplete_tabnine_config = {
        \ 'line_limit': 800,
        \ 'max_num_result': 5,
        \ }
  let g:easycomplete_lsp_type_font = {
        \ 'class': "",     'color': "",
        \ 'constant': "",  'constructor': "",
        \ 'enum': "",      'enummember': "",
        \ 'field': "料",    'file': '',
        \ 'folder': "",    'function': "ƒ",
        \ 'interface': "", 'keyword': "",
        \ 'snippet': "",   'struct': "פּ",
        \ 'text': "",      'typeparameter': "",
        \ 'variable': "",  'module':'',
        \ 'event': '',
        \ 'r':'', 't':'',
        \ 'f':'', 'c':'',
        \ 'u':'𝘶', 'e':'𝘦',
        \ 's':'פּ', 'v':'',
        \ 'i':'𝘪', 'm':'',
        \ 'p':'', 'k':'𝘬',
        \ 'o':"𝘰", 'd':'𝘥',
        \ 'l':"𝘭", 'a':"𝘢",
        \ }

" minimap
let g:minimap_auto_start = 1
function! CheckLeftBuffers()
  if tabpagenr('$') == 1
    let i = 1
    while i <= winnr('$')
      if getbufvar(winbufnr(i), '&buftype') == 'help' ||
          \ getbufvar(winbufnr(i), '&buftype') == 'quickfix' ||
          \ exists('t:NERDTreeBufName') &&
          \ bufname(winbufnr(i)) == t:NERDTreeBufName ||
          \ bufname(winbufnr(i)) == '__Tag_List__' ||
          \ bufname(winbufnr(i)) == '-MINIMAP-'
        let i += 1
      else
        break
      endif
    endwhile
    if i == winnr('$') + 1
      qall
    endif
    unlet i
  endif
endfunction
autocmd BufEnter * call CheckLeftBuffers()

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

" translator
nnoremap <silent> gt <Plug>TranslateW
vnoremap <silent> gt <Plug>TranslateWV
let g:translator_default_engines = ['google']

" radical
let g:radical_no_mappings = 1
nnoremap <silent> grb  <Plug>RadicalCoerceToBinary
nnoremap <silent> gro  <Plug>RadicalCoerceToOctal
nnoremap <silent> grd  <Plug>RadicalCoerceToDecimal
nnoremap <silent> grh  <Plug>RadicalCoerceToHex
nnoremap <silent> gA   <Plug>RadicalView
xnoremap <silent> gA   <Plug>RadicalView
