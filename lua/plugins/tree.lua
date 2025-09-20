return { 
{
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional for icons
    config = function()
      local tree = require("nvim-tree")
      tree.setup({
        view = {
          width = 30,
          side = "left",
          adaptive_size = true,
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false, -- show hidden files
        },
      })

      -- Keymap to toggle Nvim Tree
      vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    end,
  },
 }