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

wk.register({
  ["<cr>"] = { send_cell, "run code cell" },
  c = {
    name = "[C]ode",
    c = { "<cmd>SlimeConfig<cr>", "Slime [C]onfig" },
    p = { "<cmd>silent !tmux split-window -dh php -a<cr>", "New [P]HP Terminal" },
    r = {
      function()
        vim.b["quarto_is_r_mode"] = true
        vim.cmd("silent !tmux split-window -dh R")
      end,
      "new [R] terminal",
    },
    y = { "<cmd>silent !tmux split-window -dh ipython<cr>", "New P[y]thon Terminal" },
  },
  e = { "<cmd>Explore<cr>", "Open File [E]xplorer" },
  f = {
    name = "[F]ind",
    b = { telescope.buffers, "Find open [B]uffers" },
    f = { telescope.find_files, "Find [F]iles" },
    h = { telescope.quickfixhistory, "Look at Quickfix [H]istory" },
    m = { telescope.marks, "Find across Vim [M]arks" },
    q = { telescope.quickfix, "Find files in current [Q]uickfix list" },
    r = { telescope.resume, "[R]esume previous find" },
    w = { telescope.grep_string, "Find [W]ord under cursor" },
    ["/"] = { telescope.live_grep, "Grep [/] in current project" },
    ["."] = { telescope.oldfiles, "Find [.] recent files" },
  },
  h = { telescope.help_tags, "Search [H]elp" },
  l = {
    name = "[l]anguage/LSP",
    d = {
      name = "[d]iagnostics",
      e = { vim.diagnostic.enable, "[e]nable" },
      d = { vim.diagnostic.disable, "[d]isable" },
      q = { vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list" }, -- check
      r = { "<cmd>LspRestart", "[R]estart LSP" },
      s = { telescope.diagnostics, "[S]earch in diagnostics" },
    },
    e = { vim.diagnostic.open_float, "Show diagnostic [E]rror messages" },
    o = { "<cmd>Outline<cr>", "[O]utline code structure" },
  },
  s = {
    name = "[S]pellcheck",
    e = { ":lua vim.opt.spell = true", "[E]nable Spellcheck" },
    d = { ":lua vim.opt.spell = false", "[D]isable Spellcheck" },
  },
  v = {
    name = "[V]im",
    l = { "<cmd>Lazy<cr>", "[L]azy" },
    m = { "<cmd>Mason<cr>", "[M]ason" },
  },
  w = {
    name = "[W]indows",
    e = { "<cmd>wincmd =<cr>", "[E]qual sizes" },
    m = { "<cmd>wincmd |<cr>", "[M]aximize window" },
    o = { "<cmd>only<cr>", "[O]nly window" },
  },
  z = { "<cmd>ZenMode<cr>", "[Z]en mode" },
}, { mode = "n", prefix = "<leader>" })

vim.cmd("autocmd FileType php lua WhichKeyPhp()")
function WhichKeyPhp()
  wk.register({
    p = {
      name = "[P]hp",
      c = {
        "<cmd>:PhpactorContextMenu<cr>",
        "[C]ontext menu",
      },
      i = {
        "<cmd>:PhpactorImportClass<cr>",
        "[I]mport class",
      },
      I = {
        "<cmd>silent !phpactor class:transform --transform=implement_contracts %:p<cr>",
        "[I]mplement contracts",
      },
      n = {
        "<cmd>silent !phpactor class:transform --transform=fix_namespace_class_name %:p<cr>",
        "Fix [N]amespace and class name",
      },
      p = {
        "<cmd>silent !phpactor class:transform --transform=add_missing_properties %:p<cr>",
        "Add missing [P]roperty declarations",
      },
      r = {
        "<cmd>silent !phpactor class:transform --transform=add_missing_return_types %:p<cr>",
        "Add missing [R]eturn types",
      },
    },
  }, { prefix = "<localleader>" })
end

vim.keymap.set("n", "<leader>sn", function()
  telescope.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

wk.register({
  ["<esc>"] = { "<cmd>nohlsearch<CR>", "Remove search highlighting" },
  ["["] = {
    name = "Previous ...",
    d = { vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message" },
    q = { "<cmd>cprevious<cr>", "Previous [Q]uickfix Item" },
  },
  ["]"] = {
    name = "Next ...",
    d = { vim.diagnostic.goto_next, "Go to next [D]iagnostic message" },
    q = { "<cmd>cnext<cr>", "Next [Q]uickfix Item" },
  },
  ["\\"] = {
    name = "Quickly ...",
    c = { "<cmd>cclose<cr>", "[C]lose the Quickfix list." },
    m = { "<cmd>make<cr>", "Run [M]ake" },
    n = { "<cmd>cnext<cr>", "[N]ext Quickfix item." },
    o = { "<cmd>copen<cr>", "[O]pen the Quickfix list." },
    p = { "<cmd>cprev<cr>", "[P]revious Quickfix item." },
  },
})

wk.register({
  b = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle [B]reakpoint" },
  c = { ":lua require'dap'.continue()<CR>", "[C]ontinue debugging" },
  v = { ":lua require'dap'.step_over()<CR>", "Step O[v]er" },
  i = { ":lua require'dap'.step_into()<CR>", "Step [I]nto" },
  o = { ":lua require'dap'.step_out()<CR>", "Step [O]out" },
  d = {
    name = "[D]ebug",
    t = { ":lua require'dapui'.toggle({reset = true})<CR>", "[T]oggle Debugger UI" },
    r = { ":lua require'dapui'.open({reset = true})<CR>", "[R]eset Debugger UI Layout" },
    k = { "<cmd>DapTerminate<cr>", "[K]ill Debugger" },
  },
  t = {
    name = "[T]est",
    a = {
      '<cmd>silent !tmux split-window -hd<cr><cmd>silent VtrAttachToPane 2<cr><cmd>silent !dunstify "Test mode activated"<cr>',
      "[T]est mode [A]ctivated",
    },
    d = {
      '<cmd>silent :VtrKillRunner<cr><cmd>silent !dunstify "Test mode deactivated"<cr>',
      "[T]est mode [D]eactivated",
    },
    r = {
      '<cmd>silent :VtrAttachToPane<cr><cmd>silent !dunstify "Reattached to pane"<cr>',
      "[R]eattach to pane",
    },
  },
  f = { "<cmd>TestFile<cr>", "Run current test [F]le" },
  l = { "<cmd>TestLast<cr>", "Re-run the [L]ast test" },
  n = { "<cmd>TestNearest<cr>", "Run the [N]earest test" },
  s = { "<cmd>TestSuite<cr>", "Run the whole test [S]uite" },
  p = { "<cmd>TestVisit<cr>", "[P]revious test file that was ran" },
}, {
  mode = "n",
  prefix = ",",
})
