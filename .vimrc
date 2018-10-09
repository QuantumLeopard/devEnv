"Show line numbers
set nu
set autoindent
set smartindent
set nocp
set nocompatible

"smaller tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab

set nowrap
"show the tabs for each file, even when only one tab is open
set showtabline=2

"split navigation with ctrl-<h,j,k,l>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"tap navigation
nnoremap <C-L> :tabnext <Enter>
nnoremap <C-H> :tabprevious <Enter>

"split sizing
nnoremap <c-n> <c-w>3+
nnoremap <c-m> <c-w>3-

"j and k will move to wrapped lines as well
nnoremap j gj
nnoremap k gk

"F7 re-indents the whole file
nnoremap <F7> mmgg=G'm

"enable mouse for split sizing
set mouse=a
if &term =~ "^screen"
	set ttymouse=xterm2
endif


set t_Co=256
"colorscheme desert256
"colorscheme darkspectrum
let g:aldmeris_transparent = 1
"let g:aldmeris_termcolors = "tango"
colorscheme aldmeris
set hlsearch

"smooth scrolling function from Kazark/vim-SimpleSmoothScroll
function SmoothScroll(up)
	if a:up
		let scrollaction=""
	else
		let scrollaction=""
	endif
	exec "normal " . scrollaction
	redraw
	let counter=1
	while counter<&scroll
		let counter+=1
		sleep 5m
		redraw
		exec "normal " . scrollaction
	endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

"Loads a session if it exists
function! LoadSession()
	let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
	let b:sessionfile=b:sessiondir. "/Session.vim"
	if (filereadable(b:sessionfile))
		silent exe 'source ' fnameescape(b:sessionfile)
	else
		echo "No session loaded."
	endif
endfunction

"plugins
source ~/.vim/autoload/indent_guides.vim
source ~/.vim/plugin/indent_guides.vim
source ~/.vim/plugin/obsession.vim
IndentGuidesEnable
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
hi IndentGuidesEven guibg=grey15
hi IndentGuidesOdd guibg=grey25
hi Normal ctermbg=235
if argc() == 0
	autocmd VimEnter * nested :call LoadSession()
	else
	autocmd VimEnter * Obsess
endif
