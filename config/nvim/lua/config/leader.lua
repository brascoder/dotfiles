local leader_map = require('config.utils').leader_map
local map = vim.api.nvim_set_keymap
local g, cmd = vim.g, vim.cmd

funcs = require('config.funcs')

local lmap = {}

-- Top Level
lmap['/'] = 'Ag Search'
leader_map('/', ':Ag<cr>')

-- Buffer
lmap.b = {
  name = '+Buffer',
  b = 'Show Buffers',
  d = 'Delete Current Buffer',
  n = 'Next Buffer',
  p = 'Previous Buffer',
  t = 'Tags',
}
leader_map('bb', [[:Buffers<cr>]])
leader_map('bd', [[:bdelete<cr>]])
leader_map('bn', [[:bnext<cr>]])
leader_map('bp', [[:bprevious<cr>]])
leader_map('bt', [[:BTags<cr>]])

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
leader_map('ea', [[:setlocal spell!<cr>]])
leader_map('eh', [[:set hlsearch!<cr>]])
leader_map('ei', [[:IndentLinesToggle<cr>]])
leader_map('em', [[:messages<cr>]])
leader_map('ePc', [[:PackerClean<cr>]])
leader_map('ePp', [[:PackerInstall<cr>]])
leader_map('ePs', [[:PackerSync<cr>]])
leader_map('ePS', [[:PackerStatus<cr>]])
leader_map('ePu', [[:PackerUpdate<cr>]])
leader_map('er', [[:Telescope registers<cr>]])
leader_map('eR', [[:source $MYVIMRC<cr>]])
leader_map('es', [[:Scratch<cr>]])
leader_map('et', [[:NERDTreeFocus | vertical resize 31<cr>]])

-- File
lmap.f = {
  name = '+File',
  f = 'Find File',
  r = 'Reload File',
  R = 'Force Reload File',
  s = 'Save File',
  S = 'Save All',
  t = 'Find in File Tree',
  x = 'Save & Close',
}
leader_map('ff', [[:Telescope find_files<cr>]])
leader_map('fr', [[:e<cr>]])
leader_map('fR', [[:e!<cr>]])
leader_map('fs', [[:w<cr>]])
leader_map('fS', [[:wa<cr>]])
leader_map('ft', [[:NERDTreeFind<cr>]])
leader_map('fx', [[:x<cr>]])

-- Project
lmap.p = {
  name = '+Project',
  a = 'Alternate File',
  f = 'Toggle File Tree',
  F = 'Focus File Tree',
  t = 'Tags',
  T = 'Generate Tags',
}
leader_map('pa', [[:A<cr>]])
leader_map('pf', [[:NERDTreeToggle<cr>]])
leader_map('pF', [[:NERDTreeFocus<cr>]])
leader_map('pt', [[:Telescope tags<cr>]])
leader_map('pT', [[:! ctags<cr>]])

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
  S = 'Line Substitute',
  y = 'Yank to Clipboard',
  Y = 'Yank Line to Clipboard',
}
cmd [[command! InsertAbove call feedkeys('O<esc>j', 't')]]
cmd [[command! InsertBelow call feedkeys('o<esc>k', 't')]]
cmd [[command! SplitNewline call feedkeys('i<cr><esc>', 't')]]
cmd [[command! NSubstitute call feedkeys(':s/', 't')]]
cmd [[command! LSubstitute call feedkeys('V:s/', 't')]]
cmd [[command! NYankToClip call feedkeys('"*y<esc>', 't')]]
cmd [[command! LYankToClip call feedkeys('^v$h"*y', 't')]]
leader_map('xij', [[:InsertBelow<cr>]])
leader_map('xik', [[:InsertAbove<cr>]])
leader_map('xn', [[:SplitNewline<cr>]])
leader_map('xs', [[:NSubstitute<cr>]])
leader_map('xS', [[:LSubstitute<cr>]])
leader_map('xy', [[:NYankToClip<cr>]])
leader_map('xY', [[:LYankToClip<cr>]])

-- Text/Align
lmap.x.a = {name = '+Align'}
lmap.x.a.a = 'Align...'
lmap.x.a[':'] = 'Align (:)'
lmap.x.a['='] = 'Align (=)'
lmap.x.a[','] = 'Align (,)'
cmd [[command! AlignColon call feedkeys(':Tab /:\zs/l0l1<cr>', 't')]]
cmd [[command! AlignEqual call feedkeys(':Tab /=/<cr>', 't')]]
cmd [[command! AlignComma call feedkeys(':Tab /,\zs<cr>', 't')]]
leader_map('xa:', [[:AlignColon<cr>]])
leader_map('xa=', [[:AlignEqual<cr>]])
leader_map('xa,', [[:AlignComma<cr>]])
leader_map('xa,', [[:Tab /]])

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
leader_map('wc', [[:close<cr>]])
leader_map('wh', [[:wincmd H<cr>]])
leader_map('wj', [[:wincmd J<cr>]])
leader_map('wk', [[:wincmd K<cr>]])
leader_map('wl', [[:wincmd L<cr>]])
leader_map('wo', [[:only<cr>]])
leader_map('wx', [[:split<cr>]])
leader_map('wv', [[:vsplit<cr>]])
leader_map('ww', [[:Windows<cr>]])

-- Quit
lmap.q = {name = 'Quit'}
lmap.q.q = 'Quit All'
lmap.q.q = 'Force Quit All'
leader_map('qq', [[:qa<cr>]])
leader_map('qQ', [[:qa!<cr>]])

g.lmap = lmap

vim.fn['leaderGuide#register_prefix_descriptions']('<space>', 'g:lmap')
map('n', '<leader>', [[:<c-u>LeaderGuide '<Space>'<cr>]], {noremap = true, silent = true})
map('v', '<leader>', [[:<c-u>LeaderGuideVisual '<Space>'<cr>]], {noremap = true, silent = true})
