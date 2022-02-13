""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File              : .vimrc
" Author            : zhangzhao <zhangzhao@ihep.ac.cn>
" Date              : 21.05.2020
" Last Modified Date: 14.09.2021
" Last Modified By  : zhangzhao <zhangzhao@ihep.ac.cn>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimrc for zhangzhao ,need powerline-font, nerd-font，ctags and gtags
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Universal settings                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ts=4
set sw=4
set et
set lbr
set fo+=mB
set sm
set selection=inclusive
set mousemodel=popup
set nocompatible   " 去掉vi一致性模式，避免bug
set ttimeoutlen=0  " 降低fcitx插件的反应时间
set lazyredraw     " 延迟绘制（提升性能）
set fileformats=unix,dos
" set paste

" syntax support
syntax on
syntax enable

"将H和L设置为定位到行首和行尾
"设置一些常用映射
nnoremap H 0
nnoremap L $

"可视状态下，设置H和L功能与normal一致
vnoremap H 0
vnoremap L $

"d到行首或行尾
nnoremap dL d$
nnoremap dH d0

"c到行首或行尾
nnoremap cL c$
nnoremap cH c0

"y到行首或行尾
nnoremap yL y$
nnoremap yH y0

"x删除不保存到剪切板
nnoremap x "_x
nnoremap X "_X

"添加一行但不进插入模式
nnoremap <C-L> o<Esc>
nnoremap <C-H> O<Esc>

"tt按键切换窗口
nnoremap tt <C-w>w

"回车快速搜索
nnoremap <CR> gd

"n和N固定搜索位置
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

"快速上移下移一行
nnoremap K  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap J  :<c-u>execute 'move +'. v:count1<cr>

"v模式下快速上移下移多行
vnoremap <silent> J :m '>+1gv=gv<cr>gv
vnoremap <silent> K :m '<-2gv=gv<cr>gv

"避免进入Ex模式
nnoremap Q <Nop>

"U撤销撤销操作
nnoremap U <C-r>

"打开root文件时无法保存
nnoremap ww :w !sudo tee > /dev/null %<CR>

"跳转到mark时，跳转到行列的具体位置
nnoremap ' `

"normal下;自动添加末尾分号
nnoremap ; $a;<ESC>

" Use system clipboard
" visual: Ctrl+c copy the selected area; normal: Ctrl+c copy a line
" defaut to use system clipboard
" set clipboard=unnamedplus
nnoremap <C-c> "+Y
vnoremap <C-c> "+y

" prevent vim from clearing the clipboard on exit
autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))

" 设置基本一些特性
" 行列线设置
set cul
" set cuc

"智能高亮光标所在行
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set shortmess=atI      " 启动的时候不显示援助乌干达儿童的提示
set go=                " 不要图形按钮
set showcmd            " 输入的命令显示出来，看的清楚些
" set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界(不建议)

" 设置折叠
set foldenable            " 允许折叠
"autocmd FileType java,c,cpp
set foldmethod=syntax
set foldlevel=999999      " 默认开始不折叠
" autocmd Filetype * AnyFoldActivate               " activate for all filetypes
" set foldlevel=99 " Open all folds

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

"显示中文帮助
set encoding=UTF-8

"自动缩进风格
"set autoindent
set cindent "c语言风格的缩进

"Tab键的宽度
"统一缩进为4
set softtabstop=4
set tabstop=4
set shiftwidth=4
"在行和段开始处使用制表符
set smarttab
set expandtab
"显示行号
set number
"历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"编码设置
set langmenu=zh_CN.UTF-8
set fileencodings=utf8,gb2312,gbk,gb18030;
set termencoding=utf-8
set helplang=cn
"总是显示状态行
set cmdheight=1

"文件类型检测设置
"侦测文件类型
filetype on
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype plugin indent on
autocmd FileType java,c,cpp set commentstring=//\ %s

"保存全局变量
set viminfo+=!
"带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

"filetype添加
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=markdown
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript

