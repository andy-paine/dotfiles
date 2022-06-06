execute pathogen#infect()
syntax on
filetype plugin indent on

set termguicolors
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set incsearch
set hlsearch
set number

au FileType gitcommit set tw=72
au BufWritePre *.rego Autoformat
let NERDTreeMapOpenInTab='<ENTER>'
"Shift up/down changes windows
nnoremap <S-Up> <C-w>k
nnoremap <S-Down> <C-w>j

"Shift left/right changes tabs
nnoremap <S-Left> :tabN<return>
nnoremap <S-Right> :tabn<return>

nmap = :NERDTreeToggle<CR>
:colorscheme base16-default-dark

autocmd BufWritePre * :%s/\s\+$//e
inoremap ^[# #
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
