local utils = require("config.utils")
local nleader = utils.nleader
local vleader = utils.vleader
local cmd = vim.cmd

local funcs = require("config.funcs")

local map = function(modes, keys, action, desc)
  vim.keymap.set(modes, "<Leader>" .. keys, action, { noremap = true, desc = desc })
end

-- Top Level
map({ "n", "v" }, " ", [[:Telescope commands<CR>]], "Commands")

-- Buffer
cmd [[command! LastBuffer call feedkeys("<C-^>", "t")]]
nleader("bb", [[:Telescope buffers show_all_buffers=true<CR>]], "List buffers")
nleader("bd", [[:bdelete<CR>]], "Delete buffer")
nleader("bl", [[:LastBuffer<CR>]], "Last buffer")
nleader("bm", [[:Telescope marks<CR>]], "Marks")
nleader("bn", [[:bnext<CR>]], "Next buffer")
nleader("bo", [[:BufOnly<CR>]], "Close other buffers")
nleader("bp", [[:bprevious<CR>]], "Previous buffer")
nleader("bs", [[:Telescope current_buffer_fuzzy_find<CR>]], "Search buffer")
nleader("bt", [[:Telescope current_buffer_tags<CR>]], "Buffer tags")

-- Claude Code
nleader("cc", [[:ClaudeCode<CR>]], "Open Claude")
nleader("cf", [[:ClaudeCodeFocus<CR>]], "Focus Claude")
nleader("ca", [[:ClaudeCodeAdd %<CR>]], "Add file to Claude")
nleader("cC", [[:ClaudeCode --continue<CR>]], "Continue task")
nleader("cm", [[:ClaudeCodeSelectModel<CR>]], "Select model")
nleader("cr", [[:ClaudeCode --resume<CR>]], "Resume session")
vleader("cs", [[:ClaudeCodeSend<CR>]], "Send selection to Claude")
nleader("ct", [[:ClaudeCodeTreeAdd<CR>]], "Add file from tree")
nleader("cda", [[:ClaudeCodeDiffAccept<CR>]], "Accept diff")
nleader("cdd", [[:ClaudeCodeDiffDeny<CR>]], "Deny diff")
vim.keymap.set("n", "<Leader>cp", function()
  local dir = vim.fn.getcwd() .. "/.claude/plans"
  local handle = io.popen("ls -t " .. dir .. "/*.md 2>/dev/null | head -1")
  local latest = handle:read("*l")
  handle:close()
  if latest then vim.cmd("edit " .. vim.fn.fnameescape(latest)) end
end, { noremap = true, desc = "Open latest plan" })

