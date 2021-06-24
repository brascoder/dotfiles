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
}
leader_map('bb', [[:Buffers<cr>]])
leader_map('bd', [[:bdelete<cr>]])
leader_map('bn', [[:bnext<cr>]])
leader_map('bp', [[:bprevious<cr>]])

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
leader_map('er', [[:registers<cr>]])
leader_map('eR', [[:source $MYVIMRC<cr>]])
leader_map('es', [[:Scratch<cr>]])
leader_map('et', [[:NERDTreeFocus | vertical resize 31<cr>]])

-- File
lmap.f = {
  name = '+File',
  f = 'Find File',
  s = 'Save File',
}
-- lmap.f = {name = 'File'}
-- lmap.f.f = 'Find File'
-- lmap.f.s = 'Save File'
leader_map('ff', [[:Telescope find_files<cr>]])
leader_map('fs', [[:w<cr>]])

lmap.q = {name = 'Quit'}
lmap.q.q = 'Quit All'
lmap.q.q = 'Force Quit All'
leader_map('qq', [[:qa<cr>]])
leader_map('qQ', [[:qa!<cr>]])

g.lmap = lmap

vim.fn['leaderGuide#register_prefix_descriptions']('<space>', 'g:lmap')
map('n', '<leader>', [[:<c-u>LeaderGuide '<Space>'<cr>]], {noremap = true, silent = true})
map('v', '<leader>', [[:<c-u>LeaderGuideVisual '<Space>'<cr>]], {noremap = true, silent = true})
