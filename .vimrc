execute pathogen#infect()

" General {{{
filetype plugin indent on

syntax enable

let mapleader=","

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" }}}

" User Interface {{{
"Always show current position
set ruler

set number
set relativenumber

set cursorline
" }}}

" Colors {{{ 
colorscheme gruvbox
" }}}

" Movement {{{
" Mouse movement
set mouse=a

" Visual movement
nnoremap j gj
nnoremap k gk

" Highlight last inserted text
nnoremap gV `[v`]
" }}}

" Folding {{{
set foldenable

" Set .vimrc to have marker folds
autocmd FileType vim setlocal foldmethod=marker
" }}}

" Search & Match {{{
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

nnoremap <leader><space> :nohlsearch<CR>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2
" }}}

" Indents & Backspace{{{
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set ai "auto indent
set si "smart indent
set wrap 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" }}}

" Backups {{{
" Turn backup off
set nobackup
set nowb
set noswapfile
" }}}

" Errors {{{
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set belloff=all
" }}}

" Tags {{{
set tags=tags;/
" }}}

" Functions {{{
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
" }}}

" tmux {{{
" Run tests
nmap <S-F10> :!tmux send-keys -t 0:0.1 "npm test" Enter && tmux send-keys -t 0:0.0 Enter<CR>
" }}}

" Plugins {{{

" fzf {{{
nmap ; :Buffers<CR>

command! ProjectFiles execute 'Files' s:find_git_root()
nmap <Leader>f :ProjectFiles<CR>

command! ProjectTags execute 'Tags' s:find_git_root()
nmap <Leader>r :ProjectTags<CR>

let g:fzf_tags_command="ctags --exclude='*/node_modules/*' --exclude='*/dist/*' --file-scope=no -R `pwd`"
" }}}

" ALE {{{
let g:ale_sign_column_always=1
" }}}

" NERDTree {{{
map <C-n> :NERDTreeToggle<CR>
" }}}

" NERDCommenter {{{
map <C-_> :call NERDComment(0, "toggle")<CR>
" }}}

" Gutentags {{{
let g:gutentags_ctags_extra_args=['--options=/Users/danwatland/.ctags.d']
" }}}

" vim-airline {{{
let g:airline_theme = 'gruvbox'
" }}}

" }}}
