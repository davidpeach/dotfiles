local wk = require("which-key")
local telescope = require("telescope.builtin")

local function send_cell()
  if vim.b["quarto_is_r_mode"] == nil then
    vim.fn["slime#send_cell"]()
    return
  end
  if vim.b["quarto_is_r_mode"] == true then
    vim.g.slime_python_ipython = 0
    local is_python = require("otter.tools.functions").is_otter_language_context("python")
    if is_python and not vim.b["reticulate_running"] then
      vim.fn["slime#send"]("reticulate::repl_python()" .. "\r")
      vim.b["reticulate_running"] = true
    end
    if not is_python and vim.b["reticulate_running"] then
      vim.fn["slime#send"]("exit" .. "\r")
      vim.b["reticulate_running"] = false
    end
    vim.fn["slime#send_cell"]()
  end
end

wk.add({
  { "<leader><cr>", send_cell, desc = "run code cell" },
  { "<leader>c", desc = "[C]ode" },
  { "<leader>cc", "<cmd>SlimeConfig<cr>", desc = "Slime [C]onfig" },
  { "<leader>cp", "<cmd>silent !tmux split-window -dh php -a<cr>", desc = "New [P]HP Terminal" },
  {
    "<leader>cr",
    function()
      vim.b["quarto_is_r_mode"] = true
      vim.cmd("silent !tmux split-window -dh R")
    end,
    desc = "new [R] terminal",
  },
  { "<leader>cy", "<cmd>silent !tmux split-window -dh ipython<cr>", desc = "New P[y]thon Terminal" },
  { "<leader>e", "<cmd>Explore<cr>", desc = "Open File [E]xplorer" },

  { "<leader>f", desc = "Find" },
  { "<leader>fb", telescope.buffers, desc = "Find open [B]uffers" },
  { "<leader>ff", telescope.find_files, desc = "Find [F]iles" },
  { "<leader>fh", telescope.quickfixhistory, desc = "Look at Quickfix [H]istory" },
  { "<leader>fm", telescope.marks, desc = "Find across Vim [M]arks" },
  { "<leader>fq", telescope.quickfix, desc = "Find files in current [Q]uickfix list" },
  { "<leader>fr", telescope.resume, desc = "[R]esume previous find" },
  { "<leader>fw", telescope.grep_string, desc = "Find [W]ord under cursor" },
  { "<leader>f/", telescope.live_grep, desc = "Grep [/] in current project" },
  { "<leader>f.", telescope.oldfiles, desc = "Find [.] recent files" },

  { "<leader>h", telescope.help_tags, desc = "Search [H]elp" },

  { "<leader>l", desc = "LSP" },
  { "<leader>ld", desc = "LSP Diagnostics" },
  { "<leader>lde", vim.diagnostic.enable, desc = "[e]nable" },
  { "<leader>ldd", vim.diagnostic.disable, desc = "[d]isable" },
  { "<leader>ldq", vim.diagnostic.setloclist, desc = "Open diagnostic [Q]uickfix list" }, -- check
  { "<leader>ldr", "<cmd>LspRestart<cr>", desc = "[R]estart LSP" },
  { "<leader>lds", telescope.diagnostics, desc = "[S]earch in diagnostics" },

  { "<leader>le", vim.diagnostic.open_float, desc = "Show diagnostic [E]rror messages" },
  { "<leader>lo", "<cmd>Outline<cr>", desc = "[O]utline code structure" },

  { "<leader>s", desc = "Spellcheck" },
  { "<leader>se", ":lua vim.opt.spell = true<cr>", desc = "[E]nable Spellcheck" },
  { "<leader>sd", ":lua vim.opt.spell = false<cr>", desc = "[D]isable Spellcheck" },

  { "<leader>v", desc = "Vim" },
  { "<leader>vl", "<cmd>Lazy<cr>", desc = "[L]azy" },
  { "<leader>vm", "<cmd>Mason<cr>", desc = "[M]ason" },

  { "<leader>w", desc = "Windows" },
  { "<leader>we", "<cmd>wincmd =<cr>", desc = "[E]qual sizes" },
  { "<leader>wm", "<cmd>wincmd |<cr>", desc = "[M]aximize window" },
  { "<leader>wo", "<cmd>only<cr>", desc = "[O]nly window" },

  { "<leader>y", '"+y', desc = "Yank to clipboard" },

  { "<leader>z", "<cmd>ZenMode<cr>", desc = "[Z]en mode" },
})

