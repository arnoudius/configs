set encoding=utf-8
set shell=/bin/sh

" Auto indentation
filetype plugin indent on

" Plug plugin manager
call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim',
Plug 'joshdick/onedark.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neomake/neomake'

"Plug 'eslint/eslint'
"Plug 'scrooloose/syntastic'
"Plug 'tpope/vim-fugitive'
"Plug 'tmhedberg/simpylfold'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround' " easily replace quotes
Plug 'scrooloose/nerdcommenter' " easily comment out lines / blocks
"Plug 'jimmyhchan/dustjs.vim'
"Plug 'easymotion/vim-easymotion'
"Plug 'airblade/vim-gitgutter'
Plug 'matze/vim-move'
"Plug 'leafgarland/typescript-vim'

call plug#end()

" Theme
syntax on

if &diff
  highlight DiffAdd cterm=BOLD ctermfg=NONE ctermbg=22
  highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
  highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
  highlight DiffText cterm=BOLD ctermfg=NONE ctermbg=23
else
  colorscheme onedark
endif

" Vim options
set number
set numberwidth=8
set hls
set ic
set t_ut= "disable background clearing
set lsp=4
set list
set listchars=eol:¬,tab:→\ ,trail:·,extends:→,precedes:←
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=92
set bufhidden=unload
set directory=$HOME/.vim/swap_files//
set backupdir=$HOME/.vim/backup_files//
set undodir=$HOME/.vim/undo_files//
set nohlsearch
set backspace=2

" Vim gitgutter
set updatetime=1000

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

" Syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_debug = 3

" neomake config
let g:neomake_javascript_enabled_makers = ['eslint']

call neomake#configure#automake('nrwi', 100)

" vim-move config
let g:move_key_modifier = 'C'

" Prettier
"nnoremap <C-F> :Prettier<CR>

" Key mappings
nmap <F9> :NERDTreeToggle<CR>
nmap <F8> :NERDTreeFind<CR>

" Disable arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Tabs
nnoremap <C-t> :tabnew<CR>

" FZF (ctrl p ctrl b)
nnoremap <C-p> :GFiles<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-b> :Buffers<CR>

" Automatically trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

