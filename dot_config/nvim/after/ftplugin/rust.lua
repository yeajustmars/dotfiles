local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>a", function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)

-- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
vim.keymap.set("n", "K", function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)

-- vim.keymap.set('n', '<space>a', '<Plug>RustHoverAction')

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("RustFormat", { clear = true }),
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
