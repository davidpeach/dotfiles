require('gitsigns').setup {}

vim.keymap.set('n', ']h', ':Gitsigns next_hunk<cr>')
vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<cr>')
vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<cr>')
vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<cr>')
vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<cr>')
vim.keymap.set('n', 'gb', ':Gitsigns blame_line<cr>')
