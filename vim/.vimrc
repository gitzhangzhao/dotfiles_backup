" File              : .vimrc
" Author            : zhangzhao <zhangzhao@ihep.ac.cn>
" Date              : 21.05.2020
" Last Modified Date: 15.05.2021
" Last Modified By  : zhangzhao <zhangzhao@ihep.ac.cn>
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"张昭的个人vim配置，需要安装powerline和nerd字体，ctags，gtags
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ts=4
set sw=4
set et
set lbr
set fo+=mB
set sm
set selection=inclusive
set mousemodel=popup
set nocompatible   " 去掉vi一致性模式，避免bug
set ttimeoutlen=0 " 降低fcitx插件的反应时间
set lazyredraw     " 延迟绘制（提升性能）
set fileformats=unix,dos

"打开语法高亮和插件的语法高亮支持
syntax on
syntax enable

"将H和L设置为定位到行首和行尾
"设置一些常用映射
nnoremap H 0
nnoremap L $

"可视状态下，设置H和L功能与normal一致
vnoremap H 0
vnoremap L $

"x删除不保存到剪切板
nnoremap x "_x
nnoremap X "_X
 
"添加一行但不进插入模式
nnoremap <C-L> o<Esc>

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

"选中状态下 Ctrl+c 复制,normal下 Ctrl+c复制一整行
" set clipboard=unnamed
nnoremap <C-c> "+Y
vnoremap <C-c> "+y

"按文件类型补全dict
au FileType hp setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType ss setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

"设置基本一些特性
"行列线设置
set cul 
" set cuc

"智能高亮光标所在行
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set shortmess=atI      " 启动的时候不显示援助乌干达儿童的提示
set go=                " 不要图形按钮
set showcmd            " 输入的命令显示出来，看的清楚些
" set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界(不建议)

"设置折叠
set foldenable            " 允许折叠
autocmd FileType java,c,cpp set foldmethod=syntax
set foldlevel=999999      " 默认开始不折叠
nnoremap <silent><space> za   
    
"显示中文帮助
set encoding=UTF-8
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

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
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript

"设置当文件被改动时自动载入
set autoread
"自动保存
set autowrite
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"不要使用vi的键盘模式，而是vim自己的
set nocompatible
"去掉输入错误的提示声音
set noeb
"在处理未保存或只读文件的时候，弹出确认
set confirm

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

"代码补全 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=menu,longest

"定义F1-F12映射
"F12整理代码
nnoremap <F12> gg=G

"F2去空行  
nnoremap <F2> :g/^\s*$/d<CR> 

"F8格式化代码
nnoremap <silent><F8> :ClangFormat<CR>

"F4跳转头文件(:A)
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
nnoremap <silent><F4> :A<CR>
nnoremap <silent>\<F4> :AV<CR>

" F5编译运行
nnoremap <silent><F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!clang % -o %<"
       exec "!time ./%<"
   elseif &filetype == 'cpp'
       exec "!g++ % -std=c++11 -o %<"
       exec "!time ./%<"
   elseif &filetype == 'java' 
       exec "!javac %" 
       exec "!time java %<"
   elseif &filetype == 'sh'
       :!time bash %
   elseif &filetype == 'python'
       exec "!time python3 %"
   elseif &filetype == 'html'
       exec "!firefox % &"
   elseif &filetype == 'go'
       "        exec "!go build %<"
       exec "!time go run %"
   elseif &filetype == 'mkd'
       exec "!typora %"
   endif
endfunc

"F6进行C,C++的调试
map <F6> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!gcc % -g -o %<"
    exec "!gdb ./%<"
endfunc

if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif


"vim-plug插件安装
call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise' 
Plug 'junegunn/vim-slash'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'vhda/verilog_systemverilog.vim',{ 'for': 'verilog_systemverilog' }
Plug 'w0rp/ale',{ 'for': ['c', 'cpp', 'python', 'verilog_systemverilog','sh' ] }
Plug 'preservim/nerdtree',{ 'on':  'NERDTreeToggle' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }
Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
Plug 'majutsushi/tagbar',{ 'on': 'TagbarToggle' } 
Plug 'mg979/vim-visual-multi',{'branch': 'master'}
Plug 'airblade/vim-gitgutter' 
Plug 'junegunn/vim-easy-align' 
Plug 'vim-scripts/fcitx.vim'
Plug 'rhysd/vim-clang-format' , { 'on': 'ClangFormat' }
Plug 'Yggdroot/LeaderF', { 'on': ['LeaderfFile','LeaderfFunction'] }
Plug 'myusuf3/numbers.vim'
Plug 'unblevable/quick-scope'       
Plug 'chrisbra/vim-diff-enhanced'
Plug 'PotatoesMaster/i3-vim-syntax',{ 'for': 'i3' }
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature' 
Plug 'vim-airline/vim-airline' 
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'alpertuna/vim-header' 
"自动补全
"Plug 'Shougo/deoplete.nvim',{ 'on':[] }
"Plug 'roxma/nvim-yarp',{ 'on':[] }
"Plug 'roxma/vim-hug-neovim-rpc',{ 'on':[] }
"Plug 'Shougo/deoplete-clangx',{ 'on':[] }
"augroup load_deo     "延迟加载插件
"    autocmd!
"    autocmd InsertEnter * call plug#load('nvim-yarp','vim-hug-neovim-rpc','deoplete.nvim','deoplete-clangx') | autocmd! load_deo
"augroup END
"文本对象插件
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'sgur/vim-textobj-parameter'
Plug 'glts/vim-textobj-comment'
"主题插件
" Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'arcticicestudio/nord-vim' 
Plug 'cocopon/iceberg.vim' 
call plug#end()


