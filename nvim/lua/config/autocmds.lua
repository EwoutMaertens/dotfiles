-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Define highlight for trailing whitespace
vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#FF0000" }) -- bright red background

-- Highlight trailing whitespace on buffer enter and insert leave
vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertLeave" }, {
  pattern = "*",
  callback = function()
    vim.fn.matchadd("ExtraWhitespace", [[\s\+$]])
  end,
})

-- Clear highlight while typing (insert mode)
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.fn.clearmatches()
  end,
})
