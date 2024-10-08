let &termencoding=&encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/Vundle.vim')
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Colors
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
" syntax highlighting
Plugin 'sheerun/vim-polyglot'
Plugin 'edkolev/tmuxline.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'

" Edit
Plugin 'jiangmiao/auto-pairs'
Plugin 'python-mode/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:neocomplete#enable_at_startup = 1

" Browsing
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar', { 'on': 'TagbarToggle'      }
Plugin 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp', 'objc'] }
" Plugin 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp', 'objc'] }
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ggreer/the_silver_searcher'
Plugin 'beyondgrep/ack2'

" Lint
Plugin 'w0rp/ale'

Plugin 'sjl/gundo.vim'
Plugin 'dyng/ctrlsf.vim'
"Plugin 'ctrlpvim/ctrlp.vim'
"Do all your insert-mode completion with Tab.
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Show the size of block one selected in visual mode

" https://github.com/yangyangwithgnu/use_vim_as_ide

" ------------------快捷键start----------------
" 配置leader键
let mapleader=";"
" tagbar快捷键设置
inoremap <F2> <esc>:TagbarToggle<cr>
nnoremap <F2> :TagbarToggle<cr>
" nerdtree快捷键设置
inoremap <F3> <esc>:NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>
" undo, 历史编辑记录
nnoremap <Leader>ud :GundoToggle<CR>

" 关闭当前分割窗口
nmap <Leader>q :q<CR>
" 保存当前窗口内容
nmap <Leader>w :w<CR>
nnoremap <Leader>Q :q!<cr>

" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
noremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
 nnoremap <Leader>jw <C-W>j
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" 纵向分割窗口
nnoremap <leader>vs :vsplit<CR>
" 横向分割窗口
nnoremap <leader>sp :split<CR>

" abc --> "abc"
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" abc --> 'abc'
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" abc --> (abc)
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
" abc --> <abc>
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
" abc --> {abc}
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
" abc --> [abc]
nnoremap <leader>[ viw<esc>a]<esc>hbi[<esc>lel

" c++ .cpp 与 .h 切换
nmap <silent> <Leader>fs :FSHere<cr>


" ale 异步代码检测
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

" 搜索
" 先用root权编译安装ag(ggreer/the_silver_searcher)
nnoremap <c-f> :CtrlSF<space>
" ------------------快捷键end----------------

" 输入搜索字符串的同时进行搜索
set incsearch
" set noincsearch

" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn

" Highlighting of class scope is disabled by default.
let g:cpp_class_scope_highlight = 1
" Highlighting of member variables is disabled by default.
let g:cpp_member_variable_highlight = 1
" Highlighting of class names in declarations is disabled by default.
let g:cpp_class_decl_highlight = 1

"启用每行超过100列的字符提示（字体变蓝并加下划线），不启用就注释掉
autocmd BufWinEnter *.h let w:m2=matchadd('Underlined', '\%>' . 100 . 'v.\+', -1)
autocmd BufWinEnter *.c let w:m2=matchadd('Underlined', '\%>' . 100 . 'v.\+', -1)
autocmd BufWinEnter *.cpp let w:m2=matchadd('Underlined', '\%>' . 100 . 'v.\+', -1)
autocmd BufWinEnter *.sh let w:m2=matchadd('Underlined', '\%>' . 100 . 'v.\+', -1)
autocmd BufWinEnter *.py let w:m2=matchadd('Underlined', '\%>' . 100 . 'v.\+', -1)

" 基于缩进或语法进行代码折叠
set nofoldenable " 开始折叠
"set foldmethod=indent
set foldmethod=syntax " 设置语法折叠
set foldcolumn=0 " 设置折叠区域的宽度
setlocal foldlevel=1 " 设置折叠层数为

" 右下角显示正在输入的命令
set showcmd
 "允许在有未保存的修改时切换缓冲区
set hidden
" 用屏幕的闪烁代替响铃(vim bell提示音)
set visualbell

" Indent using four spaces
"set expandtab smarttab
" tab对应显示的空格宽度
set tabstop=4
" 自动缩进列宽度
set shiftwidth=4
set softtabstop=4

" 禁止光标闪烁
set gcr=a:block-blinkon0

"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" Show the line and column number of the cursor position
set ruler
" Highlight line under cursor
set cursorline
set cursorcolumn

set background=dark

let g:molokai_original = 1
colorscheme molokai
"colorscheme solarized

" <<<<
" >>>>
" PLUGINS
" vim-multiple-cursors
" ----------------------------------------------------------------------------


let g:move_key_modifier = 'C'

" ----------------------------------------------------------------------------
" auto-pairs
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------
  
let g:indentLine_char = '│'

" ----------------------------------------------------------------------------
" tarbar
" ----------------------------------------------------------------------------
" set tags+=
let tagbar_left=1
let tagbar_width=32
let g:tagbar_sort = 0
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
 \ 'ctagstype' : 'c++',
 \ 'kinds'     : [
     \ 'c:classes:0:1',
     \ 'd:macros:0:1',
     \ 'e:enumerators:0:0', 
     \ 'f:functions:0:1',
     \ 'g:enumeration:0:1',
     \ 'l:local:0:1',
     \ 'm:members:0:1',
     \ 'n:namespaces:0:1',
     \ 'p:functions_prototypes:0:1',
     \ 's:structs:0:1',
     \ 't:typedefs:0:1',
     \ 'u:unions:0:1',
     \ 'v:global:0:1',
     \ 'x:external:0:1'
 \ ],
 \ 'sro'        : '::',
 \ 'kind2scope' : {
     \ 'g' : 'enum',
     \ 'n' : 'namespace',
     \ 'c' : 'class',
     \ 's' : 'struct',
     \ 'u' : 'union'
 \ },
 \ 'scope2kind' : {
     \ 'enum'      : 'g',
     \ 'namespace' : 'n',
     \ 'class'     : 'c',
     \ 'struct'    : 's',
     \ 'union'     : 'u'
 \ }
\ }