"indentline插件设置
let g:indentLine_char     = '┊'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"

"quickscope设置（高亮f查找结果）
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

"number.vim配置
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']

"vim-surround插件设置
vmap " S"
vmap ] S]
vmap ' S'
vmap > S>
vmap / S/
vmap ) S)
vmap } S}

"supertab插件设置
let g:SuperTabDefaultCompletionType = "<c-n>"

"ale插件的配置(ale会默认配置编译器(默认clang))
" let g:ale_linters = {
" \   'c++': ['clang'],
" \   'c': ['clang'],
" \   'h': ['clang'],
" \   'python': ['pylint'],
" \   'sh': ['shellcheck'],
" \}
"let g:ale_linters_explicit =1 
let g:ale_sign_column_always         = 1
let g:ale_set_highlights             = 1
let g:ale_sign_warning               = '⚡'
let g:ale_lint_on_enter              = 1
let g:ale_sign_error                 = '✗'
let g:airline#extensions#ale#enabled = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_echo_msg_error_str         = 'E'
let g:ale_echo_msg_warning_str       = 'W'
let g:ale_echo_msg_format  = '[%linter%] %s [%severity%]'
"禁用默认INSERT模式下改变文字也触发的设置，太频繁外，还会让补全窗闪烁
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
nmap <C-k> <Plug>(ale_previous_wrap)
nmap <C-j> <Plug>(ale_next_wrap)

"主题设置
set t_Co=256
set background=dark
"gruvbox
let g:gitgutter_override_sign_column_highlight = 1
let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_contrast_dark = 'hard'
color gruvbox " 设置背景主题
" nord
" color nord " 设置背景主题
" ondark
" color onedark " 设置背景主题
" tender
" color tender
" let g:airline_theme = 'onedark'
" iceberg
" color iceberg

"让背景，行号，状态栏背景透明
set termguicolors
highlight Normal guibg       = NONE
highlight LineNr guibg       = NONE
highlight SignColumn guibg   = NONE "设置标志列背景色
highlight CursorLineNr guibg = NONE "设置当前高亮行的NUM列背景

"gtags和gutentags插件的配置"
" set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope
"gutentags搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
" let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" 所生成的数据文件的名称
" let g:gutentags_ctags_tagfile = '.tags'
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
" let g:gutentags_ctags_extra_args  = ['--fields=+niazS']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--languages=c']
" let g:gutentags_ctags_extra_args += ['--langmap=c:+.h']
" let g:gutentags_ctags_extra_args += ['--languages=verilog']
" let g:gutentags_ctags_extra_args += ['--languages=VHDL']
" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 增加cscope使用的快捷键(C-[和esc按键一致，可以直接esc+s进行查找)
" nnoremap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" nnoremap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" nnoremap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" nnoremap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" nnoremap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" nnoremap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" nnoremap <C-[>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
" nnoremap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>
 
"NerdTree设置
"F3打开目录树  
nnoremap <silent><F3> :NERDTreeToggle<CR>
"打开树状文件目录  
nnoremap <C-F3> \be  
autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"当打开vim且没有文件时自动打开NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"tagbar键盘命令映射
nmap <F9> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

"自动注释
"在注释行之下新开一行时不要自动加注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"rainbow设置
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\   'guifgs': ['SeaGreen3','darkcyan','lightyellow', 'lightmagenta','firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_\|+\|-_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'css': 0,
\   }
\}

"supertab设置
let g:SuperTabDefaultCompletionType = "<c-n>"

"设置easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-cpp-enhanced-highlight配置
let g:cpp_member_variable_highlight              = 1
let g:cpp_class_scope_highlight                  = 1
let g:cpp_class_decl_highlight                   = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight        = 1
let g:cpp_concepts_highlight                     = 1

"airline设置
let g:airline_powerline_fonts = 1 "使用airline
let g:Powerline_symbols='fancy'

"LeaderF配置
nnoremap <C-f> :LeaderfFile<CR>
nnoremap <C-g> :LeaderfFunction<CR>
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

"vim-header配置
let g:header_field_author = 'zhangzhao'
let g:header_field_author_email = 'zhangzhao@ihep.ac.cn'

"neocomplete.vim配置
let g:deoplete#enable_at_startup = 1

"auto-pairs配置
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'} 
