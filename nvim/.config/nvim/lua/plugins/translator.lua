return {
    'voldikss/vim-translator',
    keys = {{'gt', '<Plug>TranslateW'}, {'gt','<Plug>TranslateWV', mode = 'x'}},
    config = function()
        vim.g.translator_window_max_width = 0.9
        vim.g.translator_window_max_height = 0.9
    end
}

