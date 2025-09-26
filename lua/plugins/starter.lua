-- lua/config/plugins/starter.lua
return {
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  {
    "nvim-mini/mini.starter",
    enabled = false,
    opts = {
      items = {},
    },
  },
}
