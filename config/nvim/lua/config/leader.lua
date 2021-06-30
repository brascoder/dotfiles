local utils = require('config.utils')
local nleader = utils.nleader
local vleader = utils.vleader
local map = vim.api.nvim_set_keymap
local g, cmd = vim.g, vim.cmd

funcs = require('config.funcs')

local lmap = {}

-- Top Level
lmap['/'] = 'Ag Search'
nleader('/', [[:Ag<cr>]])

-- Buffer
lmap.b = {
  name = '+Buffer',
  b = 'Show Buffers',
  d = 'Delete Current Buffer',
  n = 'Next Buffer',
  o = 'Kill Other Buffers',
  p = 'Previous Buffer',
  t = 'Tags',
}
nleader('bb', [[:Telescope buffers<cr>]])
nleader('bd', [[:bdelete<cr>]])
nleader('bn', [[:bnext<cr>]])
nleader('bo', [[:BufOnly<cr>]])
nleader('bp', [[:bprevious<cr>]])
nleader('bt', [[:BTags<cr>]])

-- Environment
lmap.e = {
  name = '+Environment',
  a = 'Toggle Spell Check',
  h = 'Toggle Search Highlight',
  i = 'Toggle Indent Lines',
  m = 'Messages',
  P = {
    name = '+Plugins',
    c = 'Clean Plugins',
    p = 'Install Plugins',
    s = 'Sync Plugins',
    S = 'Plugin Status',
    u = 'Update Plugins',
  },
  r = 'Registers',
  R = 'Reload Config',
  s = 'Scratch Buffer',
  t = 'Reset File Tree',
}
cmd [[command! Scratch lua funcs.make_scratch()]]
nleader('ea', [[:setlocal spell!<cr>]])
nleader('eh', [[:set hlsearch!<cr>]])
nleader('ei', [[:IndentLinesToggle<cr>]])
nleader('em', [[:messages<cr>]])
nleader('ePc', [[:PackerClean<cr>]])
nleader('ePp', [[:PackerInstall<cr>]])
nleader('ePs', [[:PackerSync<cr>]])
nleader('ePS', [[:PackerStatus<cr>]])
nleader('ePu', [[:PackerUpdate<cr>]])
nleader('er', [[:Telescope registers<cr>]])
nleader('eR', [[:source $MYVIMRC<cr>]])
nleader('es', [[:Scratch<cr>]])
nleader('et', [[:NERDTreeFocus | vertical resize 31<cr>]])

-- File
lmap.f = {
  name = '+File',
  f = 'Find File',
  p = 'Copy File Path',
  r = 'Reload File',
  R = 'Force Reload File',
  s = 'Save File',
  S = 'Save All',
  t = 'Find in File Tree',
  x = 'Save & Close',
}
nleader('ff', [[:Telescope find_files<cr>]])
nleader('fp', [[:let @*=@%<cr>]])
nleader('fr', [[:e<cr>]])
nleader('fR', [[:e!<cr>]])
nleader('fs', [[:w<cr>]])
nleader('fS', [[:wa<cr>]])
nleader('ft', [[:NERDTreeFind<cr>]])
nleader('fx', [[:x<cr>]])

-- Git
lmap.g = {
  name = '+Git',
  h = {
    name = '+Hunk',
    n = 'Next Hunk',
    p = 'Previous Hunk',
    s = 'Stage Hunk',
    u = 'Undo Hunk',
  },
}
nleader('ghn', [[:GitGutterNextHunk]])
nleader('ghp', [[:GitGutterPreviousHunk]])
nleader('ghs', [[<Plug>(GitGutterStageHunk)]])
nleader('ghu', [[<Plug>(GitGutterUndoHunk)]])

-- Hop
lmap.h = {
  name = '+Hop',
  h = 'Hop to Char',
  l = 'Hop to Line',
  p = 'Hop to Pattern',
}
nleader('hh', [[:HopChar1<cr>]])
nleader('hl', [[:HopLine<cr>]])
nleader('hp', [[:HopPattern<cr>]])

