-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

local defined_here = {
  { import = "lazyvim.plugins" },

  -- 2️⃣ Extras second
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  { import = "lazyvim.plugins.extras.lang.json" },

  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },
}

local colorscheme = {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

-- override nvim-cmp and add cmp-emoji
-- change some telescope options and a keymap to browse plugin files
-- add pyright to lspconfig
-- add tsserver and setup with typescript.nvim instead of lspconfig
-- add more treesitter parsers
-- require all modular plugin specs
local cmp = require("plugins.cmp")
local dap = require("plugins.dap")
local lsp = require("plugins.lsp")
local lualine = require("plugins.lualine")
local mason = require("plugins.mason")
local starter = require("plugins.starter")
local telescope = require("plugins.telescope")
local treesitter = require("plugins.treesitter")
local tree = require("plugins.tree")

local plugins = {}

local function merge_tables(target, source)
  for _, plugin in ipairs(source) do
    table.insert(target, plugin)
  end
end
merge_tables(plugins, defined_here)
merge_tables(plugins, tree)
merge_tables(plugins, cmp)
merge_tables(plugins, colorscheme)
merge_tables(plugins, dap)
merge_tables(plugins, lsp)
merge_tables(plugins, lualine)
merge_tables(plugins, mason)
merge_tables(plugins, starter)
merge_tables(plugins, telescope)
merge_tables(plugins, treesitter)

return plugins
