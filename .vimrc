if &compatible
  set nocompatible
endif

silent! while 0
  set nocompatible
silent! endwhile

if has("autocmd")

  filetype plugin indent on

  augroup vimStartup
    au!

    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set nolangremap
set incsearch
set mouse=a
set ttyfast
set backspace=indent,eol,start
set ruler		" show the cursor position all the time
set nrformats-=octal
set showcmd		" display incomplete commands
set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set display=truncate
set scrolloff=5
set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab
set smartindent
set shiftround
set number
set numberwidth=5
set rnu
set t_Co=256
set laststatus=2
set hidden
set noswapfile 
set nobackup
set nowritebackup
set history=50
set wildmenu	
set wildignore=**/node_modules,**.pyc,**.pyo,__pycache__
set wildmode=list:longest,full
set cursorline
set visualbell
set autowrite
set autoread
set hlsearch
set smartcase
set gdefault
set showmatch
set textwidth=80
set list listchars=tab:»·,trail:·,nbsp:·
"set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1
set matchpairs+=<:>
set diffopt+=vertical
set pastetoggle=<F2>

let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }


let g:netrw_banner=0
let g:netrw_liststyle=3
let g:html_indent_tags='li\|p'
let c_comment_strings=1

function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction

autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

nnoremap <CR> o<Esc>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <silent> <leader>, :noh<CR>
nnoremap j gj
nnoremap k gk
inoremap <C-U> <C-G>u<C-U>
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map Q gq
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>

syntax on
execute pathogen#infect()
colorscheme gruvbox
