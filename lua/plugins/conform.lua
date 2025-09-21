-- file: lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
    },
    formatters = {
      clang_format = {
        prepend_args = { "--style=LLVM" }, -- or "LLVM", "Microsoft", etc
      },
    },
  },
}
