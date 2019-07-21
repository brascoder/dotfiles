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

"----- LanguageClient
let g:LanguageClient_serverCommands = {
    \ 'elixir': ['~/.elixir-ls/language_server.sh']
\ }

"----- Neomake
" Run Neomake on save
augroup localneomake
  autocmd! BufWritePost * Neomake
  autocmd! BufRead * Neomake
augroup END
" No smartquotes in markdown
let g:neomake_markdown_enabled_makers = []
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop']
let g:neomake_elixir_enabled_makers = ['mix', 'mycredo']
function! NeomakeCredoErrorType(entry)
  if a:entry.type ==# 'F'      " Refactoring opportunities
    let l:type = 'W'
  elseif a:entry.type ==# 'D'  " Software design suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'W'  " Warnings
    let l:type = 'W'
  elseif a:entry.type ==# 'R'  " Readability suggestions
    let l:type = 'I'
  elseif a:entry.type ==# 'C'  " Convention violation
    let l:type = 'W'
  else
    let l:type = 'M'           " Everything else is a message
  endif
  let a:entry.type = l:type
endfunction
let g:neomake_elixir_mycredo_maker = {
    \ 'exe': 'mix',
    \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
    \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
    \ 'postprocess': function('NeomakeCredoErrorType')
\ }

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
