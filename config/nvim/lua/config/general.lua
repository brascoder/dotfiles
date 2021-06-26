local g, cmd, opt = vim.g, vim.cmd, vim.opt

g.mapleader = [[ ]]
cmd [[colorscheme solarized8]]
cmd [[autocmd VimResized * :wincmd =]]

opt.background = 'dark'
opt.cmdheight = 2
opt.completeopt = {"menuone", "noinsert", "noselect"}
opt.cursorline = true
opt.expandtab = true
opt.hidden = true
opt.ignorecase = true
opt.mouse = 'a'
opt.number = true
opt.shiftwidth = 2
opt.shortmess:append({c = true})
opt.showmatch = true
opt.signcolumn = 'yes'
opt.smartcase = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.updatetime = 300
opt.visualbell = true

-- g.tagbar_type_ruby = {
--   'kinds' = {
--     'm:modules',
--     'c:classes',
--     'd:describes',
--     'C:constants',
--     'f:methods',
--     'F:singleton methods',
--     'i:tests'
--   }
-- }

-- g.tagbar_type_elixir = {
--   'ctagstype' = 'elixir',
--   'kinds' = {
--     'f:functions',
--     'functions:functions',
--     'c:callbacks',
--     'd:delegates',
--     'e:exceptions',
--     'i:implementations',
--     'a:macros',
--     'o:operators',
--     'm:modules',
--     'p:protocols',
--     'r:records',
--     't:tests'
--   }
-- }
