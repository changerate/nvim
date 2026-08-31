-- ~/.config/nvim/init.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.cmd("colorscheme default")

-- options
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.clipboard = {}
vim.opt.colorcolumn = "140"

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin" },
    },
  },
})

require("oil").setup() -- filesystem editing like a text file

-- keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>d", '"_dd', opts)
vim.keymap.set("n", "<leader>x", '"_x', opts)
vim.keymap.set("n", "<leader>j", ":move .+1<CR>==", opts)
vim.keymap.set("n", "<leader>k", ":move .-2<CR>==", opts)
vim.keymap.set("v", "<leader>j", ":move '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<leader>k", ":move '<-2<CR>gv=gv", opts)
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })
