local aug = vim.api.nvim_create_augroup("user", { clear = true })

-- Use a directory passed on the command line as the initial project root.
if vim.fn.argc() == 1 then
  local directory = vim.fn.fnamemodify(vim.fn.argv(0), ":p")
  if vim.fn.isdirectory(directory) == 1 then
    vim.api.nvim_create_autocmd("VimEnter", {
      group = aug,
      once = true,
      callback = function() vim.fn.chdir(directory) end,
    })
  end
end

vim.api.nvim_create_autocmd("TextYankPost", {
  group = aug,
  callback = function() vim.hl.on_yank() end,
})

-- restore last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  group = aug,
  callback = function(ev)
    local mark = vim.api.nvim_buf_get_mark(ev.buf, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(ev.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
