-- lua/config/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = false,
      ignore_install = { "haskell", "swift", "php", "go", "rust", "vim", "html", "css", "javascript" },
      ensure_installed = { "json", "lua", "python", "c", "cpp", "cmake" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "tsx", "typescript" })
    end,
  },
}
