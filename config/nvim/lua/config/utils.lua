local map = vim.api.nvim_set_keymap

local M = {}

local leader_map = function(mode, keys, action, desc)
  map(mode, "<Leader>" .. keys, action, {noremap = true, desc = desc})
end

M.nleader = function(keys, action, desc)
  leader_map("n", keys, action, desc)
end

M.vleader = function(keys, action, desc)
  leader_map("v", keys, action, desc)
end

return M
