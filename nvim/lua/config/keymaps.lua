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
  },
  e = { "<cmd>Explore<cr>", "Open File [E]xplorer" },
  f = {
    name = "[F]ind",
    b = { telescope.buffers, "Find open [B]uffers" },
    f = { telescope.find_files, "Find [F]iles" },
    r = { telescope.resume, "[R]esume previous find" },
    w = { telescope.grep_string, "Find [W]ord under cursor" },
    ["/"] = { telescope.live_grep, "Find [/] in current project" },
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
      s = { telescope.diagnostics, "[S]earch in diagnostics" },
    },
    e = { vim.diagnostic.open_float, "Show diagnostic [E]rror messages" },
  },
  n = {
    name = "[N]ote taking with [N]eorg",
    i = {
      name = "[I]nsert",
      d = { "Insert [D]ate" },
    },
    j = {
      name = "[J]ournal",
      c = { "<cmd>Neorg journal custom<cr>", "[C]ustom journal date" },
      t = { "<cmd>Neorg journal today<cr>", "Journal for [T]oday" },
    },
    m = {
      name = "[M]odes",
      n = "[N]eorg mode",
      h = "[H]eadings mode",
      l = "[L]inks mode",
    },
    n = {
      name = "[N]otes",
      n = { "[N]ew note" },
    },
    r = { "<cmd>Neorg return<cr>", "[R]eturn from whence you came" },
    t = {
      name = "[T]asks",
      a = { "Mark as [A]mbiguous" },
      c = { "Mark as [C]ancelled" },
      d = { "Mark as [D]one" },
      h = { "Mark as on [H]old" },
      i = { "Mark as [I]mportant" },
      p = { "Mark as [P]ending" },
      r = { "Mark as [R]ecurring" },
      u = { "Mark as [U]ndone" },
    },
    x = { "<cmd>Neorg index<cr>", "Inde[X]" },
    w = {
      name = "[W]orkspaces",
      n = { "<cmd>Neorg workspace notes<cr>", "[N]otes workspace" },
      w = { "<cmd>Neorg workspace work<cr>", "[W]ork workspace" },
    },
  },
  o = {
    name = "[O]tter",
    a = { require("otter").dev_setup, "otter [a]ctivate" },
  },
  q = {
    name = "[q]uarto",
    a = { ":QuartoActivate<cr>", "[a]ctivate" },
    p = { ":lua require'quarto'.quartoPreview()<cr>", "[p]review" },
    q = { ":lua require'quarto'.quartoClosePreview()<cr>", "[q]uit preview" },
    h = { ":QuartoHelp ", "[h]elp" },
    r = {
      name = "[r]un",
      r = { ":QuartoSendAbove<cr>", "to cu[r]sor" },
      --   a = { ":QuartoSendAll<cr>", "run [a]ll" },
      --   b = { ":QuartoSendBelow<cr>", "run [b]elow" },
    },
    -- e = { require("otter").export, "[e]xport" },
    -- E = {
    --   function()
    --     require("otter").export(true)
    --   end,
    --   "[E]xport with overwrite",
    -- },
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
}, { mode = "n", prefix = "<leader>" })

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
  [","] = {
    name = "Quickly ...",
    c = { "<cmd>cclose<cr>", "[C]lose the Quickfix list." },
    o = { "<cmd>copen<cr>", "[O]pen the Quickfix list." },
    m = { "<cmd>make<cr>", "Run [M]ake" },
  },
})
