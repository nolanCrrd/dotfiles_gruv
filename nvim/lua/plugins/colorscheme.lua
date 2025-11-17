return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    init = function()
      -- options globales AVANT chargement
      vim.g.gruvbox_material_background = "soft"          -- contraste
      vim.g.gruvbox_material_foreground = "material"     -- palette
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_better_performance = 1
      
      -- Lit le color-scheme de gsettings
      local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
      local result = handle:read("*a")
      handle:close()
      
      -- Check si c'est dark ou light
      if result:match("prefer%-dark") then
        vim.o.background = "dark"
      else
        vim.o.background = "light"
      end
    end,  -- <-- la virgule manquait ici !
    config = function()
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
}
