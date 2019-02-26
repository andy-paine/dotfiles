execute pathogen#infect()
syntax on

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
let NERDTreeMapOpenInTab='<ENTER>'
"Shift up/down changes windows
nnoremap <S-Up> <C-w>k
nnoremap <S-Down> <C-w>j

"Shift left/right changes tabs
nnoremap <S-Left> :tabN<return>
nnoremap <S-Right> :tabn<return>

nmap = :NERDTreeToggle<CR>
:colorscheme duoduo
"From https://github.com/richardTowers/gds-co-authored-macro
let @a='ICo-authored-by: ly$A <@digital.cabinet-office.gov.uk>F@Pva<guf r.'

autocmd BufWritePre * :%s/\s\+$//e