" ----------------------------------------------------------------------------
" vim-protodef
" ----------------------------------------------------------------------------

" let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
" let g:disable_protodef_sorting=1

" ----------------------------------------------------------------------------
"  nerdtree
" ----------------------------------------------------------------------------

let NERDTreeWinSize=30
let NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" vim-gitgutter
" ----------------------------------------------------------------------------
  
set updatetime=250
set signcolumn=yes

" ----------------------------------------------------------------------------
" ale
" ----------------------------------------------------------------------------

"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['>> %d', '-- %d', 'QQ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" ----------------------------------------------------------------------------
" gundo.vim
" ----------------------------------------------------------------------------

set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

if !strlen(finddir('~/.vim/undofiles'))
echo "undofiles[~/.vim/undofiles] not found. Now it's being created. Press ENTER or type command to continue."
!mkdir -p ~/.vim/undofiles
endif

if v:version >= 703
set undodir=~/.vim/undofiles
set undofile
set colorcolumn=+1 
endif

" ----------------------------------------------------------------------------
" ctrlsf.vim
" ----------------------------------------------------------------------------
let g:ctrlsf_ackprg = 'ag'


" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------

" Disable output, vcs, archive, rails, temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" let g:ctrlp_map = '<s-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn|vendor/bundle/*\|vendor/cache/*\|public\|spec)$',
"   \ 'file': '\v\.(exe|so|dll|swp|log|jpg|png|json)$',
"   \ }


set encoding=utf-8
set nu

" Python-mode
" Activate rope
" Keys: 按键：
" K             Show python docs 显示Python文档
" <Ctrl-Space>  Rope autocomplete  使用Rope进行自动补全
" <Ctrl-c>g     Rope goto definition  跳转到定义处
" <Ctrl-c>d     Rope show documentation  显示文档
" <Ctrl-c>f     Rope find occurrences  寻找该对象出现的地方
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled) 断点
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
"            跳转到前一个/后一个类或函数
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"              跳转到前一个/后一个类或方法
let g:pymode_rope = 1
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_motion = 1
" Documentation 显示文档
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting 代码查错，=1为启用
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_message = 1
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting 高亮形式
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" jedi
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader><leader>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_on_dot = 0
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
nmap <silent> <C-_> <Plug>(pyd)
set ttyfast
set lazyredraw

