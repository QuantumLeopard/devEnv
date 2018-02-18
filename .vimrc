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
set expandtab

set nowrap

"split navigation with ctrl-<h,j,k,l>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

set t_Co=256
colorscheme desert256
set hlsearch

"plugins
source ~/.vim/autoload/indent_guides.vim
source ~/.vim/plugin/indent_guides.vim
IndentGuidesEnable
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=239
hi IndentGuidesEven guibg=grey15
hi IndentGuidesOdd guibg=grey25
hi Normal ctermbg=238
