vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete bffer" })

-- navigation
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase split height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease split height" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase split width" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease split width" })
map("n", "<C-h>", "<C-w>h", { desc = "Focus left screen" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus up screen" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus down screen" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus left screen" })

-- line edition
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- better indenting
map("v", "<", "<gv", { desc = "Indent selection left and reselect" })
map("v", ">", ">gv", { desc = "Indent selection right and reselect" })

-- File navigation
map("n", "<leader>e", function() require("snacks").explorer() end, { desc = "Open snack explorer" })

-- quick config file
map("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Open nvim init.lua" })
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>qa", ":qa<CR>", { desc = "Quit all" })

-- 42
map("n", "<leader>hd", ":Stdheader<CR>", { desc = "42 header" })

-- documentation
map("n", "<leader>gdg", ":Neogen<CR>", { desc = "Generate current function's doc" })

-- tab
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })

-- Tab moving
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>', { desc = 'Move tab' })
vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Move tab left' })

