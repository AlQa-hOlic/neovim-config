local M = {}

---Redraw before notifying
---@param msg string Content of the notification to show to the user.
---@param level number|nil One of the values from vim.log.levels.
function _G.vim_notify(msg, level)
  vim.cmd("redraw")
  vim.notify(msg, level)
end

return M
