-- ~/.config/nvim/lua/config/lazy.lua
-- This file controls plugin imports for LazyVim.
-- Order matters: core -> extras -> user plugins.

return {
  -- 1️⃣ LazyVim core (must be first)
  { import = "lazyvim.plugins" },

  -- 2️⃣ Extras
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },

  -- 3️⃣ Inline user tweaks
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  { "folke/trouble.nvim", enabled = false },

  -- 4️⃣ Override LazyVim options
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },

  -- 5️⃣ Import all custom plugins from lua/plugins/*
  { import = "plugins" },
}
