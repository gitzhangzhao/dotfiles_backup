return {

    {
        "nvim-telescope/telescope.nvim",
        -- event = "BufReadPre",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<c-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find files" } },
            { "<c-g>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" },
        },
        cmd = { "Telescope", "Tel" },
        opts = function()
            local actions = require("telescope.actions")
            -- local theme = require("telescope.themes")
            return {
                pickers = {
                    find_files = { hidden = false },
                    live_grep = {
                        additional_args = function(opts)
                            return { "--hidden" }
                        end,
                    },
                },
                defaults = {
                    file_ignore_patterns = {
                        "%.jpg",
                        "%.jpeg",
                        "%.webp",
                        "%.png",
                        "%.gif",
                        "%.otf",
                        "%.ttf",
                        "node_modules",
                    },
                    prompt_prefix = "   ",
                    selection_caret = "  ",
                    entry_prefix = "  ",
                    selection_strategy = "reset",
                    layout_strategy = "horizontal",
                },
            }
        end,
    },

    {
        'voldikss/vim-translator',
        keys = {{'gt', '<Plug>TranslateW'}, {'gt','<Plug>TranslateWV', mode = 'x'}},
        config = function()
            vim.g.translator_window_max_width = 0.9
            vim.g.translator_window_max_height = 0.9
        end
    },

    {
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        build = 'cd app && yarn install',
        init = function()
            vim.g.mkdp_auto_start = 1
        end,
        config = function()
            vim.g.mkdp_port = '8080'
            vim.g.mkdp_open_to_the_world = 1
            vim.g.mkdp_theme = 'light'
        end
    },

}
