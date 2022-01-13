" Plugins
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ConradIrwin/vim-bracketed-paste'
call plug#end()

" General
syntax on
filetype plugin indent on
set nocompatible
set noundofile
set belloff=all
set backspace=indent,eol,start
set encoding=utf-8
set linebreak
set number
set splitbelow splitright
set pumheight=15
set signcolumn=yes

" Indenting
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Colour scheme
colorscheme onedark
let g:airline_theme='onedark'
let g:onedark_termcolors=256
set background=dark
highlight Normal guibg=NONE ctermbg=NONE

" LaTeX
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk = { 'build_dir': 'build' }
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Mappings
cmap w!! w !sudo tee %
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>
map <C-\> :NERDTreeToggle<CR>
imap <C-\> <ESC>:NERDTreeToggle<CR>
" gvim should be installed for copy-to-clipboard to work
vmap <C-c> "+y

" Autocommands
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup TRIM_WHITESPACE
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
