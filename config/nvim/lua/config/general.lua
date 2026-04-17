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
opt.autoread = true
opt.updatetime = 300
opt.visualbell = true

vim.g.conform_format_on_save = false

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })

vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#6e7faa", italic = true })

vim.g.projectionist_heuristics = {
  ["mix.exs"] = {
    ["lib/*.ex"]        = { alternate = "test/{}_test.exs", type = "source" },
    ["test/*_test.exs"] = { alternate = "lib/{}.ex",        type = "test" },
  },
}
