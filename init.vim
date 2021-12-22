call plug#begin()
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim',
  Plug 'matze/vim-move'
  Plug 'pangloss/vim-javascript'
  Plug 'preservim/nerdtree'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'neomake/neomake'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-airline'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
call plug#end()"

" Vim options
syntax on
colorscheme onedark

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
set nohlsearch
set backspace=2
set listchars=eol:¬,tab:→\ ,trail:·,extends:→,precedes:←

" Nerdtree
nmap <F9> :NERDTreeToggle<CR>
nmap <F8> :NERDTreeFind<CR>

let g:NERDTreeWinSize=45 "fault NERDTree window width
let g:NERDTreeCascadeSingleChildDir=0
let g:NERDTreeCaseSensitiveSort=0

" Neomake
call neomake#configure#automake('nrwi', 100)

let g:neomake_javascript_enabled_makers = ['eslint']

" FZF (ctrl p ctrl b)
nnoremap <C-p> :GFiles<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Rg <C-R><C-W><CR>

" vim-move config
let g:move_key_modifier = 'C'

" Multicursor config
let g:multicursor_insert_maps = 1
let g:multicursor_normal_maps = 1

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

" Automatically trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
