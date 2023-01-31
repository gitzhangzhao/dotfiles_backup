return {
    'tpope/vim-surround',
    event = 'VeryLazy',
    config = function()
        vim.cmd [[
        vmap " S"
        vmap ] S]
        vmap [ S]
        vmap ' S'
        vmap > S>
        vmap < S>
        vmap ) S)
        vmap ( S)
        vmap } S}
        vmap { S}
        ]]
    end
}

