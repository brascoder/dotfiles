local utils = require("config.utils")
local nleader = utils.nleader
local vleader = utils.vleader
local cmd = vim.cmd

funcs = require("config.funcs")

-- Top Level
nleader(" ", [[:Telescope commands<CR>]])

-- Buffer
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

-- Diagnostics
nleader("dl", [[:Telescope diagnostics<CR>]])

-- Environment
cmd [[command! Scratch lua funcs.make_scratch()]]
nleader("ea", [[:setlocal spell!<CR>]])
nleader("eh", [[:set hlsearch!<CR>]])
nleader("ei", [[:IBLToggle<CR>]])
nleader("em", [[:messages<CR>]])
nleader("epp", [[:Lazy install<CR>]])
nleader("eps", [[:Lazy sync<CR>]])
nleader("epS", [[:Lazy<CR>]])
nleader("epu", [[:Lazy update<CR>]])
nleader("er", [[:Telescope registers<CR>]])
nleader("eR", [[:luafile %<CR>]])
nleader("es", [[:Scratch<CR>]])
nleader("et", [[:NvimTreeRefresh<CR>]])

-- File
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
nleader("Fc", [[:cclose<CR>]])
nleader("Fo", [[:copen<CR>]])

-- Git
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
nleader("hh", [[:HopChar1<CR>]])
nleader("hl", [[:HopLine<CR>]])
nleader("hp", [[:HopPattern<CR>]])

-- Project
nleader("pa", [[:A<CR>]])
nleader("ps", [[:Telescope live_grep<CR>]])
nleader("pS", [[:Telescope grep_string<CR>]])
nleader("pt", [[:Telescope tags<CR>]])
nleader("pT", [[:! ctags<CR>]])

-- Terminal
cmd [[command! FocusVimux call feedkeys(":VimuxOpenRunner<CR>:TmuxNavigatePrevious<CR>", "t")]]
nleader("zc", [[:VimuxCloseRunner<CR>]])
nleader("zo", [[:VimuxOpenRunner<CR>]])
nleader("zr", [[:VimuxPromptCommand<CR>]])
nleader("zz", [[:FocusVimux<CR>]])

-- Test
nleader("tl", [[:TestLast<CR>]])
nleader("tn", [[:TestNearest<CR>]])
nleader("ts", [[:TestSuite<CR>]])
nleader("tt", [[:TestFile<CR>]])

-- Text
cmd [[command! InsertAbove call feedkeys("O<Esc>j", "t")]]
cmd [[command! InsertBelow call feedkeys("o<Esc>k", "t")]]
cmd [[command! SplitNewline call feedkeys("i<CR><Esc>", "t")]]
cmd [[command! NSubstitute call feedkeys(":s/", "t")]]
cmd [[command! YankLine call feedkeys('^y$', "t")]]
cmd [[command! YankLineToClip call feedkeys('^v$h"*y', "t")]]
nleader("xij", [[:InsertBelow<CR>]])
nleader("xik", [[:InsertAbove<CR>]])
nleader("xm", [[:RenderMarkdown toggle<CR>]])
nleader("xn", [[:SplitNewline<CR>]])
nleader("xs", [[:NSubstitute<CR>]])
vleader("xs", [[:NSubstitute<CR>]])
nleader("xy", [[:YankLine<CR>]])
nleader("xY", [[:YankLineToClip<CR>]])

-- Text/Align
cmd [[command! AlignColon call feedkeys(":Tab /:\zs/l0l1<CR>", "t")]]
cmd [[command! AlignEqual call feedkeys(":Tab /=/<CR>", "t")]]
cmd [[command! AlignComma call feedkeys(":Tab /,\zs<CR>", "t")]]
vleader("xa:", [[:AlignColon<CR>]])
vleader("xa=", [[:AlignEqual<CR>]])
vleader("xa,", [[:AlignComma<CR>]])

-- Window
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
nleader("qq", [[:qa<CR>]])
nleader("qQ", [[:qa!<CR>]])

-- which-key group labels
local wk = require("which-key")
wk.add({
  { "<leader> ",  desc = "Commands" },
  { "<leader>b",  group = "Buffer" },
  { "<leader>d",  group = "Diagnostics" },
  { "<leader>e",  group = "Environment" },
  { "<leader>ep", group = "Plugins" },
  { "<leader>f",  group = "File" },
  { "<leader>F",  group = "QuickFix" },
  { "<leader>g",  group = "Git" },
  { "<leader>gh", group = "Hunk" },
  { "<leader>h",  group = "Hop" },
  { "<leader>l",  group = "LSP" },
  { "<leader>p",  group = "Project" },
  { "<leader>q",  group = "Quit" },
  { "<leader>t",  group = "Test" },
  { "<leader>w",  group = "Window" },
  { "<leader>wt", group = "Tabs" },
  { "<leader>x",  group = "Text" },
  { "<leader>xi", group = "Insert" },
  { "<leader>xa", group = "Align" },
  { "<leader>z",  group = "Terminal" },
})
