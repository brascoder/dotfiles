" Tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" SnipMate
imap <c-space> <plug>snipMateNextOrTrigger

" Window
nnoremap – :wincmd _<cr>:wincmd \|<cr>
nnoremap ≠ :wincmd =<cr>
nnoremap ≥ <c-w>>
nnoremap ≤ <c-w><
nnoremap ˘ <c-w>+
nnoremap ¯ <c-w>-
nnoremap ¯ <c-w>-

" Enable Ctrl-h
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>

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
