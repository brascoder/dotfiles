"----- Airline Theme
let g:airline_theme = 'badwolf'

"----- CrtlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/](\.git|tmp|node_modules|_build)$'

"----- Deoplete
let g:deoplete#enable_at_startup = 1

"----- FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"----- IndentLine
let g:indentLine_color_gui = '#4c4c4b'

"----- Neomake
" Run Neomake on save
augroup localneomake
  autocmd! BufWritePost * Neomake
augroup END
" No smartquotes in markdown
let g:neomake_markdown_enabled_makers = []
let g:neomake_elixir_enabled_makers = []

"----- Neoterm
let g:neoterm_autoscroll = 1
let test#strategy = "neoterm"

"----- NERDTree
let NERDTreeShowHidden=1

"----- Powerline Fonts
let g:airline_powerline_fonts = 1

"----- Tagbar
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:constants',
        \ 'f:methods',
        \ 'F:singleton methods',
        \ 'i:tests'
    \ ]
\ }
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
\ }

"----- Ultisnips
let g:UltiSnipsExpandTrigger="<c-space>"
