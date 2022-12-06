local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local M = {}
M.map = map;

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
map("i", "jk", "<Esc>");
map("n", "<C-d>", "<C-d>zz");
map("n", "<C-u>", "<C-u>zz");
map("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save" });
map("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" });

-- Harpoon
local ui = require("harpoon.ui");
local mark = require("harpoon.mark");

map("n", "<C-e>", function() ui.toggle_quick_menu() end)
map("n", "<leader>a", function() mark.add_file() end, { desc = "Add to Harpoon" })
map("n", "<C-j>", function() ui.nav_file(1) end)
map("n", "<C-k>", function() ui.nav_file(2) end)
map("n", "<C-l>", function() ui.nav_file(3) end)
map("n", "<C-;>", function() ui.nav_file(4) end)

-- Nvim Tree
map("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
map("n", "<leader>e", "<Cmd>NvimTreeFocus<CR>", { desc = "Toggle file explorer" })


return M;
