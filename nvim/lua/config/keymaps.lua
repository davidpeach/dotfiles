local wk = require("which-key")
local telescope = require("telescope.builtin")

wk.register({
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
