call leaderGuide#register_prefix_descriptions("<space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<space>'<cr>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<space>'<cr>

let g:lmap = {}

" Applications
let g:lmap.a = { 'name' : '+Application',
               \ 'd' : ['Dash', 'Dash'],
               \}

" File
let g:lmap.f = { 'name' : '+File',
               \ 'f' : ['CtrlP', 'Find File'],
               \ 's' : ['w', 'Save'],
               \ 'S' : ['wa', 'Save All'],
               \ 't' : ['NERDTreeFind', 'Open File Tree'],
               \ 'x' : ['x', 'Save & Close'],
               \}

" Environment
let g:lmap.e = { 'name' : '+Environment',
               \ 'i' : ['IndentLinesToggle', 'Toggle Indent Lines'],
               \ 'l' : ['set list!', 'Toggle List Chars'],
               \ 't' : ['ResetNerdTree', 'Reset File Tree'],
               \ 'R' : ['Resource', 'Reload Config'],
               \}

" Git
let g:lmap.g = { 'name' : '+Git',
               \ 'c' : ['Gcommit', 'Git Commit'],
               \ 's' : ['Gstatus', 'Git Status'],
               \}

" Project
let g:lmap.p = { 'name' : '+Project',
               \ 'a' : ['A', 'Alternate File'],
               \ 't' : ['NERDTreeToggle', 'Toggle File Tree'],
               \}

" Test
let g:lmap.t = { 'name' : '+Test',
               \ 't' : ['TestNearest', 'Test Nearest'],
               \ 'T' : ['TestFile', 'Test File'],
               \ 'a' : ['TestSuite', 'Test Suite'],
               \ 'l' : ['TestLast', 'Test Last'],
               \ 'g' : ['TestVisit', 'Go To Test'],
               \}

" Window
let g:lmap.w = { 'name' : '+Window',
               \}

"----- Commands
command! Resource source $MYVIMRC
command! ResetNerdTree NERDTreeFocus | vertical resize 31

" " Dash
" nnoremap <leader>dd :Dash<cr>

" " Vim Test
" nnoremap <leader>tt :TestNearest<cr>
" nnoremap <leader>tT :TestFile<cr>
" nnoremap <leader>ta :TestSuite<cr>
" nnoremap <leader>tl :TestLast<cr>
" nnoremap <leader>tg :TestVisit<cr>

" " NERDTree
" nnoremap <leader>pt :NERDTreeToggle<CR>
" nnoremap <leader>ft :NERDTreeFind<CR>
" nnoremap <leader>0 :NERDTreeFocus<CR> :vertical resize 31<CR>

" "----- UI
" nnoremap <leader>l :set list!<cr>
" nnoremap <leader>ig :IndentLinesToggle<cr>
" "----- Window
nnoremap <leader>wH <c-w>H
" nnoremap <leader>wJ <c-w>J
" nnoremap <leader>wK <c-w>K
" nnoremap <leader>wL <c-w>L
" nnoremap <leader>wd :q<cr>
" nnoremap <leader>wv :vsp<cr>
" nnoremap <leader>ws :sp<cr>

" "----- Misc
" nnoremap <leader>aa :setlocal spell!<cr>
" nnoremap <leader>rr :reg<cr>
" nnoremap <leader>qq :qa<cr>
" nnoremap <leader>qQ :qa!<cr>
" nnoremap <leader>qo :only<cr>

" "----- Files
" nnoremap <leader>ff :CtrlP<cr>
" nnoremap <leader>fs :w<cr>
" nnoremap <leader>fS :wa<cr>
" nnoremap <leader>fx :x<CR>
" nnoremap <leader>feR :Resource<cr>

" " ----- Search
" nnoremap <leader>hh :nohl<cr>
" nnoremap <leader>ht :set hlsearch!<cr>
" nnoremap <leader>/ :Ag!<space>

" "----- Buffers
" nnoremap <leader>br :e!<cr>
" nnoremap <leader>bR :bufdo e!<cr>:syntax enable<cr>
" nnoremap <leader>bd :bd<cr>
" nnoremap <leader>bn :bn<cr>
" nnoremap <leader>bp :bp<cr>
" nnoremap <leader>bb :CtrlPBuffer<CR>
" nnoremap <leader>ls :ls<cr>
" nnoremap <leader>bk :bd!<space>

" "----- Git
" nnoremap <leader><leader>gg  :Git<space>
" nnoremap <leader><leader>ga  :Gwrite<cr>
" nnoremap <leader><leader>gr  :Gread<cr>
" nnoremap <leader><leader>gs  :Gstatus<cr>
" nnoremap <leader><leader>gb  :Gblame<cr>
" nnoremap <leader><leader>gP  :Gpush<cr>
" nnoremap <leader><leader>gF  :Gpull<cr>
" nnoremap <leader><leader>gf  :Gfetch<cr>
" nnoremap <leader><leader>gc  :Gcommit<cr>
" nnoremap <leader><leader>glg :Git log<cr>
" nnoremap <leader><leader>gdd :Gdiff<cr>
" nnoremap <leader><leader>gdo :diffget<cr>
" nnoremap <leader><leader>gdO :diffget //
" nnoremap <leader><leader>gdp :diffput<cr>
" nnoremap <leader><leader>gdP :diffput //

" "----- Terminal
" tnoremap <esc> <c-\><c-n>
" nnoremap <leader>'' :T<space>
" nnoremap <leader>'n :Tnew<cr>
" nnoremap <leader>'o :Topen
" nnoremap <leader>'c :Tclose
" nnoremap <leader>'h :Ttoggle<cr><cr>
" nnoremap <leader>'l :Tclear
" nnoremap <leader>'k :Tkill
" " nnoremap <leader>ts :sp term://.//zsh<cr>i
" " nnoremap <leader>tv :vs term://.//zsh<cr>i

" "----- Editing
" " Insert lines
" nnoremap <leader>ij o<ESC>k
" nnoremap <leader>ik O<ESC>j
" " Split/Join
" nnoremap <leader>xn i<cr><esc>
" nnoremap <leader>xj J
" " Align
" vnoremap <leader>xaa :Tab /
" vnoremap <leader>xa: :Tab /:\zs<cr>
" "----- Utility
" nnoremap <leader><leader>s V:s/
" vnoremap <leader><leader>s :s/
" nnoremap <leader><leader>y V"*y
" vnoremap <leader><leader>y "*y
