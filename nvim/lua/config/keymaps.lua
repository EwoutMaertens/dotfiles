-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Grep in a specific directory (prompts for path)
vim.keymap.set("n", "<leader>sd", function()
  local dir = vim.fn.input("Directory: ", "", "dir")
  if dir ~= "" then
    require("telescope.builtin").live_grep({ search_dirs = { dir } })
  end
end, { desc = "Grep in directory" })
