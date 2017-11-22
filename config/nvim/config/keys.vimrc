" FZF
au FileType fzf tnoremap <buffer> <esc> <c-c>

" Tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" SnipMate
imap <c-space> <plug>snipMateNextOrTrigger

" Window
nnoremap ≥ <c-w>>
nnoremap ≤ <c-w><
nnoremap ˘ <c-w>+
nnoremap ¯ <c-w>-

" Enable Ctrl-h
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>

"----- Terminal
tnoremap <esc> <c-\><c-n>

"----- Editing
inoremap <C-j> <ESC>o
inoremap <C-k> <ESC>O
" Move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
