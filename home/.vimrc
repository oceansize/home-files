" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Change <Leader>
let mapleader = ","

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set backspace=2   " Backspace deletes like most programs in insert mode
set ruler         " show the cursor position all the time
set laststatus=2  " Always display the status line
set cursorline    " highlight the current line the cursor is on

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set relativenumber
" Toggle relative line numbers
let g:NumberToggleTrigger="<leader>r"
set numberwidth=5

"sm: flashes matching brackets or parentheses
set showmatch

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" When scrolling off-screen do so 3 lines at a time, not 1
set scrolloff=3

" Enable tab complete for commands.
" first tab shows all matches. next tab starts cycling through the matches
set wildmenu

set spelllang=en_gb

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" NERDTree
let NERDTreeQuitOnOpen=1
" colored NERD Tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1
" map enter to activating a node
let NERDTreeMapActivateNode='<CR>'
let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf', '.beam']

"" Shortcuts!!

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Tab navigation
nmap <leader>tn :tabnext<CR>
nmap <leader>tp :tabprevious<CR>
nmap <leader>te :tabedit

" Remap F1 from Help to ESC.  No more accidents.
nmap <F1> <Esc>
map! <F1> <Esc>

" search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz
nmap # #nzz

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Switch into background mode
nnoremap <leader>. <C-z>

" Move between splits
nnoremap <S-Tab> <C-W>W
nnoremap <Tab> <C-W><C-W>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

" JJ escape
inoremap jj <ESC>:wa<CR>
au FocusLost * :wa

"save and run last command
nnoremap <CR> :wa<CR>:!!<CR>
noremap <C-j> <ESC>:wa<CR>:!!<CR>

"open vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" source vimrc
nnoremap <leader>es :so $MYVIMRC

" I'm not happy with this but I don't understand how vim/zsh work
set shell=/bin/sh

" Strip Whitespace
nnoremap <leader>ws :StripWhitespace<CR>

" Autoformat
map <Leader>f :Autoformat<CR>

" Move up and down by visual line (as opposed to line break only)
nnoremap j gj
nnoremap k gk

" New Theme <3
colorscheme petrel
:let g:airline_theme='base16'
" Airline theme 'base16' works well with petrel

" Setting dark mode
set background=dark

" Supercharges '%' to work on do-end, def-end, class-end, module-end etc.
runtime macros/matchit.vim

" Toggle Paste
nnoremap <leader>p :set invpaste paste?<CR>
imap <leader>p <C-O>:set invpaste paste?<CR>
set pastetoggle=<leader>p

" HardTime
let g:hardtime_default_on = 1
let g:hardtime_timeout = 900
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 2

