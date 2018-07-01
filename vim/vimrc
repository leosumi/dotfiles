" Vimrc file
" Create by Léo Sumi
"
" The configuration is set to work with code (like C++)
" See Writing fold for plain text configuration

"  Vundle {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" colorschemes
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'chriskempson/base16-vim'
 Plugin 'sunaku/xoria256.vim'
 Plugin 'freeo/vim-kalisi'
 Plugin 'rakr/vim-one'

"Plugin 'vim-airline/vim-airline'                " status bar improvement
"Plugin 'vim-airline/vim-airline-themes'         " vim-airline themes collection

" Plugin I use
 Plugin 'scrooloose/syntastic'                   " Syntax checking hacks for vim
"Plugin 'vim-script/c.vim'                       " C/C++ IDE
 Plugin 'othree/html5.vim'                       " html5 syntax and indent
 Plugin 'godlygeek/tabular'                      " aligning text (and needed for vim-markdown)
 Plugin 'plasticboy/vim-markdown'                " markdown syntax highlighting
 Plugin 'MikeCoder/markdown-preview.vim'         " markdown preview plugin
 Plugin 'wikimatze/hammer.vim'                   " markup language preview
 Plugin 'vim-scripts/SearchComplete'             " TAB completion inside of /
 Plugin 'scrooloose/nerdtree'                    " tree explorer
 Plugin 'tpope/vim-surround'                     " quoting/parenthesizing made simple
 Plugin 'tpope/vim-fugitive'                     " git wrapper
 Plugin 'kien/ctrlp.vim'                         " fuzzy finder
 Plugin 'xolox/vim-misc'                         " Needed for easytags
 Plugin 'xolox/vim-easytags'                     " Tag file manager (with ctags)
 Plugin 'majutsushi/tagbar'                      " Displays tags (need vim 7.0 & ctags 5.5)
 Plugin 'derekwyatt/vim-fswitch'                 " switching between companion source files
 Plugin 'derekwyatt/vim-protodef'                " from hpp files to cpp files (need fswitch, ctags, perl) ,PP
"Plugin 'sjl/gundo.vim'                          " undo tree
"Plugin ' vim-scripts/undotree.vim'              " undo tree
 Plugin 'tmhedberg/matchit'                      " extended % matching for html, latex,...
 Plugin 'Dimercel/todo-vim'                      " manage todo notes 
 Plugin 'LaTeX-Box-Team/LaTeX-Box'               " Latex toolbox
 Plugin 'xuhdev/vim-latex-live-preview'          " Latex preview
"Plugin 'edkolev/tmuxline.vim'                   " status bar for tmux integration
"Plugin 'reedes/vim-pencil'
 Plugin 'sirver/ultisnips'                       " snippets engine
 Plugin 'honza/vim-snippets'                     " some snippets
 Plugin 'junegunn/goyo.vim'                      " distraction-free writing
 Plugin 'junegunn/limelight.vim'                 " hyperfocus-writing
 Plugin 'jceb/vim-orgmode'                       " org mode
 Plugin 'vimwiki/vimwiki'                        " easy to make wiki
 Plugin 'tell-k/vim-autopep8'                    " python code style checker (need autopep8)
 Plugin 'vim-pandoc/vim-pandoc'                  " pandoc
 Plugin 'vim-pandoc/vim-pandoc-syntax'           " pandoc
 Plugin 'vim-scripts/loremipsum'                 " dummy text generator

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" Each indentation level is two spaces. Tabs are not used
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

set spelllang=en,fr
set spellsuggest=5

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
 
