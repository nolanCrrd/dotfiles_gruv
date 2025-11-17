require("config.lazy")
require("keymaps")

vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "Text" })
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Text" })
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "Special" })
-- [basics] --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 10

-- [Indentation] --
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",        -- tab affiché comme ▸ + espace
  trail = "·",       -- espace en fin de ligne
  extends = "…",     -- ligne trop longue à droite
  precedes = "…",    -- ligne trop longue à gauche
}
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = false
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

-- buffer

-- Function to open file in new tab
local function open_file_in_tab()
  vim.ui.input({ prompt = 'File to open in new tab: ', completion = 'file' }, function(input)
    if input and input ~= '' then
      vim.cmd('tabnew ' .. input)
    end
  end)
end

vim.keymap.set('n', '<leader>to', open_file_in_tab, { desc = 'Open file in new tab' })

-- Force les numéros même après changement de buffer
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
    pattern = '*',
    callback = function()
        vim.opt.number = true
        vim.opt.relativenumber = true
    end
})

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
