---@type LazySpec
return {
  -- Mason installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",

        -- Python
        "pyright", -- Python LSP

        -- ⚙️ C / C++
        "clangd", -- LSP for C/C++
        "cppdbg", -- Debug adapter (GDB/LLDB)
        -- "codelldb", -- Optional: LLDB alternative

        -- CMake
        "cmake-language-server", -- CMake LSP

        -- TeX / LaTeX
        "texlab", -- LSP for LaTeX
        "latexindent", -- Formatter
      },
    },
  },

  -- Core DAP
  { "mfussenegger/nvim-dap" },

  -- UI for DAP
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

  -- Inline virtual text
  { "theHamsta/nvim-dap-virtual-text" },
}