-- Diagnostics
nleader("dl", [[:Telescope diagnostics<CR>]], "List diagnostics")
nleader("dt", "<cmd>Trouble diagnostics toggle<CR>", "Trouble diagnostics")
nleader("df", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", "File diagnostics")
nleader("dq", "<cmd>Trouble qflist toggle<CR>", "Trouble quickfix")
nleader("ds", "<cmd>Trouble symbols toggle<CR>", "Trouble symbols")

-- Debug
nleader("Db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle breakpoint")
nleader("Dc", "<cmd>lua require('dap').continue()<CR>", "Continue")
nleader("Ds", "<cmd>lua require('dap').step_over()<CR>", "Step over")
nleader("Di", "<cmd>lua require('dap').step_into()<CR>", "Step into")
nleader("Do", "<cmd>lua require('dap').step_out()<CR>", "Step out")
nleader("Du", "<cmd>lua require('dapui').toggle()<CR>", "Toggle DAP UI")
nleader("Dt", "<cmd>lua require('dap').terminate()<CR>", "Terminate session")

-- Environment
cmd [[command! Scratch lua funcs.make_scratch()]]
nleader("ea", [[:setlocal spell!<CR>]], "Toggle spell check")
nleader("eh", [[:set hlsearch!<CR>]], "Toggle search highlight")
nleader("ei", [[:IBLToggle<CR>]], "Toggle indent guides")
nleader("em", [[:messages<CR>]], "Show messages")
nleader("epp", [[:Lazy install<CR>]], "Install plugins")
nleader("eps", [[:Lazy sync<CR>]], "Sync plugins")
nleader("epS", [[:Lazy<CR>]], "Plugin manager")
nleader("epu", [[:Lazy update<CR>]], "Update plugins")
nleader("er", [[:Telescope registers<CR>]], "Registers")
nleader("eR", [[:source $MYVIMRC<CR>]], "Reload config")
nleader("es", [[:Scratch<CR>]], "Scratch buffer")
nleader("ef",
  [[:lua vim.g.conform_format_on_save = not vim.g.conform_format_on_save; print("Format on save: " .. tostring(vim.g.conform_format_on_save))<CR>]],
  "Toggle format on save")
nleader("et", [[:NvimTreeRefresh<CR>]], "Refresh file tree")
vim.keymap.set("n", "<Leader>ew", function()
  local wrap = not vim.wo.wrap
  vim.wo.wrap = wrap
  vim.wo.linebreak = wrap
end, { noremap = true, desc = "Toggle word-wrap" })

-- File
nleader("fb", [[:Telescope file_browser<CR>]], "Browse files")
nleader("ff", [[:Telescope find_files<CR>]], "Find file")
nleader("fg", [[:Telescope git_files<CR>]], "Find git file")
nleader("fo", [[:Telescope oldfiles<CR>]], "Recent files")
nleader("fp", [[:let @*=@%<CR>]], "Copy file path")
nleader("fr", [[:e<CR>]], "Reload file")
nleader("fR", [[:e!<CR>]], "Force reload file")
nleader("fs", [[:w<CR>]], "Save file")
nleader("fS", [[:wa<CR>]], "Save all files")
nleader("ft", [[:NvimTreeToggle<CR>]], "Toggle file tree")
nleader("fT", [[:NvimTreeFindFile<CR>]], "Reveal in file tree")
nleader("fx", [[:x<CR>]], "Save and close")
nleader("f.", [[:lua require('telescope.builtin').find_files({ hidden = true })<CR>]], "Find hidden file")

-- Flutter
nleader("vr", [[:FlutterRun<CR>]], "Run")
nleader("vR", [[:FlutterRestart<CR>]], "Restart")
nleader("vh", [[:FlutterReload<CR>]], "Hot reload")
nleader("vd", [[:FlutterDevices<CR>]], "Devices")
nleader("vo", [[:FlutterOutlineToggle<CR>]], "Toggle outline")

-- Git
nleader("gb", [[:Gitsigns blame<CR>]], "Blame")
nleader("gB", [[:Telescope git_branches<CR>]], "Branches")
nleader("gc", [[:Telescope git_commits<CR>]], "Commits")
nleader("gg", [[:Neogit<CR>]], "Neogit")
nleader("gG", [[:LazyGit<CR>]], "LazyGit")
nleader("gs", [[:Telescope git_status<CR>]], "Status")
nleader("gS", [[:Telescope git_stash<CR>]], "Stash")

nleader("ghb", [[:Gitsigns blame_line<CR>]], "Blame line")
nleader("ghh", [[:Gitsigns select_hunk<CR>]], "Select hunk")
nleader("ghn", [[:Gitsigns next_hunk<CR>]], "Next hunk")
nleader("ghp", [[:Gitsigns prev_hunk<CR>]], "Previous hunk")
nleader("ghP", [[:Gitsigns preview_hunk<CR>]], "Preview hunk")
nleader("ghr", [[:Gitsigns reset_hunk<CR>]], "Reset hunk")
nleader("ghR", [[:Gitsigns reset_buffer<CR>]], "Reset buffer")
nleader("ghs", [[:Gitsigns stage_hunk<CR>]], "Stage hunk")
nleader("ghu", [[:Gitsigns undo_stage_hunk<CR>]], "Undo stage hunk")

-- Hop
nleader("hh", [[:HopChar1<CR>]], "Hop to char")
nleader("hl", [[:HopLine<CR>]], "Hop to line")
nleader("hp", [[:HopPattern<CR>]], "Hop to pattern")

-- Project
nleader("pa", [[:A<CR>]], "Alternate file")
nleader("ps", [[:Telescope live_grep<CR>]], "Search project")
nleader("pS", [[:Telescope grep_string<CR>]], "Search word")
nleader("pt", [[:Telescope tags<CR>]], "Tags")
nleader("pT", [[:! ctags<CR>]], "Generate tags")

-- Terminal
nleader("zo", [[:ToggleTerm direction=horizontal<CR>]], "Horizontal terminal")
nleader("zv", [[:ToggleTerm direction=vertical<CR>]], "Vertical terminal")
nleader("zf", [[:ToggleTerm direction=float<CR>]], "Floating terminal")
nleader("zr", [[:ToggleTermSendCurrentLine<CR>]], "Send line to terminal")
vleader("zr", [[:ToggleTermSendVisualSelection<CR>]], "Send selection to terminal")

-- Herdr (send to coding agent in sibling pane)
local herdr = require("config.herdr")
map("n", "za", function() herdr.send_file_to_agent() end, "Send file to agent")
map("n", "zA", function() herdr.send_file_and_submit() end, "Send file and submit")
map("v", "zl", function() herdr.send_selection_to_agent() end, "Send file+lines to agent")
map("v", "zL", function() herdr.send_selection_and_submit() end, "Send file+lines and submit")
map("v", "zs", function() herdr.send_visual_text_to_agent() end, "Send selection text to agent")
map("n", "zS", function() herdr.submit_agent() end, "Submit agent prompt")

-- Test
nleader("tn", "<cmd>lua require('neotest').run.run()<CR>", "Run nearest test")
nleader("tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run file tests")
nleader("tS", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", "Run test suite")
nleader("tl", "<cmd>lua require('neotest').run.run_last()<CR>", "Run last test")
nleader("ts", "<cmd>lua require('neotest').summary.toggle()<CR>", "Toggle test summary")
nleader("to", "<cmd>lua require('neotest').output_panel.toggle()<CR>", "Toggle test output")
nleader("tt", "<cmd>lua require('neotest').run.stop()<CR>", "Stop test run")

-- Text
cmd [[command! InsertAbove call feedkeys("O<Esc>j", "t")]]
cmd [[command! InsertBelow call feedkeys("o<Esc>k", "t")]]
cmd [[command! SplitNewline call feedkeys("i<CR><Esc>", "t")]]
cmd [[command! NSubstitute call feedkeys(":s/", "t")]]
cmd [[command! YankLine call feedkeys('^y$', "t")]]
cmd [[command! YankLineToClip call feedkeys('^v$h"*y', "t")]]
nleader("xij", [[:InsertBelow<CR>]], "Insert line below")
nleader("xik", [[:InsertAbove<CR>]], "Insert line above")
nleader("xm", [[:RenderMarkdown toggle<CR>]], "Toggle markdown preview")
nleader("xn", [[:SplitNewline<CR>]], "Split at cursor")
nleader("xs", [[:NSubstitute<CR>]], "Substitute")
vleader("xs", [[:NSubstitute<CR>]], "Substitute")
nleader("xy", [[:YankLine<CR>]], "Yank line")
nleader("xY", [[:YankLineToClip<CR>]], "Yank line to clipboard")

-- Text/Align
cmd [[command! AlignColon call feedkeys(":Tab /:\zs/l0l1<CR>", "t")]]
cmd [[command! AlignEqual call feedkeys(":Tab /=/<CR>", "t")]]
cmd [[command! AlignComma call feedkeys(":Tab /,\zs<CR>", "t")]]
vleader("xa:", [[:AlignColon<CR>]], "Align by colon")
vleader("xa=", [[:AlignEqual<CR>]], "Align by equals")
vleader("xa,", [[:AlignComma<CR>]], "Align by comma")

-- Window
nleader("wc", [[:close<CR>]], "Close window")
nleader("wh", [[:wincmd H<CR>]], "Move window left")
nleader("wj", [[:wincmd J<CR>]], "Move window down")
nleader("wk", [[:wincmd K<CR>]], "Move window up")
nleader("wl", [[:wincmd L<CR>]], "Move window right")
nleader("wo", [[:only<CR>]], "Close other windows")
nleader("wx", [[:split<CR>]], "Horizontal split")
nleader("wv", [[:vsplit<CR>]], "Vertical split")
nleader("ww", [[:Windows<CR>]], "List windows")

-- Tabs
nleader("T,", [[:tabprevious<CR>]], "Previous tab")
nleader("T.", [[:tabnext<CR>]], "Next tab")
nleader("T<", [[:tabfirst<CR>]], "First tab")
nleader("T>", [[:tablast<CR>]], "Last tab")
nleader("Tc", [[:tabclose<CR>]], "Close tab")
nleader("Th", [[:tabmove -1<CR>]], "Move tab left")
nleader("Tj", [[:tabmove $<CR>]], "Move tab to last")
nleader("Tk", [[:tabmove 0<CR>]], "Move tab to first")
nleader("Tl", [[:tabmove +1<CR>]], "Move tab right")
nleader("To", [[:tabonly<CR>]], "Close other tabs")
nleader("Tt", [[:tabnew<CR>]], "New tab")
nleader("TT", [[:tabe %<CR>]], "New tab with current file")

-- QuickFix
nleader("Fc", [[:cclose<CR>]], "Close quickfix")
nleader("Fo", [[:copen<CR>]], "Open quickfix")

-- Quit
nleader("qq", [[:qa<CR>]], "Quit all")
nleader("qQ", [[:qa!<CR>]], "Force quit all")

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
  { "<leader>T",  group = "+Tabs" },
  { "<leader>x",  group = "Text" },
  { "<leader>xi", group = "Insert" },
  { "<leader>xa", group = "Align" },
  { "<leader>v",  group = "Flutter" },
  { "<leader>z",  group = "Terminal / Herdr" },
  { "<leader>c",  group = "Claude" },
  { "<leader>cd", group = "Claude diff" },
  { "<leader>D",  group = "Debug" },
})
