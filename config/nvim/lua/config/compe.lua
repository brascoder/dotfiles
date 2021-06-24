local g, o = vim.g, vim.o
local map = vim.api.nvim_set_keymap

g.loaded_compe_treesitter = true
g.loaded_compe_snippets_nvim = true
g.loaded_compe_spell = true
g.loaded_compe_tags = true
g.loaded_compe_ultisnips = true
g.loaded_compe_vim_lsc = true
g.loaded_compe_vim_lsp = true

require('compe').setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enabled',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = true,
    buffer = true,
    calc = true,
    vsnip = true,
    nvim_lsp = true,
    nvim_lua = true,
    spell = true,
    tags = true,
    treesitter = true
  }
}

local opts = {noremap = true, silent = true, expr = true}
map('i', '<C-space>', [[compe#complete()]], opts)
map('i', '<CR>', [[compe#confirm('<CR>')]], opts)
map('i', '<C-e>', [[compe#close('<C-e>')]], opts)
