local M = {}

local ns = vim.api.nvim_create_namespace("git-author-highlight")

function M.highlight_author(author)
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

  local file = vim.fn.expand("%")
  local handle = io.popen("git blame --line-porcelain " .. file)
  if not handle then
    return
  end

  local line = 0
  for l in handle:lines() do
    if l:match("^author ") and l:match(author) then
      vim.api.nvim_buf_add_highlight(0, ns, "Search", line, 0, -1)
    end
    if l == "" then
      line = line + 1
    end
  end
  handle:close()
end

function M.clear()
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

return M
