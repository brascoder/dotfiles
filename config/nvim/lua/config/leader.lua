local utils = require("config.utils")
local nleader = utils.nleader
local vleader = utils.vleader
local map = vim.api.nvim_set_keymap
local g, cmd = vim.g, vim.cmd

funcs = require("config.funcs")

local lmap = {}

-- Top Level
lmap[" "] = "Commands"
nleader(" ", [[:Telescope commands<CR>]])

-- Buffer
lmap.b = {
  name = "+Buffer",
  b = "Show Buffers",
  d = "Delete Current Buffer",
  l = "Last Buffer",
  m = "Marks",
  n = "Next Buffer",
  o = "Kill Other Buffers",
  p = "Previous Buffer",
  s = "Search Buffer",
  t = "Tags",
}
cmd [[command! LastBuffer call feedkeys("<C-^>", "t")]]
nleader("bb", [[:Telescope buffers show_all_buffers=true<CR>]])
nleader("bd", [[:bdelete<CR>]])
nleader("bl", [[:LastBuffer<CR>]])
nleader("bm", [[:Telescope marks<CR>]])
nleader("bn", [[:bnext<CR>]])
nleader("bo", [[:BufOnly<CR>]])
nleader("bp", [[:bprevious<CR>]])
nleader("bs", [[:Telescope current_buffer_fuzzy_find<CR>]])
nleader("bt", [[:Telescope current_buffer_tags<CR>]])

-- ChatGPT
lmap.c = {
  name = "+ChatGPT",
  a = "Act As",
  c = "Chat",
  e = "Edit",
  r = "Run",
}
nleader("ca", [[:ChatGPTActAs<CR>]])
nleader("cc", [[:ChatGPT<CR>]])
nleader("ce", [[:ChatGPTEditWithInstructions<CR>]])
vleader("ce", [[:ChatGPTEditWithInstructions<CR>]])

-- Diagnostics
lmap.d = {
  name = "+Diagnostics",
  d = "Line Diagnostics",
  l = "List Diagnostics",
  n = "Next Diagnostic",
  p = "Previous Diagnostic",
}
nleader("dl", [[:Telescope diagnostics<CR>]])

-- Environment
lmap.E = {
  name = "+Environment",
  a = "Toggle Spell Check",
  h = "Toggle Search Highlight",
  i = "Toggle Indent Lines",
  m = "Messages",
  p = {
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
  t = "Refresh File Tree",
}
cmd [[command! Scratch lua funcs.make_scratch()]]
nleader("ea", [[:setlocal spell!<CR>]])
nleader("eh", [[:set hlsearch!<CR>]])
nleader("ei", [[:IndentLinesToggle<CR>]])
nleader("em", [[:messages<CR>]])
nleader("epc", [[:PackerClean<CR>]])
nleader("epp", [[:PackerInstall<CR>]])
nleader("eps", [[:PackerSync<CR>]])
nleader("epS", [[:PackerStatus<CR>]])
nleader("epu", [[:PackerUpdate<CR>]])
nleader("er", [[:Telescope registers<CR>]])
nleader("eR", [[:luafile %<CR>]])
nleader("es", [[:Scratch<CR>]])
nleader("et", [[:NvimTreeRefresh<CR>]])

-- File
lmap.f = {
  name = "+File",
  b = "File Browser",
  f = "Find File",
  g = "Git File",
  p = "Copy File Path",
  r = "Reload File",
  R = "Force Reload File",
  s = "Save File",
  S = "Save All",
  t = "Open File Tree",
  T = "Find in File Tree",
  x = "Save & Close",
}
nleader("fb", [[:Telescope file_browser<CR>]])
nleader("ff", [[:Telescope find_files<CR>]])
nleader("fg", [[:Telescope git_files<CR>]])
nleader("fp", [[:let @*=@%<CR>]])
nleader("fr", [[:e<CR>]])
nleader("fR", [[:e!<CR>]])
nleader("fs", [[:w<CR>]])
nleader("fS", [[:wa<CR>]])
nleader("ft", [[:NvimTreeToggle<CR>]])
nleader("fT", [[:NvimTreeFindFile<CR>]])
nleader("fx", [[:x<CR>]])

-- QuickFix
lmap.F = {
  name = "+QuickFix",
  c = "Close",
  o = "Open",
}
nleader("Fc", [[:cclose<CR>]])
nleader("Fo", [[:copen<CR>]])

-- Git
lmap.g = {
  name = "+Git",
  b = "Git Blame",
  B = "Git Branch",
  c = "Git Commits",
  g = "Git Commits",
  o = "Git Old Files",
  s = "Git Status",
  S = "Git Stash",

  h = {
    name = "+Hunk",
    b = "Blame Line",
    h = "Select Hunk",
    n = "Next Hunk",
    p = "Previous Hunk",
    P = "Preview Hunk",
    r = "Reset Hunk",
    R = "Reset Buffer",
    s = "Stage Hunk",
    u = "Undo Hunk",
  },
}
nleader("gb", [[:Git blame<CR>]])
nleader("gB", [[:Telescope git_branches<CR>]])
nleader("gc", [[:Telescope git_commits<CR>]])
nleader("gg", [[:LazyGit<CR>]])
nleader("go", [[:Telescope oldfiles<CR>]])
nleader("gs", [[:Telescope git_status<CR>]])
nleader("gS", [[:Telescope git_stash<CR>]])

nleader("ghb", [[:Gitsigns blame_line<CR>]])
nleader("ghh", [[:Gitsigns select_hunk<CR>]])
nleader("ghn", [[:Gitsigns next_hunk<CR>]])
nleader("ghp", [[:Gitsigns prev_hunk<CR>]])
nleader("ghP", [[:Gitsigns preview_hunk<CR>]])
nleader("ghr", [[:Gitsigns reset_hunk<CR>]])
nleader("ghR", [[:Gitsigns reset_buffer<CR>]])
nleader("ghs", [[:Gitsigns stage_hunk<CR>]])
nleader("ghu", [[:Gitsigns undo_stage_hunk<CR>]])

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

-- LSP
lmap.l = {
  name = "+LSP",
  c = "CodeLens",
  d = "Definition",
  D = "Implementation",
  f = "Formatting",
  h = "Hover",
  H = "Signature Help",
  i = "Info",
  L = "LSP Logs",
  r = "Restart LSP",
  t = "Type Definition",

  e = {
    name = "+Elixir",
    f = "From Pipe",
    m = "Expand Macro",
    t = "To Pipe",
  },
}
nleader("li", [[:LspInfo<CR>]])
nleader("lr", [[:LspRestart<CR>]])

-- Project
lmap.p = {
  name = "+Project",
  a = "Alternate File",
  s = "Search",
  S = "Ag Search",
  t = "Tags",
  T = "Generate Tags",
}
nleader("pa", [[:A<CR>]])
nleader("ps", [[:Telescope live_grep<CR>]])
nleader("pS", [[:Ag<CR>]])
nleader("pt", [[:Telescope tags<CR>]])
nleader("pT", [[:! ctags<CR>]])

-- Terminal
lmap.z = {
  name = "+Terminal",
  c = "Close Terminal",
  o = "Open Terminal",
  r = "Run Command",
  z = "Focus Terminal",
}
cmd [[command! FocusVimux call feedkeys(":VimuxOpenRunner<CR>:TmuxNavigatePrevious<CR>", "t")]]
nleader("zc", [[:VimuxCloseRunner<CR>]])
nleader("zo", [[:VimuxOpenRunner<CR>]])
nleader("zr", [[:VimuxPromptCommand<CR>]])
nleader("zz", [[:FocusVimux<CR>]])

-- Test
lmap.t = {
  name = "+Test",
  l = "Test Last",
  n = "Test Nearest",
  s = "Test Suite",
  t = "Test File",
}
nleader("tl", [[:TestLast<CR>]])
nleader("tn", [[:TestNearest<CR>]])
nleader("ts", [[:TestSuite<CR>]])
nleader("tt", [[:TestFile<CR>]])

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
  y = "Yank Line",
  Y = "Yank Line to Clipboard",
}
cmd [[command! InsertAbove call feedkeys("O<Esc>j", "t")]]
cmd [[command! InsertBelow call feedkeys("o<Esc>k", "t")]]
cmd [[command! SplitNewline call feedkeys("i<CR><Esc>", "t")]]
cmd [[command! NSubstitute call feedkeys(":s/", "t")]]
cmd [[command! YankLine call feedkeys('^y$', "t")]]
cmd [[command! YankLineToClip call feedkeys('^v$h"*y', "t")]]
nleader("xij", [[:InsertBelow<CR>]])
nleader("xik", [[:InsertAbove<CR>]])
nleader("xn", [[:SplitNewline<CR>]])
nleader("xs", [[:NSubstitute<CR>]])
vleader("xs", [[:NSubstitute<CR>]])
nleader("xy", [[:YankLine<CR>]])
nleader("xY", [[:YankLineToClip<CR>]])

