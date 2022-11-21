local M = {}

local status, luasnip = pcall(require, "luasnip")
if not status then
  return
end

-- Load in JSON snippets (VSCode syntax)
local status, loader = pcall(require, "luasnip.loaders.from_vscode")
if not status then
  return
end

-- Load only the filetype appropriate snippets
loader.lazy_load({
  paths = { vim.fn.stdpath("config") .. "/snippets" },
})

function M.jump_to_next_field()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end

function M.jump_to_previous_field()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end

return M
