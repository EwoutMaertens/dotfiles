local remove_background = function()
  local groups = {
    -- core editor
    "Normal",
    "NormalNC",
    "NormalFloat",
    "NonText",
    "SignColumn",
    "EndOfBuffer",

    -- floating windows & borders
    "FloatBorder",
    "FloatTitle",

    -- telescope
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "TelescopeResultsNormal",
    "TelescopeResultsBorder",
    "TelescopePreviewNormal",
    "TelescopePreviewBorder",

    -- neo-tree
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeEndOfBuffer",

    -- sidebar / split backgrounds
    "StatusLine",
    "StatusLineNC",
    "WinSeparator",

    -- notify / noice popups
    "NotifyBackground",
    "NoicePopup",
    "NoiceCmdlinePopup",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = remove_background,
})

remove_background()
