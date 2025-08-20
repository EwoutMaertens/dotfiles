local remove_background = function()
  -- The `vim.api.nvim_set_hl` function sets a highlight group.
  -- The `bg = "none"` part removes the background color.

  -- The main editor background
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

  -- Background for floating windows (e.g., LSP popups, find and replace)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- Background for UI elements like sign columns and non-text areas
  vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

  -- This can be useful for plugins like `nvim-tree`
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
end

-- Create an autocommand to run the function whenever a colorscheme is loaded.
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = remove_background,
})

-- Call it once on startup, in case the colorscheme is loaded before the autocommand.
remove_background()
