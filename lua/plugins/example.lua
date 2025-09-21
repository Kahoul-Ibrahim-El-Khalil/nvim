-- ~/.config/nvim/lua/config/lazy.lua
-- This file controls plugin imports for LazyVim.
-- Order matters: core -> extras -> user plugins.

-- 1️⃣ LazyVim core (must be first)
local core = {
  { import = "lazyvim.plugins" },
}

-- 2️⃣ LazyVim extras (always after core)
local extras = {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
}

-- 3️⃣ User plugin tweaks (defined here)
local defined_here = {
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  { "folke/trouble.nvim", enabled = false },
}

-- 4️⃣ User config overrides
local colorscheme = {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin" },
  },
}

-- 5️⃣ Load modular plugin specs from lua/plugins/*
local cmp       = require("plugins.cmp")
local dap       = require("plugins.dap")
local lsp       = require("plugins.lsp")
local lualine   = require("plugins.lualine")
local mason     = require("plugins.mason")
local starter   = require("plugins.starter")
local telescope = require("plugins.telescope")
local treesitter= require("plugins.treesitter")
local tree      = require("plugins.tree")
local conform   = require("plugins.conform")

-- utility merge function
local function merge_tables(target, source)
  for _, plugin in ipairs(source) do
    table.insert(target, plugin)
  end
end

-- assemble final plugin list
local plugins = {}
merge_tables(plugins, core)        -- core first
merge_tables(plugins, extras)      -- extras second
merge_tables(plugins, defined_here)
merge_tables(plugins, colorscheme)
merge_tables(plugins, tree)
merge_tables(plugins, cmp)
merge_tables(plugins, dap)
merge_tables(plugins, lsp)
merge_tables(plugins, lualine)
merge_tables(plugins, mason)
merge_tables(plugins, starter)
merge_tables(plugins, telescope)
merge_tables(plugins, treesitter)
merge_tables(plugins, conform)

return plugins
