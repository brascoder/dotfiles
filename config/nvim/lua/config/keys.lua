local map = vim.api.nvim_set_keymap

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

map('i', '<Tab>', [[v:lua.tab_complete()]], {expr = true})
map('s', '<Tab>', [[v:lua.tab_complete()]], {expr = true})
map('i', '<S-Tab>', [[v:lua.s_tab_complete()]], {expr = true})
map('s', '<S-Tab>', [[v:lua.s_tab_complete()]], {expr = true})

-- Enable Ctrl-h
map('n', '<BS>', [[:TmuxNavigateLeft<CR>]], {noremap = true, silent = true})

-- Window
map('n', '≥', [[<C-w>>]], {noremap = true})
map('n', '≤', [[<C-w><]], {noremap = true})
map('n', '˘', [[<C-w>+]], {noremap = true})
map('n', '¯', [[<C-w>-]], {noremap = true})

-- Editing
map('i', '<C-j>', [[<Esc>o]], {noremap = true})
map('i', '<C-k>', [[<Esc>O]], {noremap = true})
map('n', '∆', [[:m .+1<CR>==]], {noremap = true})
map('n', '˚', [[:m .-2<CR>==]], {noremap = true})
map('i', '∆', [[<Esc>:m .+1<CR>==gi]], {noremap = true})
map('i', '˚', [[<Esc>:m .-2<CR>==gi]], {noremap = true})
map('v', '∆', [[:m '>+1<CR>gv=gv]], {noremap = true})
map('v', '˚', [[:m '<-2<CR>gv=gv]], {noremap = true})
