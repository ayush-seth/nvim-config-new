local o = vim.opt;

o.number = true;
o.relativenumber = true;

o.undofile = true;
o.swapfile = false;
o.backup = false;

o.splitbelow = true;
o.splitright = true;

o.timeoutlen = 500;
o.updatetime = 500;

o.clipboard = "unnamedplus";

o.tabstop = 2;
o.shiftwidth = 2;
o.softtabstop = 2;
o.expandtab = true;

o.ignorecase = true;
o.smartcase = true;

o.scrolloff = 8;
o.sidescrolloff = 8;

o.showmode = false;

o.pumheight = 10;
o.pumblend = 10;

o.termguicolors = true;

o.signcolumn = "yes";
o.cursorline = true

o.completeopt = "menu,menuone,preview,noinsert"
