return {

    {
        "goolord/alpha-nvim",
        event = "BufWinEnter",
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                "⣿⣿⣿⡿⠛⢉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
                "⣿⣿⠋⠄⠈⠁⠄⠄⠄⠄⠄⢀⠄⠄⠄⠄⠄⠄⠄⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
                "⣿⠃⠄⠄⠄⠄⠄⠄⠄⠄⠄⣾⣷⣄⠄⠄⠄⠄⠄⠄⠄⢻⣿⣿⣿⣿⣿⣿⣿⣿ ",
                "⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣷⠄⠄⠄⠄⠄⠄⠈⣿⣿⡿⠿⠿⣿⣿⣿ ",
                "⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣻⣿⣿⣿⣿⣿⣦⠄⠄⠄⠄⠄⢹⣿⠄⢰⣤⠈⣿⣿ ",
                "⠄⠄⠄⠄⠄⠄⠄⢰⠄⣾⣿⣿⣿⣿⣿⣿⡿⢢⡇⠄⠄⠄⠈⣿⡶⠚⠉⢀⣿⣿ ",
                "⠄⠄⠄⠄⠄⠄⠄⢸⡏⢸⣿⣿⣿⣿⣿⣿⡇⠄⣿⠄⠄⠄⠄⣿⡁⢰⣿⣿⣿⣿ ",
                "⠄⠄⠄⠄⠄⠄⠄⢸⡇⠄⢿⣿⣿⣿⣿⣿⣿⠄⣿⡇⠄⠄⠄⢻⣿⣿⣿⣿⣿⣿ ",
                "⠄⠄⠄⣀⠄⠄⠄⢸⣿⠄⠸⣿⣿⣿⣿⣿⣿⣀⣿⣧⠄⠄⠄⠸⣿⣤⣿⣿⣿⣿ ",
                "⠄⠄⠄⢏⡀⠄⠄⢸⣿⣷⣴⣿⣿⣿⣿⣿⣿⣿⣿⣹⠄⠄⢀⠄⢻⣿⣿⣿⣿⣿ ",
                "⡀⠄⣤⡈⠓⠄⠄⠘⣿⣿⣿⣿⣿⣿⡿⢿⣿⣿⡿⠃⠄⠄⢸⣧⠄⢻⣿⣿⣿⣿ ",
                "⣷⣤⣿⣿⣿⡆⠄⠄⠄⢈⠉⠛⠛⠓⠒⠛⠋⠁⣤⡞⠄⠄⣾⣿⣷⣄⠙⣿⣿⣿ ",
                "⣿⣿⣿⣿⣿⠿⠄⠄⢰⢸⣆⠲⣦⣄⡀⣠⣿⣤⣌⠃⠄⢠⣿⣿⣿⣿⣿⣿⣿⣿ ",
                "⣿⣿⣿⠟⠁⠄⠄⢆⠄⠈⣿⣿⣾⢏⡱⣿⡏⣿⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⣿ ",
                "⣿⣿⠃⠄⠄⠄⠄⠄⠄⠄⢈⣋⣵⣿⣿⣶⡾⠟⠁⠄⠄⠄⠄⢻⣿⣿⣿⣿⣿⣿",
            }
            dashboard.section.buttons.val = {
                dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files <CR>"),
                dashboard.button("t", " " .. " Find text", "<cmd>Telescope live_grep <CR>"),
                dashboard.button("r", " " .. " Recent files", "<cmd>Telescope oldfiles <CR>"),
                dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            -- local function footer()
                -- 	return "~wahid@orbit~"
                -- end
                --
                -- dashboard.section.footer.val = footer()
                --
                dashboard.section.footer.opts.hl = "Type"
                dashboard.section.header.opts.hl = "Include"
                dashboard.section.buttons.opts.hl = "Keyword"
                dashboard.opts.opts.noautocmd = true
                alpha.setup(dashboard.opts)
                vim.api.nvim_create_autocmd("User", {
                    pattern = "LazyVimStarted",
                    callback = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        dashboard.section.footer.val = "⚡loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                        pcall(vim.cmd.AlphaRedraw)
                    end,
                })
            end
        },

        {
            'lewis6991/gitsigns.nvim',
            event = 'VeryLazy',
            config = function()
                require('gitsigns').setup {
                    signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
                    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                    watch_gitdir                 = {
                        interval = 1000,
                        follow_files = true
                    },
                    attach_to_untracked          = true,
                    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                    current_line_blame_opts      = {
                        virt_text = true,
                        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                        delay = 1000,
                        ignore_whitespace = false,
                    },
                    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                    sign_priority                = 6,
                    update_debounce              = 100,
                    status_formatter             = nil, -- Use default
                    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
                    preview_config               = {
                        -- Options passed to nvim_open_win
                        border = 'single',
                        style = 'minimal',
                        relative = 'cursor',
                        row = 0,
                        col = 1
                    },
                    yadm                         = {
                        enable = false
                    },

                    on_attach = function(bufnr)
                        local gs = package.loaded.gitsigns

                        local function map(mode, l, r, opts)
                            opts = opts or {}
                            opts.buffer = bufnr
                            vim.keymap.set(mode, l, r, opts)
                        end

                        -- Actions
                        map('n', 'gp', gs.preview_hunk)
                        map('n', 'gb', gs.toggle_current_line_blame)

                        -- Text object
                        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                    end
                }
            end
        },

        {
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufReadPost',
            config = function()
                -- vim.cmd [[highlight IndentBlanklineContextStart guifg=#C678DD gui=underline]]
                -- vim.cmd [[highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine]]
                require("indent_blankline").setup({
                    space_char_blankline = " ",
                    show_first_indent_level = false,
                    show_current_context = true,
                    --	show_current_context_start = true,
                    use_treesitter_scope = true
                })
            end
        },

        {
            'petertriho/nvim-scrollbar',
            event = 'BufReadPre',
            dependencies = {'kevinhwang91/nvim-hlslens'},
            config = function()
                require("scrollbar").setup({
                    show = true,
                    show_in_active_only = false,
                    set_highlights = true,
                    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
                    max_lines = false, -- disables if no. of lines in buffer exceeds this
                    hide_if_all_visible = false, -- Hides everything if all lines are visible
                    throttle_ms = 100,
                    handle = {
                        text = " ",
                        color = nil,
                        color_nr = nil, -- cterm
                        highlight = "CursorColumn",
                        hide_if_all_visible = true, -- Hides handle if all lines are visible
                    },
                    marks = {
                        Cursor = {
                            text = "•",
                            priority = 0,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "Normal",
                        },
                        Search = {
                            text = { "-", "=" },
                            priority = 1,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "Search",
                        },
                        Error = {
                            text = { "-", "=" },
                            priority = 2,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "DiagnosticVirtualTextError",
                        },
                        Warn = {
                            text = { "-", "=" },
                            priority = 3,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "DiagnosticVirtualTextWarn",
                        },
                        Info = {
                            text = { "-", "=" },
                            priority = 4,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "DiagnosticVirtualTextInfo",
                        },
                        Hint = {
                            text = { "-", "=" },
                            priority = 5,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "DiagnosticVirtualTextHint",
                        },
                        Misc = {
                            text = { "-", "=" },
                            priority = 6,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "Normal",
                        },
                        GitAdd = {
                            text = "┆",
                            priority = 7,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "GitSignsAdd",
                        },
                        GitChange = {
                            text = "┆",
                            priority = 7,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "GitSignsChange",
                        },
                        GitDelete = {
                            text = "▁",
                            priority = 7,
                            gui=nil,
                            color = nil,
                            cterm=nil,
                            color_nr = nil, -- cterm
                            highlight = "GitSignsDelete",
                        },
                    },
                    excluded_buftypes = {
                        "terminal",
                    },
                    excluded_filetypes = {
                        "prompt",
                        "TelescopePrompt",
                        "noice",
                    },
                    autocmd = {
                        render = {
                            "BufWinEnter",
                            "TabEnter",
                            "TermEnter",
                            "WinEnter",
                            "CmdwinLeave",
                            "TextChanged",
                            "VimResized",
                            "WinScrolled",
                        },
                        clear = {
                            "BufWinLeave",
                            "TabLeave",
                            "TermLeave",
                            "WinLeave",
                        },
                    },
                    handlers = {
                        cursor = true,
                        diagnostic = true,
                        gitsigns = true, -- Requires gitsigns
                        handle = true,
                        search = true, -- Requires hlslens
                        ale = false, -- Requires ALE
                    },
                })
                require('scrollbar.handlers.gitsigns').setup()
            end
        },

        {
            'kevinhwang91/nvim-hlslens',
            config = true
        },

        {
            'danilamihailov/beacon.nvim',
            event = 'BufReadPost',
            config = function()
                vim.cmd [[highlight Beacon guibg=pink]]
                vim.g.beacon_size = 200
                vim.g.beacon_shrink = 0
            end

        },

        {
            "feline-nvim/feline.nvim",
            event = 'BufReadPre',
            dependencies = 'nvim-tree/nvim-web-devicons',
            config = function()
                require("feline").setup {
                    components = require("config.statusline").get(),
                }
            end,
        },

    }
