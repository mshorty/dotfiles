set exrc
set guicursor=
set relativenumber
set nu
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set smartindent
set noswapfile
set nobackup
set clipboard=unnamed
" set undodir=~/.vim/undodir
set undofile
set termguicolors
set background=dark
syntax on
filetype plugin indent on

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

set laststatus=2


call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
"Plug 'gruvbox-community/gruvbox'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" GUI enhancements
Plug 'itchyny/lightline.vim'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'hashivim/vim-terraform'
"color and themes
"Plug 'tjdevries/colorbuddy.vim'
"Plug 'tjdevries/gruvbuddy.nvim'
"Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'vimwiki/vimwiki'
Plug 'rakr/vim-one'
Plug 'tools-life/taskwiki'
Plug 'nvim-lualine/lualine.nvim'
call plug#end()

"colorscheme gruvbox
"lua require('colorbuddy').colorscheme('gruvbuddy')
"let ayucolor="mirage"
colorscheme catppuccin
"highlight Normal guibg=none

let mapleader = " "
"let g:airline_theme='dracula'

"let g:lightline = { 'colorscheme': 'palenight' }

" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Vim Wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Makes vimwiki markdown links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'bash']
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us spellsuggest=best,9 spellcapcheck=

lua << END
require('lualine').setup {
  options = {
    theme = 'catppuccin'
  }
}
END

" No arrow keys --- force yourself to use the home row
"# nnoremap <up> <nop>
"# nnoremap <down> <nop>
"# inoremap <up> <nop>
"# inoremap <down> <nop>
"# inoremap <left> <nop>
"# inoremap <right> <nop>
