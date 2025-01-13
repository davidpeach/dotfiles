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
  { "<leader><cr>", send_cell,                                       desc = "Run code cell" },
  { "<leader>c",    desc = "[C]ode" },
  { "<leader>cc",   "<cmd>SlimeConfig<cr>",                          desc = "Slime [C]onfig" },
  { "<leader>cp",   "<cmd>silent !tmux split-window -dh php -a<cr>", desc = "New [P]HP Terminal" },
  {
    "<leader>cr",
    function()
      vim.b["quarto_is_r_mode"] = true
      vim.cmd("silent !tmux split-window -dh R")
    end,
    desc = "new [R] terminal",
  },
  { "<leader>cy",         "<cmd>silent !tmux split-window -dh ipython<cr>",                        desc = "New P[y]thon Terminal" },
  { "<leader>e",          "<cmd>Explore<cr>",                                                      desc = "Open File [E]xplorer" },

  -- [[------------------------
  --  👉 Find-related bindings.
  ----------------------------- ]]
  { "<leader>f",          desc = "[F]ind" },
  { "<leader>fh",         telescope.quickfixhistory,                                               desc = "[F]ind in Quickfix [H]istory" },
  { "<leader>fm",         telescope.marks,                                                         desc = "Find across Vim [M]arks" },
  { "<leader>fn",         function() telescope.find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "[F]ind in [N]eovim files" },
  { "<leader>fq",         telescope.quickfix,                                                      desc = "[F]ind files in current [Q]uickfix list" },
  { "<leader>f.",         telescope.oldfiles,                                                      desc = "Find [.] recent files" },
  { "<leader>h",          telescope.help_tags,                                                     desc = "Search [H]elp" },

  -- [[-----------------------
  --  👉 LSP-related bindings.
  ---------------------------- ]]
  { "<leader>l",          desc = "[L]SP" },
  { "<leader>ld",         desc = "[L]SP Diagnostics" },
  { "<leader>lde",        vim.diagnostic.enable,                                                   desc = "[L]SP [D]iagnostics [e]nable" },
  { "<leader>ldd",        vim.diagnostic.enable(false),                                            desc = "[L]SP [D]iagnostics [D]isable" },
  { "<leader><leader>d",  vim.diagnostic.setloclist,                                               desc = "Open LSP [D]iagnostics location list" },
  { "<leader>lr",         "<cmd>LspRestart<cr>",                                                   desc = "[L]SP [R]estart" },
  { "<leader>lo",         "<cmd>Outline<cr>",                                                      desc = "[L]SP [O]utline document" },

  -- [[------------------------------
  --  👉 Spellcheck-related bindings.
  ----------------------------------- ]]
  { "<leader><leader>s",  desc = "Spellcheck" },
  { "<leader><leader>se", ":lua vim.opt.spell = true<cr>",                                         desc = "[E]nable Spellcheck" },
  { "<leader><leader>sd", ":lua vim.opt.spell = false<cr>",                                        desc = "[D]isable Spellcheck" },


  -- [[------------------------------
  --  👉 Quick-open-related bindings.
  ----------------------------------- ]]
  { "<leader>o",          desc = "[O]pen" },
  { "<leader>ol",         "<cmd>Lazy<cr>",                                                         desc = "[O]pen [L]azy" },
  { "<leader>om",         "<cmd>Mason<cr>",                                                        desc = "[O]pen [M]ason" },

  -- [[--------------------------
  --  👉 Window-related bindings.
  ------------------------------- ]]
  { "<leader>w",          desc = "Windows" },

  { "<leader>y",          '"+y',                                                                   desc = "Yank to clipboard" },

  { "<leader>z",          "<cmd>ZenMode<cr>",                                                      desc = "[Z]en mode" },
})

vim.cmd("autocmd FileType php lua WhichKeyPhp()")
function WhichKeyPhp()
  wk.add({
    { "<localleader>a",  desc = "PHP [A]ctions" },
    { "<localleader>ac", "<cmd>:PhpactorContextMenu<cr>",       desc = "[A]ction [C]ontext menu" },
    { "<localleader>at", "<cmd>:PhpactorTransform<cr>",         desc = "[A]ction [T]ransform" },
    { "<localleader>ai", "<cmd>:PhpactorImportClass<cr>",       desc = "[A]ction [I]mport class" },
    { "<localleader>ae", "<cmd>:PhpactorExtractExpression<cr>", desc = "[A]ction [E]xtract expression to variable." },
    { "<localleader>ax", "<cmd>:PhpactorExtractMethod<cr>",     desc = "[A]ction E[x]tract selection to method." },
  })
end

wk.add({
  { "<esc>",             "<cmd>nohlsearch<CR>",    desc = "Remove search highlighting" },

  { "[d",                vim.diagnostic.goto_prev, desc = "Previous [D]iagnostic message" },
  { "]d",                vim.diagnostic.goto_next, desc = "Go to next [D]iagnostic message" },

  { "[q",                "<cmd>cprevious<cr>",     desc = "Previous [Q]uickfix Item" },
  { "]q",                "<cmd>cnext<cr>",         desc = "Next [Q]uickfix Item" },

  { "\\m",               "<cmd>make<cr>",          desc = "Run [M]ake" },

  { "<leader>q",         "<cmd>copen<cr>",         desc = "Open the [Q]uickfix list." },
  { "<leader><leader>q", "<cmd>cclose<cr>",        desc = "[C]lose the Quickfix list." },

  { "[Q",                "<cmd>colder<cr>",        desc = "Older [Q]uickfix list." },
  { "]Q",                "<cmd>cnewer<cr>",        desc = "Newer Quickfix list." },
})

wk.add({
  { ",b",  ":lua require'dap'.toggle_breakpoint()<CR>",      desc = "Toggle [B]reakpoint" },
  { ",c",  ":lua require'dap'.continue()<CR>",               desc = "[C]ontinue debugging" },
  { ",v",  ":lua require'dap'.step_over()<CR>",              desc = "Step O[v]er" },
  { ",i",  ":lua require'dap'.step_into()<CR>",              desc = "Step [I]nto" },
  { ",o",  ":lua require'dap'.step_out()<CR>",               desc = "Step [O]out" },

  { ",d",  desc = "Debugger" },
  { ",dt", ":lua require'dapui'.toggle({reset = true})<CR>", desc = "[T]oggle Debugger UI" },
  { ",dr", ":lua require'dapui'.open({reset = true})<CR>",   desc = "[R]eset Debugger UI Layout" },
  { ",dk", "<cmd>DapTerminate<cr>",                          desc = "[K]ill Debugger" },
}, {
  mode = "n",
  prefix = ",",
})
