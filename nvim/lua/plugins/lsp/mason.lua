return {
    "williamboman/mason-lspconfig.nvim",
    opts = {
        ensure_instaled = {
            "clangd",
            "lua_ls",
            "pyright",
        }
    },
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {}
        },
        {
            "neovim/nvim-lspconfig"
        }
    }
}
