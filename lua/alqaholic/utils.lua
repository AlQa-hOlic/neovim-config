local M = {}

function M.f(str)
	local outer_env = _ENV
	return (
		str:gsub("%b{}", function(block)
			local code = block:match("{(.*)}")
			local exp_env = {}
			setmetatable(exp_env, {
				__index = function(_, k)
					local stack_level = 5
					while debug.getinfo(stack_level, "") ~= nil do
						local i = 1
						repeat
							local name, value = debug.getlocal(stack_level, i)
							if name == k then
								return value
							end
							i = i + 1
						until name == nil
						stack_level = stack_level + 1
					end
					return rawget(outer_env, k)
				end,
			})
			local fn, err = load("return " .. code, "expression `" .. code .. "`", "t", exp_env)
			if fn then
				return tostring(fn())
			else
				error(err, 0)
			end
		end)
	)
end

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
