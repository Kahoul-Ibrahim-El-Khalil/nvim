-- Custom keymaps using raw Neovim API (overrides AstroNvim defaults)

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ==============================
-- General
-- ==============================
map("n", "<leader>s", "<cmd>w<cr>", vim.tbl_extend("force", opts, { desc = "Save file" }))
map("n", "<C-s>", "<cmd>w<cr>", vim.tbl_extend("force", opts, { desc = "Save file (Ctrl+S)" }))
map("n", "<leader>q", "<cmd>q<cr>", vim.tbl_extend("force", opts, { desc = "Quit window" }))
map("n", "<leader>Q", "<cmd>qa!<cr>", vim.tbl_extend("force", opts, { desc = "Quit all (force)" }))
map("n", "<leader>nh", "<cmd>nohlsearch<cr>", vim.tbl_extend("force", opts, { desc = "Clear search highlights" }))
map("n", "<C-a>", "gg<S-v>G", vim.tbl_extend("force", opts, { desc = "Select all" }))

-- ==============================
-- Window / Split Management
-- ==============================
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Move to top window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- ==============================
-- Buffers
-- ==============================
map("n", "<C-q>", "<cmd>bd<cr>", { desc = "Close buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- ==============================
-- Clipboard
-- ==============================
map("n", "<C-c>", '"+y', { desc = "Yank line to system clipboard" })
map("v", "<C-c>", '"+y', { desc = "Yank selection to system clipboard" })
map("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })

-- ==============================
-- Terminal
-- ==============================
map("n", "<leader>t", "<cmd>terminal<cr>", { desc = "Open terminal" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- ==============================
-- Plugins
-- ==============================
map("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })

-- Git (requires vim-fugitive)
map("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git status" })
