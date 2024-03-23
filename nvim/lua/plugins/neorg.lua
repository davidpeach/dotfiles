return {
  "nvim-neorg/neorg",
  tag = "v7.0.0",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.ui.calendar"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
              work = "~/work/notes",
            },
            default_workspace = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            hook = function(keybinds)
              keybinds.remap_key("norg", "n", keybinds.leader .. "ta", keybinds.leader .. "nta")
              keybinds.remap_key("norg", "n", keybinds.leader .. "tc", keybinds.leader .. "ntc")
              keybinds.remap_key("norg", "n", keybinds.leader .. "td", keybinds.leader .. "ntd")
              keybinds.remap_key("norg", "n", keybinds.leader .. "th", keybinds.leader .. "nth")
              keybinds.remap_key("norg", "n", keybinds.leader .. "ti", keybinds.leader .. "nti")
              keybinds.remap_key("norg", "n", keybinds.leader .. "tp", keybinds.leader .. "ntp")
              keybinds.remap_key("norg", "n", keybinds.leader .. "tr", keybinds.leader .. "ntr")
              keybinds.remap_key("norg", "n", keybinds.leader .. "tu", keybinds.leader .. "ntu")
              keybinds.remap_key("norg", "n", keybinds.leader .. "nn", keybinds.leader .. "nnn")
              keybinds.remap_key("norg", "n", keybinds.leader .. "id", keybinds.leader .. "nid")
              keybinds.remap_key("all", "n", keybinds.leader .. "mn", keybinds.leader .. "nmn")
              keybinds.remap_key("all", "n", keybinds.leader .. "mh", keybinds.leader .. "nmh")
              keybinds.remap_key("all", "n", keybinds.leader .. "ml", keybinds.leader .. "nml")
            end,
          },
        },
      },
    })

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
