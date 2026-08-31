-- ~/.config/nvim/lua/plugins/myplugins.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false, -- 🔑 load immediately
    event = {}, -- override LazyVim's LazyFile event
    opts = {
      signcolumn = true, -- always show signs
      numhl = false,
      linehl = false,
      current_line_blame = true, -- Enable inline git blame by default
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000, -- delay before showing blame (ms)
      },
    },
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
