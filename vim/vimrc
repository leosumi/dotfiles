" Vimrc file
" Create by Léo Sumi
"
" The configuration is set to work with code (like C++)
" See Writing fold for plain text configuration

"  Plugins {{{

" Automatic installation of plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" let vim-plug manage vim-plug
Plug 'junegunn/vim-plug'

" colorschemes
 Plug 'altercation/vim-colors-solarized'
 Plug 'chriskempson/base16-vim'
 Plug 'sunaku/xoria256.vim'
 Plug 'freeo/vim-kalisi'
 Plug 'rakr/vim-one'

"Plug 'vim-airline/vim-airline'                " status bar improvement
"Plug 'vim-airline/vim-airline-themes'         " vim-airline themes collection

" spelling
 Plug 'dpelle/vim-Grammalecte'                 " The Grammalecte French grammar checker
 Plug 'dpelle/vim-LanguageTool'                " The LanguageTool grammar checker

" Plug I use
 Plug 'scrooloose/syntastic'                   " Syntax checking hacks for vim
"Plug 'vim-script/c.vim'                       " C/C++ IDE
 Plug 'othree/html5.vim'                       " html5 syntax and indent
 Plug 'godlygeek/tabular'                      " aligning text (and needed for vim-markdown)
 Plug 'plasticboy/vim-markdown'                " markdown syntax highlighting
 Plug 'MikeCoder/markdown-preview.vim'         " markdown preview plugin
 Plug 'wikimatze/hammer.vim'                   " markup language preview
 Plug 'vim-scripts/SearchComplete'             " TAB completion inside of /
 Plug 'scrooloose/nerdtree'                    " tree explorer
 Plug 'tpope/vim-surround'                     " quoting/parenthesizing made simple
 Plug 'tpope/vim-fugitive'                     " git wrapper
 Plug 'kien/ctrlp.vim'                         " fuzzy finder
 Plug 'xolox/vim-misc'                         " Needed for easytags
 Plug 'xolox/vim-easytags'                     " Tag file manager (with ctags)
 Plug 'majutsushi/tagbar'                      " Displays tags (need vim 7.0 & ctags 5.5)
 Plug 'derekwyatt/vim-fswitch'                 " switching between companion source files
 Plug 'derekwyatt/vim-protodef'                " from hpp files to cpp files (need fswitch, ctags, perl) ,PP
 Plug 'vim-scripts/DoxygenToolkit.vim'         " Doxygen documentation
"Plug 'sjl/gundo.vim'                          " undo tree
"Plug ' vim-scripts/undotree.vim'              " undo tree
 Plug 'tmhedberg/matchit'                      " extended % matching for html, latex,...
 Plug 'Dimercel/todo-vim'                      " manage todo notes
 Plug 'LaTeX-Box-Team/LaTeX-Box'               " Latex toolbox
 Plug 'xuhdev/vim-latex-live-preview'          " Latex preview
"Plug 'edkolev/tmuxline.vim'                   " status bar for tmux integration
"Plug 'reedes/vim-pencil'
 Plug 'sirver/ultisnips'                       " snippets engine
 Plug 'honza/vim-snippets'                     " some snippets
 Plug 'junegunn/goyo.vim'                      " distraction-free writing
 Plug 'junegunn/limelight.vim'                 " hyperfocus-writing
 Plug 'jceb/vim-orgmode'                       " org mode
 Plug 'vimwiki/vimwiki', { 'branch': 'dev' }   " easy to make wiki
 Plug 'tell-k/vim-autopep8'                    " python code style checker (need autopep8)
 Plug 'vim-pandoc/vim-pandoc'                  " pandoc
 Plug 'vim-pandoc/vim-pandoc-syntax'           " pandoc
 Plug 'vim-scripts/loremipsum'                 " dummy text generator

call plug#end()

"  }}}

"  Global stuff {{{

" Auto-reload the vimrc afeter :w
augroup reload_vimrc
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

" Use Vim settings, rather than Vi settings
set nocompatible

" UTF encoding
set encoding=utf-8

" Set filetype stuff to on
filetype on             " file type detection (no need to do filetype on after syntax on)
filetype plugin on      " loads 'ftplugin.vim' in runtimepath
filetype indent on      " loads 'indent.vim in runtimepath

" Autoload files that have chaged outside of vim
set autoread

" Backup
set nobackup            " No backup files
set nowritebackup       " No write backup
set noswapfile          " No swap file

" Don't show intro
set shortmess+=I

" Command history
set history=100

"  }}}

"  User interface {{{

" Hide the mouse pointer while typing
set mousehide

" line's number on the left (7.4 is great)
set relativenumber
set number

" Turn word wrap off: do not break long lines
" This is great for code but not for plain text
set nowrap

" new windows appear below and to the right
set splitbelow
set splitright

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (must save first)
set hidden

"  }}}

"  Colors and fonts {{{

" Switch on syntax highlighting if it wasn't on yet
if !exists("syntax_on")
    syntax on
endif

" Colorscheme
colorscheme kalisi
let g:airline_theme='kalisi'

