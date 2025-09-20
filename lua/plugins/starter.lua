-- lua/config/plugins/starter.lua
return {
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  {
    "mini.starter",
    config = function()
      require("mini.starter").setup({
        items = {
          require("mini.starter").sections.recent_files(5, true),
          require("mini.starter").sections.builtin_actions(),
        },
        content_hooks = { require("mini.starter").gen_hook.adding_bullet("•") },
      })
    end,
  },
}
