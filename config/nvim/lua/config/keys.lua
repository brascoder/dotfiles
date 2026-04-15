local map = vim.api.nvim_set_keymap

-- Enable Ctrl-h
map("n", "<BS>", [[:TmuxNavigateLeft<CR>]], {noremap = true, silent = true})

-- Tmux navigation from toggleterm terminal buffers
map("t", "<C-h>",   [[<Cmd>TmuxNavigateLeft<CR>]],  {noremap = true, silent = true})
map("t", "<C-j>",   [[<Cmd>TmuxNavigateDown<CR>]],  {noremap = true, silent = true})
map("t", "<C-k>",   [[<Cmd>TmuxNavigateUp<CR>]],    {noremap = true, silent = true})
map("t", "<C-l>",   [[<Cmd>TmuxNavigateRight<CR>]], {noremap = true, silent = true})
map("t", "<Esc><Esc>", [[<C-\><C-n>]],             {noremap = true, silent = true})

-- Window
map("n", "≥", [[<C-w>>]], {noremap = true})
map("n", "≤", [[<C-w><]], {noremap = true})
map("n", "˘", [[<C-w>+]], {noremap = true})
map("n", "¯", [[<C-w>-]], {noremap = true})

-- Editing
map("i", "<C-j>", [[<Esc>o]], {noremap = true})
map("i", "<C-k>", [[<Esc>O]], {noremap = true})
map("n", "∆", [[:m .+1<CR>==]], {noremap = true})
map("n", "˚", [[:m .-2<CR>==]], {noremap = true})
map("i", "∆", [[<Esc>:m .+1<CR>==gi]], {noremap = true})
map("i", "˚", [[<Esc>:m .-2<CR>==gi]], {noremap = true})
map("v", "∆", [[:m '>+1<CR>gv=gv]], {noremap = true})
map("v", "˚", [[:m '<-2<CR>gv=gv]], {noremap = true})
