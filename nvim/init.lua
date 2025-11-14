-- [basics] --
vim.cmd.colorscheme("retrobox")
vim.api.nvim_set_hl(0, "Normal", { bg = none })
vim.api.nvim_set_hl(0, "NormalNC", { bg = none })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = none })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 10

-- [Indentation] --
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- [Search settings] --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- [Visual settings] --
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 1
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300

-- [File handling] --
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.autoread = true
vim.opt.autowrite = true

-- [Behavior settings] --
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.path:append("**")
vim.opt.selection = "exclusive"
vim.opt.mouse = 'a'
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true
vim.opt.encoding = "UTF-8"

-- [ KEYMAPS ] --

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
-- buffer
map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Next buffer" })

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
map("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
map("n", "<leader>ff", ":find ", { desc = "Find file" })

-- quick config file
map("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Open nvim init.lua" })

-- tab
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })

-- Tab moving
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>', { desc = 'Move tab' })
vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Move tab left' })

-- Function to open file in new tab
local function open_file_in_tab()
  vim.ui.input({ prompt = 'File to open in new tab: ', completion = 'file' }, function(input)
    if input and input ~= '' then
      vim.cmd('tabnew ' .. input)
    end
  end)
end

vim.keymap.set('n', '<leader>to', open_file_in_tab, { desc = 'Open file in new tab' })

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = {},
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})
