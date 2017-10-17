"----- Deoplete
let g:deoplete#enable_at_startup = 1

"----- Neomake
" Run Neomake on save
augroup localneomake
  autocmd! BufWritePost * Neomake
augroup END
" No smartquotes in markdown
let g:neomake_markdown_enabled_makers = []
let g:neomake_elixir_enabled_makers = ['mix', 'credo']

"----- Neoterm
let g:neoterm_autoscroll = 1

"----- Neoterm
let test#strategy = "neoterm"

"----- Airline Theme
let g:airline_theme = 'badwolf'

"----- Powerline Fonts
let g:airline_powerline_fonts = 1

"----- NERDTree
let NERDTreeShowHidden=1

"----- CrtlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules)$'
