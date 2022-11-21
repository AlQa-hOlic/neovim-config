local status, _ = pcall(require, "gruvbox")
if not status then
  return
end

local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
  print("Colorscheme gruvbox not found!")
  return
end
