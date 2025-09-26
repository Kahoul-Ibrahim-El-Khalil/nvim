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
        -- No `--style` here, so it uses .clang-format from your project root
        -- You can still add other args if needed, e.g. fallback style
        prepend_args = { "--fallback-style=LLVM" },
      },
    },
  },
}
