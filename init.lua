-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.v.servername ~= "" then
  vim.env.NVIM_SERVER = vim.v.servername
end
