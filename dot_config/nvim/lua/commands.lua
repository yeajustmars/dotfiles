
vim.api.nvim_create_user_command('MakeList', function(opts)
    local start_line = opts.line1 - 1
    local end_line = opts.line2
    local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
    for i, line in ipairs(lines) do
        lines[i] = i .. ". [ ] " .. line
    end
    vim.api.nvim_buf_set_lines(0, start_line, end_line, false, lines)
end, {
    range = true,
    desc = "Add relative numbered checkboxes to selected lines"
})
