local M = {}

---Redraw before notifying
---@param msg string Content of the notification to show to the user.
---@param level number|nil One of the values from vim.log.levels.
function M.vim_notify(msg, level)
	vim.cmd("redraw")
	vim.notify(msg, level)
end

-- Safe require wrapper that will notify the user without breaking the config
-- @param lib_name The name of the library as a string
-- @return table representing the library or nil, if not found.
-- @usage safe_require("library")
function M.safe_require(lib_name)
	local status_ok, lib = pcall(require, lib_name)
	if status_ok then
		return lib
	else
		M.vim_notify(string.format("Error loading %s", lib))
		return
	end
end

return M