" Tells vim what the background color looks like (can be dark or light)
set background=dark

" Make the current line visible
set cursorline

function! SetDarkTheme()
  set background=dark
endfunction

function! SetLightTheme()
  set background=light
endfunction

command! Dark call SetDarkTheme()
command! Light call SetLightTheme()

"  }}}

"  Status line {{{

" airline with powerline fonts (need powerline package)
let g:airline_powerline_fonts = 1

" Always show the status line
set laststatus=2

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" Turn on the Wild menu (visual autocomplete for command menu)
set wildmenu            " tab : list + completion

"  }}}

"  Tab and indent {{{

" always set autoindenting on
set autoindent

" Round indent to multiple of shiftwidth (for < and >)
set shiftround

" In Insert mode: use spaces instead of tab (because of tab encoding)
set expandtab

" Each indentation level is four spaces. Tabs are not used
" tabstop == softtabstop == shiftwidth
set tabstop=4           " Set tab size (if noexpandtab)
set softtabstop=4       " how many columns when tab is used in insert mode
set shiftwidth=4        " how many columns text is indented with >> and <<

if has("autocmd")
    filetype on
    autocmd FileType make setlocal noexpandtab tabstop=4
    autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
endif

"  }}}

"  Visual help {{{

" Show matching brackets
set showmatch

" $ mark (when using c cmd)
set cpoptions+=$

"  }}}

"  Text {{{

" Automatically deletes all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"  }}}

"  Search {{{

" Switch on search pattern highlighting
set hlsearch

" do incremental searching (search as you type)
set incsearch

" Ignore case in search when the pattern contains lowercase letters only
set smartcase

" Make sure any searches /searchTerm doesn't need the \c escape character
set ignorecase

" Search down into subfolders with :find
" Provides tab-completion for all file-related tasks
set path+=**

"  }}}

"  Folding {{{

set foldmethod=syntax

if has("autocmd")
    filetype on
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType conf setlocal foldmethod=marker
endif

"  }}}

"  Spell {{{

" Use English by default for spelllang
" If a text is written in another language, use modelines
"
" Do not suggest an infinity of choices
set spellsuggest=5

" Find grammalecte
let g:grammalecte_cli_py='~/grammalecte/grammalecte-cli.py'

"  }}}

"  Mappings {{{

" backslash sucks
let mapleader = ","

" Edit the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Execute a shell command
nmap <leader>, !!$SHELL<CR>

" Spell toggle
nmap <silent> <leader>sp :setlocal spell!<CR>

" One vim
nmap <leader>cd :lcd %:h<CR>

" Switch off the current search
nmap <silent> <leader>/ :nohlsearch<CR>

" markdown-preview
nmap <leader>md :MarkdownPreview default<CR>
nmap <leader>mg :MarkdownPreview GitHub<CR>

" easytags
nmap <leader>tu :UpdateTags<CR>
nmap <leader>th :HighlightTags<CR>

" tagbar
nmap <leader>tt :TagbarToggle<CR>

" todo
nmap <leader>T :TODOToggle<CR>

" fswitch
nmap <silent> <leader>of :FSHere<CR>
nmap <silent> <leader>ol :FSRight<CR>
nmap <silent> <leader>oL :FSSplitRight<CR>
nmap <silent> <leader>oh :FSLeft<CR>
nmap <silent> <leader>oH :FSSplitLeft<CR>
nmap <silent> <leader>oj :FSBelow<CR>
nmap <silent> <leader>oJ :FSSplitBelow<CR>
nmap <silent> <leader>ok :FSAbove<CR>
nmap <silent> <leader>oK :FSSplitAbove<CR>

"  }}}

"  plugins settings {{{

" ultisnips
" Slpit the window to edit
let g:UltiSnipsEditSplit="vertical"

" vimwiki
" Use markdown syntax instead of the default one
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" vim-pandoc-syntax
" Do not use the annoying conceal feature
let g:pandoc#syntax#conceal#use=0

"  }}}

"  Templates {{{

autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py

"  }}}

"  Writing {{{
"
" The rules:
" - indent is 2 spaces because there is a lot of text
" - wrap the text to be easy to read (only visually)
" - do not add eol if enter is not used: do not use textwidth
" - linebreak and breakindent are awesome with wrap to cut the right way
" - use the elipsis for line continuation (u2026)
" - use marker to fold

if has("autocmd")
    filetype on
    autocmd FileType txt call Writing()
    autocmd FileType plaintex call Writing()
    autocmd FileType tex call Writing()
    autocmd FileType markdown call Writing()
    autocmd FileType pandoc call Writing()
    autocmd FileType html call Writing()
endif

" g prefix is tedious
function! WrapOn()
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
    noremap <buffer> <silent> 0 g0
    noremap <buffer> <silent> $ g$
endfunction

function! Writing()
    setlocal nonumber
    setlocal norelativenumber
    setlocal wrap
    setlocal linebreak
    setlocal breakindent
    setlocal showbreak=…
    call WrapOn()
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal laststatus=0
    setlocal foldmethod=marker
endfunction

"  }}}