-- Text/Align
lmap.x.a = { name = "+Align" }
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

  t = {
    c = "Close Tab",
    h = "Move Tab Left",
    j = "Move Tab End",
    k = "Move Tab Beginning",
    l = "Move Tab Left",
    o = "Close Other Tabs",
    t = "New Tab",
  }
}
lmap.w[","] = "Previour Tab"
lmap.w["."] = "Next Tab"
lmap.w.t[","] = "First Tab"
lmap.w.t["."] = "Last Tab"

nleader("wc", [[:close<CR>]])
nleader("wh", [[:wincmd H<CR>]])
nleader("wj", [[:wincmd J<CR>]])
nleader("wk", [[:wincmd K<CR>]])
nleader("wl", [[:wincmd L<CR>]])
nleader("wo", [[:only<CR>]])
nleader("wx", [[:split<CR>]])
nleader("wv", [[:vsplit<CR>]])
nleader("ww", [[:Windows<CR>]])
nleader("w,", [[:tabprevious<CR>]])
nleader("w.", [[:tabnext<CR>]])

nleader("wtc", [[:tabclose<CR>]])
nleader("wth", [[:tabmove -1<CR>]])
nleader("wtj", [[:tabmove $<CR>]])
nleader("wtk", [[:tabmove 0<CR>]])
nleader("wtl", [[:tabmove +1<CR>]])
nleader("wto", [[:tabonly<CR>]])
nleader("wtt", [[:tabnew<CR>]])
nleader("wt,", [[:tabfirst<CR>]])
nleader("wt.", [[:tablast<CR>]])

-- Quit
lmap.q = { name = "Quit" }
lmap.q.q = "Quit All"
lmap.q.Q = "Force Quit All"
nleader("qq", [[:qa<CR>]])
nleader("qQ", [[:qa!<CR>]])

g.lmap = lmap

vim.fn["leaderGuide#register_prefix_descriptions"]("<Space>", "g:lmap")
map("n", "<Leader>", [[:<C-u>LeaderGuide "<Space>"<CR>]], { noremap = true, silent = true })
map("v", "<Leader>", [[:<C-u>LeaderGuideVisual "<Space>"<CR>]], { noremap = true, silent = true })