" ----------------------------------------------------------------------------
" nerdcommenter
" ----------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" autocmd FileType c,cpp set shiftwidth=4 | set expandtab

" ----------------------------------------------------------------------------
" ultisnips
" ----------------------------------------------------------------------------
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"Python 注释
function InsertPythonComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/usr/bin/env python')
    normal o
    call setline('.', '# -*- coding:utf-8 -*-')
	normal o
	call setline('.', '########################################################################')
	normal o
	call setline('.', '#')
	normal o
	call setline('.', '# Copyright (c) 20xx xx.com, Inc. All Rights Reserved')
	normal o
	call setline('.', '#')
	normal o
	call setline('.', '########################################################################')
    normal o
    call setline('.', '"""')
    normal o
    call setline('.', 'Author  :   '.g:python_author)
    normal o
    call setline('.', 'E-mail  :   '.g:python_email)
    normal o
    call setline('.', 'Date    :   '.strftime("%y/%m/%d %H:%M:%S"))
    normal o
    call setline('.', 'Desc    :')
    normal o
    call setline('.', '"""')
    normal o
	call setline('.', '')
	normal o
	call setline('.', 'from __future__ import unicode_literals')
	normal o
	call setline('.', 'from __future__ import print_function')
	normal o
	call setline('.', 'import sys')
	normal o
	call setline('.', 'import os')
	normal o
	call setline('.', 'import logging')
	normal o
	call setline('.', '')
	normal o
	call setline('.', 'CUR_DIR = os.path.dirname(os.path.abspath(__file__))')
	normal o
	call setline('.', "LOG_FORMAT = '''[%(levelname)s] [%(asctime)s] [%(threadName)s] [%(name)s] '''")
	normal o
	call setline('.', "LOG_FORMAT += '''[%(filename)s:%(funcName)s:%(lineno)d]: %(message)s'''")
	normal o
	call setline('.', 'logging.basicConfig(')
	normal o
	call setline('.', '    stream=sys.stderr,')
	normal o
	call setline('.', '    level=logging.INFO,')
	normal o
	call setline('.', "    format=LOG_FORMAT")
	normal o
	call setline('.', ')')
	normal o
	call setline('.', '')
	normal o
	call setline('.', 'def main():')
	normal o
	call setline('.', '    pass')
	normal o
	call setline('.', '')
	normal o
	call setline('.', "if __name__ == '__main__':")
	normal o
	call setline('.', '    main()')
    call cursor(31, 0)
endfunction
function InsertCommentWhenOpen()
    if a:lastline == 1 && !getline('.')
        call InsertPythonComment()
    end
endfunc
au FileType python :%call InsertCommentWhenOpen()
let g:python_author = 'xuechengyun'
let g:python_email  = 'xuechengyunxue@gmail.com' 

"shell 注释
function InsertShellComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/bin/bash')
    normal o
	call setline('.', '########################################################################')
	normal o
	call setline('.', '#')
	normal o
	call setline('.', '# Copyright (c) 20xx xx.com, Inc. All Rights Reserved')
	normal o
	call setline('.', '#')
	normal o
	call setline('.', '########################################################################')
    normal o
    call setline('.', '# Author  :   '.g:python_author)
    normal o
    call setline('.', '# E-mail  :   '.g:python_email)
    normal o
    call setline('.', '# Date    :   '.strftime("%y/%m/%d %H:%M:%S"))
    normal o
    call setline('.', '# Desc    :')
    normal o
	call setline('.', '########################################################################')
    normal o
	call setline('.', '')
	normal o
    call setline('.', '# set -x')
	normal o
	call setline('.', 'CUR_DIR=$(cd `dirname $0`; pwd)')
	normal o
	call setline('.', 'cd ${CUR_DIR}')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', 'cd -')
	normal o
    call cursor(17, 0)
endfunction
function InsertShellCommentWhenOpen()
    if a:lastline == 1 && !getline('.')
        call InsertShellComment()
    end
endfunc
au FileType sh :%call InsertShellCommentWhenOpen()
let g:python_author = 'xuechengyun'
let g:python_email  = 'xuechengyunxue@gmail.com' 

set ttyfast
set lazyredraw

autocmd FileType c,cpp,sh set shiftwidth=4 | set expandtab
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
