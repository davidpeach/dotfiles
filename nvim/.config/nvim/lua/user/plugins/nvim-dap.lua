local dap = require('dap')
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { "/home/david/.neovim/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003
  }
}

-- Keybindings
vim.keymap.set("n", "<F8>", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")

require('nvim-dap-virtual-text').setup()
require('dapui').setup()