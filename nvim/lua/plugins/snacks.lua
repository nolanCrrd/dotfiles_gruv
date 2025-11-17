return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { 
        enabled = true, 
        hidden = true,
        ignore= true,
        hide_dotfiles = false, -- important !
        mapping = {
            ["<CR>"] = function()
                  -- Si y'a déjà un buffer ouvert quelque part, on l'utilise
                  local wins = vim.api.nvim_list_wins()
                  for _, win in ipairs(wins) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    local ft = vim.bo[buf].filetype
                    -- On cherche une fenêtre qui n'est pas l'explorer
                    if ft ~= "snacks_explorer" and vim.bo[buf].buftype == "" then
                      -- On ouvre dans cette fenêtre
                      vim.api.nvim_set_current_win(win)
                      return "open"
                    end
                  end
                  -- Sinon on ouvre normalement
                  return "open"
                end,
        }
    },
    indent = { 
        enabled = true, 
        animate = {
            enabled = false
        }
    },
    input = { enabled = true },
    picker = { enabled = true, hidden = true, ignored = true },
    notifier = { enabled = true },
	styles = {
	  notification = {
		wo = { 
		  wrap = true,
		},
	  }
	},
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
