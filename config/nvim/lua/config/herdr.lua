-- Helpers for sending context from Neovim to a coding agent in a sibling Herdr pane.
-- Requires HERDR_ENV=1 (set automatically inside Herdr-managed panes).

local M = {}

local function herdr_bin()
  return vim.env.HERDR_BIN_PATH or "herdr"
end

---@param args string[]
---@return table|nil decoded
---@return string|nil err
local function herdr_json(args)
  local cmd = { herdr_bin() }
  vim.list_extend(cmd, args)

  local res = vim.system(cmd, { text = true }):wait()
  if res.code ~= 0 then
    return nil, ("`%s %s` failed: %s"):format(
      herdr_bin(),
      table.concat(args, " "),
      vim.trim(res.stderr or "")
    )
  end

  local ok, decoded = pcall(vim.json.decode, res.stdout)
  if not ok or type(decoded) ~= "table" then
    return nil, "failed to parse herdr JSON output"
  end
  return decoded, nil
end

---@param file string
---@param root string|nil
---@return string
local function relativize(file, root)
  if not root or root == "" then
    return file
  end
  local prefix = root:gsub("/+$", "") .. "/"
  if file:sub(1, #prefix) == prefix then
    return file:sub(#prefix + 1)
  end
  return file
end

---@return table|nil pane
---@return string|nil file
---@return string|nil err
local function resolve_target()
  if vim.env.HERDR_ENV ~= "1" then
    return nil, nil, "not running inside a herdr pane (HERDR_ENV != 1)"
  end

  local file = vim.fn.expand("%:p")
  if file == "" then
    return nil, nil, "current buffer is not backed by a file"
  end

  local tab_id = vim.env.HERDR_TAB_ID
  if not tab_id or tab_id == "" then
    return nil, nil, "HERDR_TAB_ID is not set"
  end

  local self_pane = vim.env.HERDR_PANE_ID
  local list, err = herdr_json({ "pane", "list" })
  if not list then
    return nil, nil, err
  end

  for _, pane in ipairs((list.result or {}).panes or {}) do
    if pane.tab_id == tab_id and pane.agent and pane.pane_id ~= self_pane then
      return pane, file
    end
  end

  return nil, nil, "no coding agent found in the current tab"
end

---@param text string
---@param submit boolean|nil
local function send_text(text, submit)
  local target, _, err = resolve_target()
  if not target then
    vim.notify("herdr: " .. err, vim.log.levels.WARN)
    return
  end

  local res = vim.system({
    herdr_bin(),
    "pane",
    "send-text",
    target.pane_id,
    text .. "\n",
  }, { text = true }):wait()

  if res.code ~= 0 then
    vim.notify("herdr: send-text failed: " .. vim.trim(res.stderr or ""), vim.log.levels.ERROR)
    return
  end

  if submit then
    vim.system({ herdr_bin(), "pane", "send-keys", target.pane_id, "enter" }, { text = true }):wait()
  end

  vim.notify(
    ("herdr: sent to %s (%s)"):format(target.agent, target.pane_id),
    vim.log.levels.INFO
  )
end

---@param range integer[]|nil
---@param submit boolean|nil
local function send_path(range, submit)
  local target, file, err = resolve_target()
  if not target then
    vim.notify("herdr: " .. err, vim.log.levels.WARN)
    return
  end

  local payload = "@" .. relativize(file, target.cwd)
  if range then
    local s, e = range[1], range[2]
    if s > e then
      s, e = e, s
    end
    payload = payload .. "#L" .. s
    if e ~= s then
      payload = payload .. "-" .. e
    end
  end

  send_text(payload, submit)
end

function M.in_herdr()
  return vim.env.HERDR_ENV == "1"
end

function M.send_file_to_agent()
  send_path(nil, false)
end

function M.send_file_and_submit()
  send_path(nil, true)
end

function M.send_selection_to_agent()
  send_path({ vim.fn.line("'<"), vim.fn.line("'>") }, false)
end

function M.send_selection_and_submit()
  send_path({ vim.fn.line("'<"), vim.fn.line("'>") }, true)
end

function M.send_visual_text_to_agent()
  local lines = vim.fn.getline("'<", "'>")
  send_text(table.concat(lines, "\n"), false)
end

function M.submit_agent()
  local target, _, err = resolve_target()
  if not target then
    vim.notify("herdr: " .. err, vim.log.levels.WARN)
    return
  end

  local res = vim.system({
    herdr_bin(),
    "pane",
    "send-keys",
    target.pane_id,
    "enter",
  }, { text = true }):wait()

  if res.code ~= 0 then
    vim.notify("herdr: send-keys failed: " .. vim.trim(res.stderr or ""), vim.log.levels.ERROR)
  end
end

return M
