local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>findf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gitf', builtin.git_files, {})
vim.keymap.set('n', '<leader>grepf', function()
	builtin.grep_string({ search = vim.fn.input("> ") })
end)

