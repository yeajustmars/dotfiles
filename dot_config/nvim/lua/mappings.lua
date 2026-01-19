require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<localleader><space>", "<cmd>nohlsearch<CR>")

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end)

map("n", "<localleader>d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic" })

map('t', '<Esc>', '<C-\\><C-n>', { silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>",
  { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>",
  { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>",
  { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>",
  { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
  { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>",
  { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>",
  { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>",
  { desc = "Debugger testables" })

-- clojure*
map("n", "<C-j>", "<cmd>ALENextWrap<CR>")
map("n", "<C-k>", "<cmd>ALEPreviousWrap<CR>")

local tele = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tele.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', tele.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', tele.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', tele.help_tags, { desc = 'Telescope help tags' })
