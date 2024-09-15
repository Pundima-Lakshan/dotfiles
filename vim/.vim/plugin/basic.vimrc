"" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting.
map Q gq

" turn relative line numbers on
set relativenumber number

" Set leader key to Space
let mapleader = " "

" Enable search highlighting
set hlsearch

" Consider cases only if search text contains uppercase letters
set ic
set smartcase

" Normal mode key bindings

" Clear search results
nnoremap <C-l> :noh<CR>

" Switch between buffers
nnoremap <S-h> :bprevious<CR>
nnoremap <S-l> :bnext<CR>

" Splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" Pane navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Remove arrow keys from navigation
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Nice to have
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>x :x!<CR>
nnoremap [d :cprev<CR>
nnoremap ]d :cnext<CR>
nnoremap <leader>ca :<C-U>call ide#QuickFix()<CR>
nnoremap <leader>f :action QuickOpen<CR>
nnoremap <leader>p :action ReformatCode<CR>
nnoremap gh :action ShowDefinitionPreview<CR>

" Visual mode key bindings

" Stay in visual mode while indenting
vnoremap < <gv
vnoremap > >gv

" Move selected lines while staying in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Toggle comment selection
vnoremap <leader>c :action CommentByLineComment<CR>

" Remap 'c' to change without affecting the register
nnoremap c "_c
vnoremap c "_c

" Remap 'd' in Visual mode to delete to the black hole register
vnoremap d "_d

" Remap 'd' in Normal mode to delete to the black hole register
nnoremap d "_d

" Remap 'p' in visual mode to avoid replacing the register with the deleted text
vnoremap p "_c<Esc>
