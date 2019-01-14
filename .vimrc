"https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
filetype plugin indent on

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

"Enable hybrid line numbers while buffer has focus. See https://jeffkreefmeijer.com/vim-number
if exists('+relativenumber')
  set number relativenumber
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
  augroup END
else
  set number
endif

syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
  Plug 'https://github.com/triglav/vim-visual-increment.git'
call plug#end()
