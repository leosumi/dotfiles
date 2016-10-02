" Vimrc file
" Create by Léo Sumi

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
 Plugin 'bling/vim-airline'                      " status bar improvement
"Plugin 'edkolev/tmuxline.vim'                   " status bar for tmux integration
"Plugin 'reedes/vim-pencil'
 Plugin 'sirver/ultisnips'                       " snippets engine
 Plugin 'honza/vim-snippets'                     " some snippets

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

" Tells vim what the background color looks like (can be dark or light)
set background=dark

" Colorscheme
colorscheme xoria256

" Make the current line visible
set cursorline

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
"set tabstop=2          " Set tab size (if noexpandtab)
set softtabstop=4       " how many columns when tab is used in insert mode
set shiftwidth=4        " how many columns text is indented with >> and <<

if has("autocmd")
    filetype on
    autocmd FileType tex setlocal softtabstop=2 shiftwidth=2
    autocmd FileType html setlocal softtabstop=2 shiftwidth=2
    autocmd FileType sh setlocal softtabstop=2 shiftwidth=2
    autocmd FileType make setlocal noexpandtab tabstop=4
endif

"  }}}

" Wrap and textwidth {{{

if has("autocmd")
    filetype on
    autocmd FileType text setlocal textwidth=80
    autocmd FileType plaintext setlocal textwidth=80
    autocmd FileType tex setlocal textwidth=80
    autocmd FileType markdown setlocal textwidth=80
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

"  ultisnips {{{

" Slpit the window to edit
let g:UltiSnipsEditSplit="vertical"

"  }}}

"  Templates {{{

autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
autocmd BufNewFile *.tex 0r ~/.vim/templates/skeleton.tex
autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py

"  }}}
