-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- basic closing and saving
keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
keymap.set("n", "<C>q", ":qa!", { desc = "Force quit Quit" })
keymap.set("n", "<leader>w", ":w<cr>", { desc = "Save current buffer" })

-- moving between open buffers
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
