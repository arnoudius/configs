set encoding=utf-8
set shell=/bin/sh

" auto indentation
filetype plugin indent on

" plug plugin manager
call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim',
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'eslint/eslint'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tmhedberg/simpylfold'
Plug 'jiangmiao/auto-pairs'
Plug 'xolox/vim-misc' " used by vim-session
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround' " easily replace quotes
Plug 'scrooloose/nerdcommenter' " easily comment out lines / blocks
Plug 'majutsushi/tagbar' " easily navigate trough file
Plug 'groenewege/vim-less'
Plug 'jimmyhchan/dustjs.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'matze/vim-move'

call plug#end()

" theme
syntax on

if &diff
  highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22
  highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
  highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
  highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=23
else
  colorscheme onedark
endif


" vim options
set number
set numberwidth=8
set hls
set ic
set t_ut= "disable background clearing
set lsp=4
" set guioptions -=m
" set guioptions -=T
" set guioptions -=L
" set guioptions -=r
set list
set listchars=eol:¬,tab:→\ ,trail:·,extends:→,precedes:←
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=80
set bufhidden=unload
set directory=$HOME/.vim/swap_files//
set backupdir=$HOME/.vim/backup_files//
set undodir=$HOME/.vim/undo_files//
set nohlsearch
set backspace=2

" Multicursor config
let g:multicursor_insert_maps = 1
let g:multicursor_normal_maps = 1

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

" NERDTree config
let g:NERDTreeWinSize=45 "fault NERDTree window width
let g:NERDTreeCascadeSingleChildDir=0
let g:NERDTreeCaseSensitiveSort=0

" ripgrep
"if executable('rg')
  "set grepprg=rg\ --no-heading\ --vimgrep
  "set grepformat=%f:%l:%c:%m
"endif

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

"let g:syntastic_debug = 3  " -> :mes

" key mappings
nmap <F9> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" tabs
nnoremap <C-t> :tabnew<CR>

" fzf ctrl p ctrl b
nnoremap <C-p> :GFiles<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-b> :Buffers<CR>

" automatically trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

let g:ctrlp_working_path_mode = 'ra'

" move plugin
let g:move_key_modifier = 'C'
