local map = vim.api.nvim_set_keymap

local M = {}

local leader_map = function(mode, keys, action)
  map(mode, "<Leader>" .. keys, action, {noremap = true})
end

M.nleader = function(keys, action)
  leader_map("n", keys, action)
end

M.vleader = function(keys, action)
  leader_map("v", keys, action)
end

return M
