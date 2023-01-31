return {
    'nvim-tree/nvim-tree.lua',
    cmd = {
        "NvimTreeToggle",
        "NvimTreeOpen",
        "NvimTreeFindFile",
        "NvimTreeFindFileToggle",
        "NvimTreeRefresh",
    },
    config = function()
        vim.g.loaded_netrwPlugin = 1
        vim.g.loaded_netrw = 1
        require('nvim-tree').setup()
    end,
    init = function()
        vim.keymap.set('n', '<F7>', '<CMD>NvimTreeToggle<CR>', { silent = true } )
    end
}
