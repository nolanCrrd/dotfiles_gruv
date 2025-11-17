return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Installe tous les parsers automatiquement
      ensure_installed = { "lua", 
                "vim", 
                "vimdoc", 
                "python", 
                "javascript", 
                "typescript", 
                "bash",
                "c",
                "cpp",
                "make"
            },
      
      -- Installe les parsers de manière synchrone (seulement pour ensure_installed)
      sync_install = false,
      
      -- Installe automatiquement les parsers manquants quand tu ouvres un fichier
      auto_install = true,
      
      -- Liste des parsers à ignorer si besoin
      ignore_install = {},
      
      -- Coloration syntaxique
      highlight = {
        enable = true,
        
        -- Désactive vim syntax pour ces langages (optionnel)
        -- disable = { "c", "rust" },
        
        -- Active vim syntax en plus (pour les vieux langages)
        additional_vim_regex_highlighting = false,
      },
      
      -- Indentation basée sur Treesitter
      indent = {
        enable = true
      },
  }
  )
  end,
}
