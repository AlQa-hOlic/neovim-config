local utils = require("alqaholic.utils")
local import = utils.safe_require

local gitsigns = import("gitsigns")

if not gitsigns then
	return
end

gitsigns.setup()
