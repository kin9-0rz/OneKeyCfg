" 开启语法高亮
syntax enable

" 开启语法高亮
syntax on

" 设置历史记录条数
set history=2000

" 检测文件类型
filetype on

" 针对不同的文件，采用不同的缩进方式
filetype indent on

" 允许插件
filetype plugin on

" 启动自动补全
filetype plugin indent on

" 文件修改之后自动读入
set autoread

" 设置取消备份，禁止临时文件生成
set nobackup
set noswapfile

" 显示当前横竖线
"set cursorline
set cursorcolumn 

" 设置在Vim中可以使用鼠标，防止终端无法拷贝
set mouse=a

" 显示当前行号和列号
set ruler

" 在状态栏显示正在输入的命令
set showcmd

" 左下角显示当前Vim模式
set showmode

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

" 总是显示状态栏(Powerline需要2行)
set laststatus=2

" 显示行号
set number

" 指定不折行
set nowrap

" 设置代码匹配,包括括号匹配情况
set showmatch

" 开启及时搜索(is)
set incsearch

" 设置搜索高亮(hlsearch)
set hls

" 设置搜索时忽略大小写
set ignorecase

" 当搜索的时候尝试smart
set smartcase

" 设置C/C++方式自动对齐
set autoindent
set cindent
set smartindent

" 设置tab宽度
set tabstop=4

" 设置自动对齐空格数
set shiftwidth=4

" 编辑的时候将所有的tab设置为空格(expandtab)
set et

" 使用Backspace直接删除tab
set smarttab

" 不在单词中间折行
set lbr

" 设置编码方式
set encoding=utf-8

" 设置打开文件的编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set helplang=cn 

" 只对终端影响(默认)
set termencoding=utf-8

" use UNIX as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行。
set formatoptions+=m

" 自动补全配置让Vim补全菜单行为跟IDE一致
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu

colorscheme elflord

" 快捷键 

" 修改leader键
let mapleader = ','
let g:mapleader = ','


" 在分屏窗口之间移动
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" 行首行尾
noremap H ^
noremap L $

" --------------------------------------------------------------------------------  
"                                   正常模式 
" --------------------------------------------------------------------------------  

nmap Y y$

" z 往前删，x 往后删
nnoremap z i<BS><Esc>l
" Buff切换; next
nnoremap <C-N> :bn<CR>
" 关闭buff; close
nnoremap <leader>c :w \| bp \| bd #<CR>
nnoremap <C-E> :enew<CR>

" 去掉搜索高亮
nnoremap <silent><leader>/ :nohls<CR>

" 退出编辑，保存编辑
nnoremap <leader>q :q<CR>
nnoremap <leader>qa : wa \| qa<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wa :wa<CR> 

" 使用分号进入命令模式
nnoremap ; : 
nnoremap ` :! 

" --------------------------------------------------------------------------------  
"                                   命令模式 
" --------------------------------------------------------------------------------  

" 命令行模式光标移动
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
