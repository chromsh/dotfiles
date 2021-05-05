
" 横分割時にずれるのを防ぐ(PuTTY)
set ambiwidth=double

if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#add('Shougo/denite.nvim')

 " go
 call dein#add('fatih/vim-go')
 call dein#add('zchee/deoplete-go', {'build': 'make'})

 " perl
 call dein#add("c9s/perlomni.vim")

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

set rtp+=~/work/deoplete.nvim/

let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#enable_smart_case = 1

" colorscheme desert

" https://liginc.co.jp/409849 参考
let mapleader = "\\"
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set smarttab
set shiftround

set mouse=a

au BufNewFile,BufRead *.psgi,*.t,*.pm,*.pl set filetype=perl noexpandtab

" ウインドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


inoremap <silent> jj <ESC>

"""" キーマッピング
nnoremap <F2> <Esc>:call ToggleCursorLine()<CR>
inoremap <F2> <Esc>:call ToggleCursorLine()<CR>a
nnoremap <F3> <Esc>:call TogglePaste()<CR>
inoremap <F3> <Esc>:call TogglePaste()<CR>a
inoremap <F5> sub  {<RETURN>my ($self)  = @_;<RETURN>}<UP><UP><RIGHT><RIGHT><RIGHT>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" インサートモードで、一部emacs風な操作ができるようにする
inoremap <C-a> <HOME>
inoremap <C-e> <END>
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>
inoremap <C-k> <ESC>ld$A
inoremap <C-s> <Esc>/
inoremap <C-y> <ESC>pa
inoremap <C-d> <DELETE>
inoremap <C-o> <END><RETURN>

" 補完は変えたくないけど、、、仕方ないので、Ctrl+Shiftに設定する
"inoremap <C-S-p> <C-p>
"inoremap <C-S-n> <C-n>
"inoremap <C-p> <UP>
"inoremap <C-n> <DOWN>
"""""""""""""""""""""""""""""""""""""""""""""""""""


" 括弧補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


" buffer idou
nmap bb :ls<CR>:buf
" gtags
" 検索結果Windowを閉じる
nnoremap <C-q> <C-w><C-w><C-w>q
" Grep 準備
nnoremap <C-g> :Gtags -g
" このファイルの関数一覧
nnoremap <C-h> :Gtags -f %<CR>
" nnoremap <C-l> :Gtags -f %<CR>
" カーソル以下の定義元を探す
nnoremap <C-j> :Gtags <C-r><C-w><CR>
" カーソル以下の使用箇所を探す
nnoremap <C-k> :Gtags -r <C-r><C-w><CR>
" 次の検索結果
nnoremap <C-n> :cn<CR>
" 前の検索結果
nnoremap <C-p> :cp<CR>


function! ToggleCursorLine()
	if &cursorline != ''
		set nocursorline
		echo "cursorline Off"
	else
		set cursorline
		echo "cursorline On"
	endif
endfunction

function! TogglePaste()
	if &paste != ''
		set nopaste
		echo "paste Off"
	else
		set paste
		echo "paste On"
	endif
endfunction

