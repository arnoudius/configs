call plug#begin()
  Plug 'ggandor/leap.nvim'
  Plug 'joshdick/onedark.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim',
  Plug 'fedepujol/move.nvim'
  Plug 'pangloss/vim-javascript'
  Plug 'preservim/nerdtree'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bling/vim-airline'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdcommenter'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-buffer',
  Plug 'hrsh7th/cmp-nvim-lsp',
  Plug 'hrsh7th/nvim-cmp'
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
nmap <F7> :EslintFixAll<CR>

let g:NERDTreeWinSize=45 "fault NERDTree window width
let g:NERDTreeCascadeSingleChildDir=0
let g:NERDTreeCaseSensitiveSort=0

" NerdCommenter
let g:NERDSpaceDelims=1

" FZF (ctrl p ctrl b)
nnoremap <C-p> :GFiles<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-f> :Rg <C-R><C-W><CR>

" vim-move config
" let g:move_key_modifier = 'C'

vnoremap <silent> <C-j> :MoveBlock(1)<CR>
vnoremap <silent> <C-k> :MoveBlock(-1)<CR>
vnoremap <silent> <C-l> :MoveHBlock(1)<CR>
vnoremap <silent> <C-h> :MoveHBlock(-1)<CR>

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

set completeopt=menu,menuone,noselect

lua << EOF

local cmp = require'cmp'

cmp.setup({

  sources = {
    { name = 'nvim_lsp' },
    { name = "buffer" },
  },

  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  formatting = {
      format = function(entry, item)
          -- item.kind = lsp_symbols[item.kind]
          item.menu = ({
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              neorg = "[Neorg]",
          })[entry.source.name]

          return item
      end,
  },

})

local opts = {
  noremap=true,
  silent=true
}

local lsp_flags = {
  debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['tsserver'].setup{
  capabilities = capabilities,
  flags = lsp_flags,
  -- cmd = { "yarn", "typescript-language-server", "--stdio" }
}

require('lspconfig')['eslint'].setup {
  flags = lsp_flags,
  settings = {
    nodePath = '/Users/arnout.evers/repos/mc-app/.yarn/sdks'
  },
  cmd = { "vscode-eslint-language-server", "--stdio" },
}

EOF