-- Project
lmap.p = {
  name = '+Project',
  a = 'Alternate File',
  f = 'Toggle File Tree',
  F = 'Focus File Tree',
  t = 'Tags',
  T = 'Generate Tags',
}
nleader('pa', [[:A<cr>]])
nleader('pf', [[:NERDTreeToggle<cr>]])
nleader('pF', [[:NERDTreeFocus<cr>]])
nleader('pt', [[:Telescope tags<cr>]])
nleader('pT', [[:! ctags<cr>]])

-- Text
lmap.x = {
  name = '+Text',
  i = {
    name = '+Insert',
    j = 'Insert Line Below',
    k = 'Insert Line Above',
  },
  n = 'Split New Line',
  s = 'Substitute',
  y = 'Yank Live to Clipboard',
}
cmd [[command! InsertAbove call feedkeys('O<esc>j', 't')]]
cmd [[command! InsertBelow call feedkeys('o<esc>k', 't')]]
cmd [[command! SplitNewline call feedkeys('i<cr><esc>', 't')]]
cmd [[command! NSubstitute call feedkeys(':s/', 't')]]
cmd [[command! YankLineToClip call feedkeys('^v$h"*y', 't')]]
nleader('xij', [[:InsertBelow<cr>]])
nleader('xik', [[:InsertAbove<cr>]])
nleader('xn', [[:SplitNewline<cr>]])
nleader('xs', [[:NSubstitute<cr>]])
vleader('xs', [[:NSubstitute<cr>]])
nleader('xy', [[:YankLineToClip<cr>]])

-- Text/Align
lmap.x.a = {name = '+Align'}
lmap.x.a.a = 'Align...'
lmap.x.a[':'] = 'Align (:)'
lmap.x.a['='] = 'Align (=)'
lmap.x.a[','] = 'Align (,)'
cmd [[command! AlignColon call feedkeys(':Tab /:\zs/l0l1<cr>', 't')]]
cmd [[command! AlignEqual call feedkeys(':Tab /=/<cr>', 't')]]
cmd [[command! AlignComma call feedkeys(':Tab /,\zs<cr>', 't')]]
vleader('xa:', [[:AlignColon<cr>]])
vleader('xa=', [[:AlignEqual<cr>]])
vleader('xa,', [[:AlignComma<cr>]])
vleader('xa,', [[:Tab /]])

-- Window
lmap.w = {
  name = '+Window',
  c = 'Close Window',
  h = 'Move Window Left',
  j = 'Move Window Down',
  k = 'Move Window Up',
  l = 'Move Window Right',
  o = 'Close Other Windows',
  x = 'Horizontal Split',
  v = 'Vertical Split',
  w = 'Show Windows',
}
nleader('wc', [[:close<cr>]])
nleader('wh', [[:wincmd H<cr>]])
nleader('wj', [[:wincmd J<cr>]])
nleader('wk', [[:wincmd K<cr>]])
nleader('wl', [[:wincmd L<cr>]])
nleader('wo', [[:only<cr>]])
nleader('wx', [[:split<cr>]])
nleader('wv', [[:vsplit<cr>]])
nleader('ww', [[:Windows<cr>]])

-- Quit
lmap.q = {name = 'Quit'}
lmap.q.q = 'Quit All'
lmap.q.q = 'Force Quit All'
nleader('qq', [[:qa<cr>]])
nleader('qQ', [[:qa!<cr>]])

g.lmap = lmap

vim.fn['leaderGuide#register_prefix_descriptions']('<space>', 'g:lmap')
map('n', '<leader>', [[:<c-u>LeaderGuide '<Space>'<cr>]], {noremap = true, silent = true})
map('v', '<leader>', [[:<c-u>LeaderGuideVisual '<Space>'<cr>]], {noremap = true, silent = true})
