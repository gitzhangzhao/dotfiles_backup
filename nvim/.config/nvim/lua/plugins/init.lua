return {
    -- themes
    {
        'sainnhe/everforest',
        lazy = false,
        priority = 998,
        config = function()
            vim.g.everforest_backgroud                 = 'soft'
            vim.g.everforest_sign_column_background    = 'none'
            vim.g.everforest_diagnostic_text_highlight = 1
            vim.g.everforest_diagnostic_line_highlight = 1
            vim.g.everforest_current_word              = 'underline'
            vim.g.everforest_ui_contrast               = 'low'
            vim.g.everforest_better_performance        = 1
            vim.g.everforest_enable_italic             = 1
            vim.g.everforest_show_eob                  = 0
        end
    },

    -- editor

    {
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
            vmap / S/
            vmap ) S)
            vmap ( S)
            vmap } S}
            vmap { S}
            ]]
        end
    },

    {
        'tpope/vim-speeddating',
        keys = { '<c-a>', '<c-x>' }
    },

    {
        'tpope/vim-repeat',
        keys = '.',
        config = function()
            vim.cmd [[silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)]]
        end
    },

    {
        'junegunn/vim-easy-align',
        event = 'VeryLazy',
        config = function()
            vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { silent = true, noremap = true } )
            vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { silent = true, noremap = true } )
        end

    },

    {
        'mg979/vim-visual-multi',
        branch = 'master',
        keys = '<c-n>'
    },

    {
        'h-hg/fcitx.nvim',
        event = 'InsertEnter'
    },

    {
        'myusuf3/numbers.vim',
        event = {'BufReadPre','BufNewFile'}
    },

    -- header

    {
        'alpertuna/vim-header',
        event = 'CmdlineEnter',
        config = function()
            vim.g.header_auto_add_header = 0
            vim.g.header_field_author = 'zhangzhao'
            vim.g.header_field_author_email = 'zhangzhao@ihep.ac.cn'
        end
    },

    -- others

    {
        'farmergreg/vim-lastplace',
        lazy = false
    },

    {
        'romainl/vim-cool',
        event = { 'CursorMoved', 'InsertEnter' },
    },

    -- markdown

    {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        build = 'cd app && yarn install',
        config = function()
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_port = '8080'
            vim.g.mkdp_open_to_the_world = 1
            vim.g.mkdp_theme = 'light'
        end
    },

}
