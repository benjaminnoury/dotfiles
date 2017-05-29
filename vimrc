" File: .vimrc
" Adapté de  Jake Zimmerman <jake@zimmerman.io>
"
" How I configure Vim :P
"

" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'francoiscabrol/ranger.vim'
Plugin 'tpope/vim-dispatch'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'majutsushi/tagbar'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-scripts/a.vim'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'

" ----- Syntax plugins ------------------------------------------------
" Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" ----- Snippets plugins ----------------------------------------------
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
 
" ---- Pandoc/markdown Stuff ------------------------------------------
Plugin 'dhruvasagar/vim-table-mode'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
"Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
" Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
"Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()

filetype plugin indent on


" --- General settings ---
let mapleader=','
set backspace=indent,eol,start
set ruler
set number 
set showcmd
set incsearch
set ignorecase 
set smartcase 
set hlsearch 
nnoremap n nzz 

syntax on
set mouse=a

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
" hi clear SignColumn

" ----- Plugin-Specific Settings --------------------------------------

" Set the colorscheme
colorscheme zenburn
set t_co=256

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme='zenburn'

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>

" ----- Ultisnip ----------------------
let g:UltiSnipsUsePythonVersion=2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsSnippetDirectories='/home/ben/dotfiles/snippets'

" ----- Pandoc ----------------------
" let g:pandoc#modules#disabled = ["folding"]
" let g:pandoc#command#autoexec_on_writes = 1
" let g:pandoc#command#autoexec_command = "Pandoc pdf"
" let g:pandoc#command#latex_engine = "xelatex"
" let g:pandoc#command#custom_open = "MyPandocOpen"

" function! MyPandocOpen(file)
	" return 'rifle ' . shellescape(expand(a:file,':p'))
" endfunction

au FileType markdown.pandoc map <F9> :w<CR>:Start! pandoc-latex % <CR>
au FileType markdown.pandoc inoremap <F9> <Esc>:w<CR>:Start! pandoc-latex % <CR>
au FileType tex map <F8> :w<CR>:Start! xelatex % <CR>
au FileType uml map <F9> <Esc>:w<CR>:Start! plantuml % <CR>

augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" Table mode settings
let g:table_mode_corner='|'

" selection d'un buffer avec ,f
nmap <leader>b :ls<CR>:e#

