syntax enable

set guicursor=
set guifont=D2Coding:h18
set relativenumber
set nohlsearch
set background=dark
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set cmdheight=4
set updatetime=50
set shortmess+=c
set colorcolumn=80
set visualbell

call plug#begin('~/.vim/plugged')

Plug 'benmills/vimux'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-dispatch'
Plug 'nanotech/jellybeans.vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'airblade/vim-gitgutter'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'blueyed/vim-diminactive'
Plug 'hzchirs/vim-material'
Plug 'mattn/emmet-vim'

call plug#end()

colorscheme gruvbox
highlight ColorColumn guibg=DarkSlateGrey

let g:material_style='palenight'

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:indentguides_tabchar = '|'
let g:indentguides_spacechar = '┆'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='hybrid'

set laststatus=2

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:diminactive_enable_focus = 1

inoremap " ""
inoremap ' ''
inoremap ` ``
inoremap ( ()
inoremap { {}
inoremap [ []
inoremap {<CR> {<CR>}<ESC><S-o>
inoremap {;<CR> {<CR>};<ESC><S-o>
inoremap (<CR> (<CR>)<ESC><S-o>
inoremap (;<CR> (<CR>);<ESC><S-o>
inoremap [<CR> [<CR>]<ESC><S-o>
inoremap [;<CR> [<CR>];<ESC><S-o>

nnoremap <leader>; :call emmet#expandAbbr(3,"")<CR>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>s :sp<CR>
nnoremap <leader>v <C-W>v
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <Leader>q :bp<CR>
nnoremap <Leader>w :bn<CR>
nnoremap <Leader>m :Prettier<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize 100<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Vim with me
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

vnoremap X "_d
inoremap <C-c> <esc>

""command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nmap <leader>f <Plug>(coc-format-selected)

nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
