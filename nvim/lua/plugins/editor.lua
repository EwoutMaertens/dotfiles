return {
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- multi-file search and replace
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Search and Replace (Spectre)" },
      { "<leader>sw", function() require("spectre").open_visual({ select_word = true }) end, desc = "Search current word (Spectre)" },
      { "<leader>sf", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Search in current file (Spectre)" },
    },
  },

  -- bookmark files for quick switching
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon add file" },
      { "<leader>h", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
      { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon file 1" },
      { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon file 2" },
      { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon file 3" },
      { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon file 4" },
    },
    config = function()
      require("harpoon"):setup()
    end,
  },

  -- structural text objects (select/move/swap functions, classes, arguments)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "outer function" },
            ["if"] = { query = "@function.inner", desc = "inner function" },
            ["ac"] = { query = "@class.outer", desc = "outer class" },
            ["ic"] = { query = "@class.inner", desc = "inner class" },
            ["aa"] = { query = "@parameter.outer", desc = "outer argument" },
            ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = { query = "@function.outer", desc = "Next function" },
            ["]c"] = { query = "@class.outer", desc = "Next class" },
            ["]a"] = { query = "@parameter.inner", desc = "Next argument" },
          },
          goto_previous_start = {
            ["[f"] = { query = "@function.outer", desc = "Prev function" },
            ["[c"] = { query = "@class.outer", desc = "Prev class" },
            ["[a"] = { query = "@parameter.inner", desc = "Prev argument" },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sn"] = { query = "@parameter.inner", desc = "Swap with next argument" },
          },
          swap_previous = {
            ["<leader>sp"] = { query = "@parameter.inner", desc = "Swap with prev argument" },
          },
        },
      },
    },
  },
}
