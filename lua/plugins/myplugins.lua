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
}
