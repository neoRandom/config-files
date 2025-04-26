local undotree = require('undotree')

vim.keymap.set('n', '<leader>u', undotree.toggle, { noremap = true, silent = true })

