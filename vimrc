filetype plugin indent on
syntax enable

" Use :help 'option' to see the documentation for the given option.
set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set colorcolumn=+1
set complete-=i
set diffopt+=vertical
set display+=lastline
set encoding=utf-8
set expandtab
set history=1000
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:»·,trail:·,nbsp:·
set nobackup
set nojoinspaces
set noswapfile
set nowritebackup
set nrformats-=octal
set number
set numberwidth=5
set ruler
set scrolloff=1
set sessionoptions-=options
set shiftround
set shiftwidth=2
set showcmd
set sidescrolloff=5
set smarttab
set tabpagemax=50
set tabstop=2
set textwidth=80
set ttimeout
set ttimeoutlen=100
set viminfo^=!
set wildmenu
setglobal tags-=./tags tags-=./tags; tags^=./tags;

let mapleader=" "

nnoremap <leader><leader> <c-^>
nnoremap <silent> <leader>/ :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

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

" Load plugins
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
