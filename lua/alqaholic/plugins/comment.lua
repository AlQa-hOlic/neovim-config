local utils = require("alqaholic.utils")
local import = utils.safe_require

local comment = import("Comment")

if not comment then
	return
end

comment.setup()
