local utils = require("config.utils")
local nleader = utils.nleader
local vleader = utils.vleader
local map = vim.api.nvim_set_keymap
local g, cmd = vim.g, vim.cmd

funcs = require("config.funcs")

local lmap = {}

-- Top Level
lmap["/"] = "Ag Search"
nleader("/", [[:Ag<CR>]])

-- Buffer
lmap.b = {
  name = "+Buffer",
  b = "Show Buffers",
  d = "Delete Current Buffer",
  n = "Next Buffer",
  o = "Kill Other Buffers",
  p = "Previous Buffer",
  t = "Tags",
}
nleader("bb", [[:Telescope buffers<CR>]])
nleader("bd", [[:bdelete<CR>]])
nleader("bn", [[:bnext<CR>]])
nleader("bo", [[:BufOnly<CR>]])
nleader("bp", [[:bprevious<CR>]])
nleader("bt", [[:BTags<CR>]])

-- Environment
lmap.e = {
  name = "+Environment",
  a = "Toggle Spell Check",
  h = "Toggle Search Highlight",
  i = "Toggle Indent Lines",
  m = "Messages",
  P = {
    name = "+Plugins",
    c = "Clean Plugins",
    p = "Install Plugins",
    s = "Sync Plugins",
    S = "Plugin Status",
    u = "Update Plugins",
  },
  r = "Registers",
  R = "Reload Config",
  s = "Scratch Buffer",
  t = "Reset File Tree",
}
cmd [[command! Scratch lua funcs.make_scratch()]]
nleader("ea", [[:setlocal spell!<CR>]])
nleader("eh", [[:set hlsearch!<CR>]])
nleader("ei", [[:IndentLinesToggle<CR>]])
nleader("em", [[:messages<CR>]])
nleader("ePc", [[:PackerClean<CR>]])
nleader("ePp", [[:PackerInstall<CR>]])
nleader("ePs", [[:PackerSync<CR>]])
nleader("ePS", [[:PackerStatus<CR>]])
nleader("ePu", [[:PackerUpdate<CR>]])
nleader("er", [[:Telescope registers<CR>]])
nleader("eR", [[:source $MYVIMRC<CR>]])
nleader("es", [[:Scratch<CR>]])
nleader("et", [[:NERDTreeFocus | vertical resize 31<CR>]])

-- File
lmap.f = {
  name = "+File",
  f = "Find File",
  p = "Copy File Path",
  r = "Reload File",
  R = "Force Reload File",
  s = "Save File",
  S = "Save All",
  t = "Find in File Tree",
  x = "Save & Close",
}
nleader("ff", [[:Telescope find_files<CR>]])
nleader("fp", [[:let @*=@%<CR>]])
nleader("fr", [[:e<CR>]])
nleader("fR", [[:e!<CR>]])
nleader("fs", [[:w<CR>]])
nleader("fS", [[:wa<CR>]])
nleader("ft", [[:NERDTreeFind<CR>]])
nleader("fx", [[:x<CR>]])

-- Git
lmap.g = {
  name = "+Git",
  h = {
    name = "+Hunk",
    n = "Next Hunk",
    p = "Previous Hunk",
    s = "Stage Hunk",
    u = "Undo Hunk",
  },
}
nleader("ghn", [[:GitGutterNextHunk]])
nleader("ghp", [[:GitGutterPreviousHunk]])
nleader("ghs", [[<Plug>(GitGutterStageHunk)]])
nleader("ghu", [[<Plug>(GitGutterUndoHunk)]])

-- Hop
lmap.h = {
  name = "+Hop",
  h = "Hop to Char",
  l = "Hop to Line",
  p = "Hop to Pattern",
}
nleader("hh", [[:HopChar1<CR>]])
nleader("hl", [[:HopLine<CR>]])
nleader("hp", [[:HopPattern<CR>]])

-- Project
lmap.p = {
  name = "+Project",
  a = "Alternate File",
  f = "Toggle File Tree",
  F = "Focus File Tree",
  t = "Tags",
  T = "Generate Tags",
}
nleader("pa", [[:A<CR>]])
nleader("pf", [[:NERDTreeToggle<CR>]])
nleader("pF", [[:NERDTreeFocus<CR>]])
nleader("pt", [[:Telescope tags<CR>]])
nleader("pT", [[:! ctags<CR>]])

-- Text
lmap.x = {
  name = "+Text",
  i = {
    name = "+Insert",
    j = "Insert Line Below",
    k = "Insert Line Above",
  },
  n = "Split New Line",
  s = "Substitute",
  y = "Yank Live to Clipboard",
}
cmd [[command! InsertAbove call feedkeys("O<Esc>j", "t")]]
cmd [[command! InsertBelow call feedkeys("o<Esc>k", "t")]]
cmd [[command! SplitNewline call feedkeys("i<CR><Esc>", "t")]]
cmd [[command! NSubstitute call feedkeys(":s/", "t")]]
cmd [[command! YankLineToClip call feedkeys('^v$h"*y', "t")]]
nleader("xij", [[:InsertBelow<CR>]])
nleader("xik", [[:InsertAbove<CR>]])
nleader("xn", [[:SplitNewline<CR>]])
nleader("xs", [[:NSubstitute<CR>]])
vleader("xs", [[:NSubstitute<CR>]])
nleader("xy", [[:YankLineToClip<CR>]])

-- Text/Align
lmap.x.a = {name = "+Align"}
lmap.x.a.a = "Align..."
lmap.x.a[":"] = "Align (:)"
lmap.x.a["="] = "Align (=)"
lmap.x.a[","] = "Align (,)"
cmd [[command! AlignColon call feedkeys(":Tab /:\zs/l0l1<CR>", "t")]]
cmd [[command! AlignEqual call feedkeys(":Tab /=/<CR>", "t")]]
cmd [[command! AlignComma call feedkeys(":Tab /,\zs<CR>", "t")]]
vleader("xa:", [[:AlignColon<CR>]])
vleader("xa=", [[:AlignEqual<CR>]])
vleader("xa,", [[:AlignComma<CR>]])
vleader("xa,", [[:Tab /]])

-- Window
lmap.w = {
  name = "+Window",
  c = "Close Window",
  h = "Move Window Left",
  j = "Move Window Down",
  k = "Move Window Up",
  l = "Move Window Right",
  o = "Close Other Windows",
  x = "Horizontal Split",
  v = "Vertical Split",
  w = "Show Windows",
}
nleader("wc", [[:close<CR>]])
nleader("wh", [[:wincmd H<CR>]])
nleader("wj", [[:wincmd J<CR>]])
nleader("wk", [[:wincmd K<CR>]])
nleader("wl", [[:wincmd L<CR>]])
nleader("wo", [[:only<CR>]])
nleader("wx", [[:split<CR>]])
nleader("wv", [[:vsplit<CR>]])
nleader("ww", [[:Windows<CR>]])

-- Quit
lmap.q = {name = "Quit"}
lmap.q.q = "Quit All"
lmap.q.q = "Force Quit All"
nleader("qq", [[:qa<CR>]])
nleader("qQ", [[:qa!<CR>]])

g.lmap = lmap

vim.fn["leaderGuide#register_prefix_descriptions"]("<Space>", "g:lmap")
map("n", "<Leader>", [[:<C-u>LeaderGuide "<Space>"<CR>]], {noremap = true, silent = true})
map("v", "<Leader>", [[:<C-u>LeaderGuideVisual "<Space>"<CR>]], {noremap = true, silent = true})