" 自动注释
" 在注释行之下新开一行时不要自动加注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"设置当文件被改动时自动载入
set autoread
"自动保存
set autowrite
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"在处理未保存或只读文件的时候，弹出确认
set confirm

"不要使用vi的键盘模式，而是vim自己的
set nocompatible
"去掉输入错误的提示声音
set noeb

"设置备份
"允许备份
set backup
" 保存时备份
set writebackup
" 备份文件地址，统一管理
set backupdir=~/.vim/tmp
" 备份文件扩展名
set backupext=.bak
" 禁用交换文件
set noswapfile
" 禁用 undo文件
set noundofile
" 创建目录，并且忽略可能出现的警告
silent! call mkdir(expand('~/.vim/tmp'), "p", 0755)

"搜索忽略大小写
set ignorecase
set linespace=0
"增强模式中的命令行自动完成操作
set wildmenu
"使回格键（backspace）正常处理indent, eol, start等
set backspace=2
"可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
"在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
"高亮显示匹配的括号
set showmatch
"匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2
"光标移动到buffer的顶部和底部时保持10行距离
set scrolloff=10

"记录退出行
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         Define <F11>-<F12> mapping                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"<F11>格式化代码
nnoremap <silent><F11> V:Autoformat<CR>
vnoremap <silent><F11> :Autoformat<CR>

"<F12>跳转头文件(:A)
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

" F5编译运行
" func! CompileRunGcc()
" nnoremap <silent><F5> :call CompileRunGcc()<CR>
"     exec "w"
"     if &filetype == 'c'
"         exec "!clang % -o %<"
"        exec "!time ./%<"
"    elseif &filetype == 'cpp'
"        exec "!g++ % -std=c++11 -o %<"
"        exec "!time ./%<"
"    elseif &filetype == 'java'
"        exec "!javac %"
"        exec "!time java %<"
"    elseif &filetype == 'sh'
"        :!time bash %
"    elseif &filetype == 'python'
"        exec "!time python3 %"
"    elseif &filetype == 'html'
"        exec "!firefox % &"
"    elseif &filetype == 'go'
"        "        exec "!go build %<"
"        exec "!time go run %"
"    elseif &filetype == 'mkd'
"        exec "!typora %"
"    endif
" endfunc

" F6进行C,C++的调试
"map <F6> :call Rungdb()<CR>
"func! Rungdb()
"    exec "w"
"    exec "!gcc % -g -o %<"
"    exec "!gdb ./%<"
"endfunc

