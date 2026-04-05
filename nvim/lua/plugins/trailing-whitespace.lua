return {
  {
    "ntpeters/vim-better-whitespace",
    event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.better_whitespace_filetypes_blacklist = {
        "dashboard",
        "snacks_dashboard",
        "lazy",
        "mason",
        "help",
        "toggleterm",
        "TelescopePrompt",
        "diff",
        "neo-tree",
        "notify",
        "noice",
        "",
      }
    end,
  },
}
