"----- Airline Theme
" let g:airline_theme = 'badwolf'

"----- FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

"----- IndentLine
" let g:indentLine_color_gui = '#4c4c4b'

"----- LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'elixir': ['~/.elixir-ls/language_server.sh']
\ }

"----- Neoterm
let g:neoterm_autoscroll = 1
let test#strategy = "neoterm"

"----- NERDTree
let NERDTreeShowHidden=1

"----- Powerline Fonts
" let g:airline_powerline_fonts = 1

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
