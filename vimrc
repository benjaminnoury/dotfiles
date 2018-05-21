" File: .vimrc
" Adapté de  Jake Zimmerman <jake@zimmerman.io>
"
set nocompatible
filetype off


"""" Plugins ----------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'dylanaraps/wal.vim'

" ---- Vim Wiki
Plugin 'vimwiki/vimwiki'

" ----- Vim as a programmer's text editor -----------------------------
" Plugin 'francoiscabrol/ranger.vim'
Plugin 'tpope/vim-dispatch'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'majutsushi/tagbar'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'vim-scripts/a.vim'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'lilydjwg/colorizer'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
" Plugin 'jez/vim-superman'
" 
" ----- Syntax plugins ------------------------------------------------
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax'

" ----- Snippets plugins ----------------------------------------------
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
 
" ---- Pandoc/markdown Stuff ------------------------------------------
Plugin 'dhruvasagar/vim-table-mode'


" Pour todo.txt
Plugin 'elentok/todo.vim'
Plugin 'freitass/todo.txt-vim'

" Goyo permet d'avoir une fenetre propre pour écrire
Plugin 'junegunn/goyo.vim'

" ---- Extras/Advanced plugins ----------------------------------------
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
" Plugin 'godlygeek/tabular'

" ---- Syntax Plugins -------------------------------------------------
Plugin 'PotatoesMaster/i3-vim-syntax'

call vundle#end()

filetype plugin indent on


" --- General settings ---
	let mapleader=','
	let maplocalleader='_'
	set backspace=indent,eol,start
	set ruler
	set number 
	set relativenumber
	set showcmd
	set incsearch
	set ignorecase 
	set smartcase 
	set hlsearch 
	nnoremap n nzz 
	set encoding=utf-8

	syntax on
	set mouse=a

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
	hi clear SignColumn

" ----- Plugin-Specific Settings --------------------------------------

" Set the colorscheme
	set t_co=256

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" Diverses options pour Pandoc
	augroup pandoc_syntax
		au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
	augroup END


	au FileType markdown.pandoc map <F9> :w<CR>:Start! pandoc-latex % <CR>
	au FileType markdown.pandoc inoremap <F9> <Esc>:w<CR>:Start! pandoc-latex % <CR>
	au FileType markdown.pandoc inoremap <F5> <Esc>:w<CR>:Start! make view % <CR>
	au FileType markdown.pandoc map <F5> <Esc>:w<CR>:Start! make view % <CR>

	au FileType tex inoremap <F8> <Esc>:w<CR>:Start! xelatex % <CR>

" Vérification du langage avec F6
	map <F6> :setlocal spell! spelllang=fr<CR>

" PlantUML
	au! BufNewFile,BufFilePre,BufRead *.uml set filetype=uml
	au FileType uml map <F9> <Esc>:w<CR>:Start! plantuml % <CR>

" les notes de Calcurse sont considérés du Markdown
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown


" Table mode settings
let g:table_mode_corner='|'

" selection d'un buffer avec ,f
nmap <leader>b :ls<CR>:e#

" Netrw est le gestionnaire de fichier de vim
" Tweaks
let g:netrw_banner=0		" désactive l'entête
let g:netrw_browse_split=4	" ouvrir au premier plan
let g:netrw_altv=1		" ouvre les splits sur la droite
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" goyo : Écriture sans distractions
	map <F10> :Goyo<CR>
	map <leader>f :Goyo \| set linebreak<CR>
	inoremap <F10> <esc>:Goyo<CR>a

hi clear conceal



"""" Snippets
	inoremap ;snip autocmd FileType tex,markdown.pandoc inoremap 
""" Guides
	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
	map <Space><Tab> <Esc>/<++><Enter>"_c4l
	inoremap ;gui <++>
""" Markdown
	so ~/.vim/Nounou/mdSnippets.vim


