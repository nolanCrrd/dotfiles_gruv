return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
        { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = 'Find Keymaps' },
    },
    config = function()
        require('telescope').setup{}
    end
}
