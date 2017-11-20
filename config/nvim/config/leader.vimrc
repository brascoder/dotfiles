call leaderGuide#register_prefix_descriptions("<space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<space>'<cr>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<space>'<cr>

let g:lmap = {}

" Top Level
command! SilverSearch call feedkeys(':Ag! ', 't')
let g:lmap['/'] = ['SilverSearch', 'Silver Search']

" Application
let g:lmap.a = { 'name' : '+Application',
               \ 'd' : ['Dash', 'Dash'],
               \}

" Buffer
let g:lmap.b = { 'name' : '+Buffer',
               \ 'b' : ['CtrlPBuffer', 'Find Buffer'],
               \ 'd' : ['bd', 'Delete Buffer'],
               \ 'l' : ['ls', 'List Buffers'],
               \ 'n' : ['bn', 'Next Buffer'],
               \ 'p' : ['bp', 'Previous Buffer'],
               \}

" Environment
command! ShowHelp call feedkeys(':h<space>', 't')
command! Resource source $MYVIMRC
command! ResetNerdTree NERDTreeFocus | vertical resize 31
let g:lmap.e = { 'name' : '+Environment',
               \ 'a' : ['setlocal spell!', 'Toggle Spell Check'],
               \ 'e' : ['ShowHelp', 'Help'],
               \ 'h' : ['set hlsearch!', 'Toggle Search Highlight'],
               \ 'i' : ['IndentLinesToggle', 'Toggle Indent Lines'],
               \ 'l' : ['set list!', 'Toggle List Chars'],
               \ 'P' : ['PlugInstall', 'Install Plugins'],
               \ 'r' : ['registers', 'Show Registers'],
               \ 'R' : ['Resource', 'Reload Config'],
               \ 't' : ['ResetNerdTree', 'Reset File Tree'],
               \}

" File
let g:lmap.f = { 'name' : '+File',
               \ 'f' : ['CtrlP', 'Find File'],
               \ 's' : ['w', 'Save'],
               \ 'S' : ['wa', 'Save All'],
               \ 't' : ['NERDTreeFind', 'Open File Tree'],
               \ 'x' : ['x', 'Save & Close'],
               \}

" Git
command! GitRun call feedkeys(':Git<space>', 't')
let g:lmap.g = { 'name' : '+Git',
               \ 'a' : ['Gwrite', 'Git Add File'],
               \ 'b' : ['Gblame', 'Git Blame'],
               \ 'c' : ['Gcommit', 'Git Commit'],
               \ 'd' : ['Gdiff', 'Git Diff'],
               \ 'f' : ['Gfetch', 'Git Fetch'],
               \ 'F' : ['Gpull', 'Git Pull'],
               \ 'g' : ['GitRun', 'Run Git Command'],
               \ 'P' : ['Gpush', 'Git Push'],
               \ 'r' : ['Gread', 'Git Reset File'],
               \ 's' : ['Gstatus', 'Git Status'],
               \}

" Project
command! GoToDef call feedkeys('<c-]>', 't')
let g:lmap.p = { 'name' : '+Project',
               \ 'a' : ['A', 'Alternate File'],
               \ 'b' : ['TagbarToggle', 'Toggle Tagbar'],
               \ 'c' : ['CtrlPBufTag', 'Find Tag'],
               \ 'g' : ['GoToDef', 'Go To Definition'],
               \ 'G' : ['! ctags', 'Generate Tags'],
               \ 't' : ['NERDTreeToggle', 'Toggle File Tree'],
               \}

" Test
let g:lmap.T = { 'name' : '+Test',
               \ 't' : ['TestNearest', 'Test Nearest'],
               \ 'T' : ['TestFile', 'Test File'],
               \ 'a' : ['TestSuite', 'Test Suite'],
               \ 'l' : ['TestLast', 'Test Last'],
               \ 'g' : ['TestVisit', 'Go To Test'],
               \}

" Terminal
command! ShellSend call feedkeys(':!<space>', 't')
command! TermSend call feedkeys(':T<space>', 't')
command! TermClose call feedkeys(':Tclose', 't')
command! TermKill call feedkeys(':Tkill', 't')
command! TermClear call feedkeys(':Tclear', 't')
command! TermOpen call feedkeys(':Topen', 't')
command! TermFocus Topen | wincmd b | call feedkeys('i', 't')
command! TermKillWindow Topen | wincmd b | close
let g:lmap.t = { 'name' : '+Terminal',
               \ 'c' : ['TermClose', 'Close Terminal(n)'],
               \ 'h' : ['Ttoggle', 'Toggle Terminal'],
               \ 'i' : ['TermFocus', 'Terminal Focus'],
               \ 'k' : ['TermKill', 'Kill Process'],
               \ 'l' : ['TermClear', 'Clear Terminal'],
               \ 'n' : ['Tnew', 'New Terminal'],
               \ 'o' : ['TermOpen', 'Open Terminal'],
               \ 's' : ['ShellSend', 'Shell Send'],
               \ 't' : ['TermSend', 'Terminal Send'],
               \ 'w' : ['TermKillWindow', 'Kill Process Window'],
               \}

" Text
command! JoinLine call feedkeys('J', 't')
command! SplitNewline call feedkeys('i<cr><esc>', 't')
command! NSubstitute call feedkeys('V:s/', 't')
command! VSubstitute call feedkeys(':s/', 't')
command! NYankToClip call feedkeys('V"*y', 't')
command! VYankToClip call feedkeys('"*y', 't')
let g:lmap.x = { 'name' : '+Text',
               \ 'j' : ['JoinLine', 'Join Lines'],
               \ 'n' : ['SplitNewline', 'Split Newline'],
               \ 's' : ['NSubstitute', 'Normal Substitute'],
               \ 'S' : ['VSubstitute', 'Visual Substitute'],
               \ 'y' : ['NYankToClip', 'Normal Yank to Clipboard'],
               \ 'Y' : ['VYankToClip', 'Visual Yank to Clipboard'],
               \}

" Text/Align
command! AlignColon call feedkeys(':Tab /:\zs<cr>', 't')
command! Align call feedkeys(':Tab /', 't')
let g:lmap.x.a = { 'name' : '+Text',
               \ ':' : ['AlignColon', 'Align :'],
               \ 'a' : ['Align', 'Align'],
               \}

" Text/Insert
command! InsertAbove call feedkeys('o<esc>k', 't')
command! InsertBelow call feedkeys('O<esc>j', 't')
let g:lmap.x.i = { 'name' : '+Insert',
               \ 'j' : ['InsertAbove', 'Insert Line Above'],
               \ 'k' : ['InsertBelow', 'Insert Line Below'],
               \}

" Window
let g:lmap.w = { 'name' : '+Window',
               \ 'd' : ['close', 'Close Window'],
               \ 's' : ['split', 'Horizontal Split'],
               \ 'v' : ['vsplit', 'Vertical Split'],
               \ 'h' : ['wincmd H', 'Move Window Left'],
               \ 'j' : ['wincmd J', 'Move Window Down'],
               \ 'k' : ['wincmd K', 'Move Window Up'],
               \ 'l' : ['wincmd L', 'Move Window Right'],
               \ 'o' : ['only', 'Close Other Windows'],
               \}

" Quit
let g:lmap.q = { 'name' : '+Quit',
               \ 'q' : ['qa', 'Quit All'],
               \ 'Q' : ['qa!', 'Force Quit All'],
               \}