vim.cmd("autocmd FileType php lua WhichKeyPhp()")
function WhichKeyPhp()
  wk.add({
    { "<localleader>p", desc = "PHP" },
    {
      "<localleader>pc",
      "<cmd>:PhpactorContextMenu<cr>",
      desc = "[C]ontext menu",
    },
    {
      "<localleader>pi",
      "<cmd>:PhpactorImportClass<cr>",
      desc = "[I]mport class",
    },
    {
      "<localleader>pI",
      "<cmd>silent !phpactor class:transform --transform=implement_contracts %:p<cr>",
      desc = "[I]mplement contracts",
    },
    {
      "<localleader>pn",
      "<cmd>silent !phpactor class:transform --transform=fix_namespace_class_name %:p<cr>",
      desc = "Fix [N]amespace and class name",
    },
    {
      "<localleader>pp",
      "<cmd>silent !phpactor class:transform --transform=add_missing_properties %:p<cr>",
      desc = "Add missing [P]roperty declarations",
    },
    {
      "<localleader>pr",
      "<cmd>silent !phpactor class:transform --transform=add_missing_return_types %:p<cr>",
      desc = "Add missing [R]eturn types",
    },
  })
end

vim.keymap.set("n", "<leader>sn", function()
  telescope.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

wk.add({
  { "<esc>", "<cmd>nohlsearch<CR>", desc = "Remove search highlighting" },
  { "[d", vim.diagnostic.goto_prev, desc = "Previous [D]iagnostic message" },
  { "[q", "<cmd>cprevious<cr>", desc = "Previous [Q]uickfix Item" },
  { "]d", vim.diagnostic.goto_next, desc = "Go to next [D]iagnostic message" },
  { "]q", "<cmd>cnext<cr>", desc = "Next [Q]uickfix Item" },
  { "\\c", "<cmd>cclose<cr>", desc = "[C]lose the Quickfix list." },
  { "\\m", "<cmd>make<cr>", desc = "Run [M]ake" },
  { "\\n", "<cmd>cnext<cr>", desc = "[N]ext Quickfix item." },
  { "\\o", "<cmd>copen<cr>", desc = "[O]pen the Quickfix list." },
  { "\\p", "<cmd>cprev<cr>", desc = "[P]revious Quickfix item." },
})

wk.add({
  { ",b", ":lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle [B]reakpoint" },
  { ",c", ":lua require'dap'.continue()<CR>", desc = "[C]ontinue debugging" },
  { ",v", ":lua require'dap'.step_over()<CR>", desc = "Step O[v]er" },
  { ",i", ":lua require'dap'.step_into()<CR>", desc = "Step [I]nto" },
  { ",o", ":lua require'dap'.step_out()<CR>", desc = "Step [O]out" },

  { ",d", desc = "Debugger" },
  { ",dt", ":lua require'dapui'.toggle({reset = true})<CR>", desc = "[T]oggle Debugger UI" },
  { ",dr", ":lua require'dapui'.open({reset = true})<CR>", desc = "[R]eset Debugger UI Layout" },
  { ",dk", "<cmd>DapTerminate<cr>", desc = "[K]ill Debugger" },

  { ",t", desc = "Test" },
  {
    ",ta",
    '<cmd>silent !tmux split-window -hd<cr><cmd>silent VtrAttachToPane 2<cr><cmd>silent !dunstify "Test mode activated"<cr>',
    desc = "[T]est mode [A]ctivated",
  },
  {
    ",td",
    '<cmd>silent :VtrKillRunner<cr><cmd>silent !dunstify "Test mode deactivated"<cr>',
    desc = "[T]est mode [D]eactivated",
  },
  {
    ",tr",
    '<cmd>silent :VtrAttachToPane<cr><cmd>silent !dunstify "Reattached to pane"<cr>',
    desc = "[R]eattach to pane",
  },

  { ",f", "<cmd>TestFile<cr>", desc = "Run current test [F]le" },
  { ",l", "<cmd>TestLast<cr>", desc = "Re-run the [L]ast test" },
  { ",n", "<cmd>TestNearest<cr>", desc = "Run the [N]earest test" },
  { ",s", "<cmd>TestSuite<cr>", desc = "Run the whole test [S]uite" },
  { ",p", "<cmd>TestVisit<cr>", desc = "[P]revious test file that was ran" },
}, {
  mode = "n",
  prefix = ",",
})
