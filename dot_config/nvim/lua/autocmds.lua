require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" }, -- Apply to all file types
  callback = function()
    local save_cursor = vim.fn.getpos(".") -- Save current cursor position
    vim.cmd([[keeppatterns %s/\s\+$//e]]) -- Remove trailing whitespace
    vim.fn.setpos(".", save_cursor) -- Restore cursor position
  end,
})
