local map = vim.api.nvim_set_keymap

-- H/L: move to top/bottom of screen; press again to page up/down
vim.keymap.set('n', 'H', function()
  if vim.fn.line('.') == vim.fn.line('w0') then
    vim.cmd('normal! \x15') -- <C-u> half-page up
  else
    vim.cmd('normal! H')
  end
end, { noremap = true, silent = true })

vim.keymap.set('n', 'L', function()
  if vim.fn.line('.') == vim.fn.line('w$') then
    vim.cmd('normal! \x04') -- <C-d> half-page down
  else
    vim.cmd('normal! L')
  end
end, { noremap = true, silent = true })

-- Enable Ctrl-h
-- map("n", "<BS>", [[:TmuxNavigateLeft<CR>]], { noremap = true, silent = true })

-- Tmux navigation from toggleterm terminal buffers
-- map("t", "<C-h>",   [[<Cmd>TmuxNavigateLeft<CR>]],  {noremap = true, silent = true})
-- map("t", "<C-j>",   [[<Cmd>TmuxNavigateDown<CR>]],  {noremap = true, silent = true})
-- map("t", "<C-k>",   [[<Cmd>TmuxNavigateUp<CR>]],    {noremap = true, silent = true})
-- map("t", "<C-l>",   [[<Cmd>TmuxNavigateRight<CR>]], {noremap = true, silent = true})
-- map("t", "<Esc><Esc>", [[<C-\><C-n>]],             {noremap = true, silent = true})

-- Window
-- map("n", "≥", [[<C-w>>]], { noremap = true })
-- map("n", "≤", [[<C-w><]], { noremap = true })
-- map("n", "˘", [[<C-w>+]], { noremap = true })
-- map("n", "¯", [[<C-w>-]], { noremap = true })

-- Editing
map("i", "<C-j>", [[<Esc>o]], { noremap = true })
map("i", "<C-k>", [[<Esc>O]], { noremap = true })
-- map("n", "∆", [[:m .+1<CR>==]], { noremap = true })
-- map("n", "˚", [[:m .-2<CR>==]], { noremap = true })
-- map("i", "∆", [[<Esc>:m .+1<CR>==gi]], { noremap = true })
-- map("i", "˚", [[<Esc>:m .-2<CR>==gi]], { noremap = true })
-- map("v", "∆", [[:m '>+1<CR>gv=gv]], { noremap = true })
-- map("v", "˚", [[:m '<-2<CR>gv=gv]], { noremap = true })