"if has("autocmd")
"    autocmd BufReadPost *
"                \ if line("'\"") > 0 && line("'\"") <= line("$") |
"                \   exe "normal g`\"" |
"                \ endif
" endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 vim-plug                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" indent line
Plug 'Yggdroot/indentLine'
" tpope'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
" pairs
Plug 'jiangmiao/auto-pairs'
" comment
Plug 'tyru/caw.vim'
" junegunn'
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align'
" static checking
Plug 'w0rp/ale',{ 'for': ['c', 'cpp', 'python', 'verilog_systemverilog','sh' ] }
" syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra',{ 'for': ['c', 'bison', 'flex', 'cpp'] }
Plug 'vhda/verilog_systemverilog.vim',{ 'for': 'verilog_systemverilog' }
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'ekalinin/Dockerfile.vim'
" code format
Plug 'vim-autoformat/vim-autoformat',{ 'on': 'Autoformat', 'do': 'python3 -m pip install pynvim' }
" move
Plug 'unblevable/quick-scope'
Plug 'psliwka/vim-smoothie'
" git
Plug 'airblade/vim-gitgutter'
" others
Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi',{'branch': 'master'}
Plug 'vim-scripts/fcitx.vim'
Plug 'myusuf3/numbers.vim'
Plug 'wellle/context.vim'
Plug 'dstein64/vim-startuptime'
" vimdiff
Plug 'chrisbra/vim-diff-enhanced'
" LeaderF
Plug 'Yggdroot/LeaderF',{ 'on': ['LeaderfFile','LeaderfFunction'] }
Plug 'kshenoy/vim-signature'
" status line
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" header
Plug 'alpertuna/vim-header'
" bar
Plug 'preservim/nerdtree',{ 'on':  'NERDTreeToggle' }
Plug 'preservim/tagbar',{ 'on': 'TagbarToggle' }
" highlight cursor word
Plug 'RRethy/vim-illuminate'
" tags(ctags,global)
Plug 'ludovicchabant/vim-gutentags'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" completion
Plug 'jayli/vim-easycomplete'
" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'glts/vim-textobj-comment'
Plug 'tommcdo/vim-exchange'
" themes
Plug 'NLKNguyen/papercolor-theme'
" Plug 'morhetz/gruvbox'
" Plug 'joshdick/onedark.vim'
" Plug 'jacoborus/tender.vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'cocopon/iceberg.vim'
" Plug 'junegunn/seoul256.vim'
" Plug 'cocopon/iceberg.vim'
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
" whitespace
Plug 'ntpeters/vim-better-whitespace'
" lastplace
Plug 'farmergreg/vim-lastplace'
" undotree
Plug 'mbbill/undotree'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               plug settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" indentline
let g:indentLine_char     = '┊'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"

" quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

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
set background=light
" 让背景，行号，状态栏背景透明
" set termguicolors
" highlight Normal guibg       = NONE
" highlight LineNr guibg       = NONE
" highlight SignColumn guibg   = NONE "设置标志列背景色
" highlight CursorLineNr guibg = NONE "设置当前高亮行的NUM列背景

" gruvbox
" let g:gitgutter_override_sign_column_highlight = 1
" let g:gruvbox_italic = 1
" let g:gruvbox_bold = 1
" let g:gruvbox_contrast_dark = 'hard'
" color gruvbox

" paper
colorscheme PaperColor
let g:airline_theme = 'papercolor'

" ale
let g:ale_linters = {
\   'c++': ['ccls'],
\   'c': ['ccls'],
\   'h': ['ccls'],
\   'sh': ['shellcheck'],
\}
" let g:ale_linters_explicit =1
let g:ale_sign_column_always         = 1
let g:ale_set_highlights             = 0
let g:ale_sign_warning               = '⚡'
let g:ale_lint_on_enter              = 1
let g:ale_sign_error                 = '✗'
let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_error_str         = 'E'
let g:ale_echo_msg_warning_str       = 'W'
let g:ale_echo_msg_format  = '[%linter%] %s [%severity%]'
" 禁用默认INSERT模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" gtags && gutentags"
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_ctags_executable = '/usr/bin/ctags'
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
"gutentags搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')
" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args  = ['--fields=+niazS']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--extra=+q']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
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
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeShowHidden=1
" F7打开目录树
nnoremap <silent><F7> :NERDTreeToggle<CR>
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" tagbar键盘命令映射
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'

" 设置easy-align
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
let g:airline_powerline_fonts = 1
let g:Powerline_symbols='fancy'

" LeaderF
nnoremap <C-f> :LeaderfFile<CR>
nnoremap <C-g> :LeaderfFunction!<CR>
let g:Lf_PreviewInPopup = 1
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WindowPosition = 'popup'

" vim-header
let g:header_auto_add_header = 0
let g:header_field_author = 'zhangzhao'
let g:header_field_author_email = 'zhangzhao@ihep.ac.cn'

" vim-gitgutter
let g:gitgutter_sign_allow_clobber = 1

" context.vim
let g:context_add_mappings = 0

" whitespace
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

" smoothie
let g:smoothie_no_default_mappings = 1
silent! nmap <unique> <C-J> <Plug>(SmoothieDownwards)
silent! nmap <unique> <C-K> <Plug>(SmoothieUpwards)

" lexima
set backspace=indent,eol,start

" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" auto-pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', '<':'>'}

" undotree
nnoremap <F6> :UndotreeToggle<CR>

" easycomplete
let g:easycomplete_diagnostics_enable = 0
let g:easycomplete_lsp_checking = 0
nnoremap <silent> <C-w> :EasyCompleteNextDiagnostic<CR>
nnoremap <silent> <C-e> :EasyCompletePreviousDiagnostic<CR>
