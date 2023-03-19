local g, cmd, opt = vim.g, vim.cmd, vim.opt

g.mapleader = [[ ]]
cmd [[
  syntax enable
  colorscheme tokyonight
  autocmd VimResized * :wincmd =
]]

opt.background = "dark"
opt.cmdheight = 2
opt.completeopt = {"menuone", "noinsert", "noselect"}
opt.cursorline = true
opt.expandtab = true
opt.hidden = true
opt.ignorecase = true
opt.mouse = "a"
opt.number = true
opt.shiftwidth = 2
opt.shortmess:append({c = true})
opt.showmatch = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.updatetime = 300
opt.visualbell = true
