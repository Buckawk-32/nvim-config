vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "v" }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("n", "gx", "<Nop>", opts)

-- Text stuff
opts.desc = "Toggle Word Wrap"
vim.keymap.set("n", "<Leader>wr", ":set wrap!<CR>", opts)

-- Resizing Windows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Moving around windows
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Window splitting
opts.desc = "Create Vertical Split"
vim.keymap.set("n", "<Leader>vs", "<C-w>v<CR>", opts)

opts.desc = "Create Horizontal Split"
vim.keymap.set("n", "<Leader>hs", "<C-w>s<CR>", opts)

opts.desc = "Close Current Split"
vim.keymap.set("n", "<Leader>xs", ":close<CR>", opts)

opts.desc = "Spread Spilts Evenly"
vim.keymap.set("n", "<Leader>es", "<C-w>=<CR>", opts)

-- buffer stuff
opts.desc = "Create New Buffer"
vim.keymap.set("n", "<Leader>nb", ":enew<CR>", opts)

opts.desc = "Go to Next Buffer"
vim.keymap.set("n", "<C-]>", ":BufferNext<CR>", opts)

opts.desc = "Go to Previous Buffer"
vim.keymap.set("n", "<C-[>", ":BufferPrevious<CR>", opts)

opts.desc = "Close Current Buffer"
vim.keymap.set("n", "<Leader>xb", ":BufferClose<CR>", opts)

opts.desc = "Switch to (x)Buffer"
vim.keymap.set("n", "<Leader>fb", ":BufferPick<CR>", opts)

opts.desc = "Switch to (x)Buffer (Telescope)"
vim.keymap.set("n", "<Leader>Fb", ":Telescope buffers<CR>", opts)

-- tab stuff
opts.desc = "Create New Tab"
vim.keymap.set("n", "<Leader>nt", ":tabnew<CR>", opts)

opts.desc = "Close Current Tab"
vim.keymap.set("n", "<Leader>xt", ":tabclose<CR>", opts)

-- Searching stuff
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

opts.desc = "Clear Highlighting"
vim.keymap.set("n", "<Leader>ch", ":nohl<CR>", opts)

-- Navigation stuff
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "<C-f>", "<C-f>zz", opts)
vim.keymap.set("n", "<C-b>", "<C-b>zz", opts)

-- Neotree stuff 
opts.desc = "Close Neotree"
vim.keymap.set("n", "<Leader>cN", ":Neotree close<CR>", opts)

opts.desc = "Open Neotree"
vim.keymap.set("n", "<Leader>N", ":Neotree<CR>", opts)

-- Telescope stuff
opts.desc = "Find File (Telescope)"
vim.keymap.set("n", "<Leader>ff", ":Telescope find_files<CR>", opts)

opts.desc = "Find Word (Telescope)"
vim.keymap.set("n", "<Leader>fw", ":Telescope live_grep<CR>", opts)


-- Git stuff
opts.desc = "Open NeoGit"
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", opts)

