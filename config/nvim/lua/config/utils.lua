local map = vim.api.nvim_set_keymap

local M = {}

M.leader_map = function(keys, action)
  map('n', '<leader>' .. keys, action, {noremap = true})
end

return M
