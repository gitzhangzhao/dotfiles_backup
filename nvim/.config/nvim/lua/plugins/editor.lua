return {

    {
        'numToStr/Comment.nvim',
        keys = { 'gcc', {'gc', mode = 'x'}, 'gbc', {'gb', mode = 'x'}},
        config = true
    },

    {
        'RRethy/vim-illuminate',
        event = 'BufReadPost',
        config = function()
            -- default configuration
            require('illuminate').configure({
                -- providers: provider used to get references in the buffer, ordered by priority
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                -- delay: delay in milliseconds
                delay = 0,
                -- filetype_overrides: filetype specific overrides.
                -- The keys are strings to represent the filetype while the values are tables that
                -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
                filetype_overrides = {},
                -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
                filetypes_denylist = {
                    'dirvish',
                    'fugitive',
                },
                -- filetypes_allowlist: filetypes to illuminate, this is overriden by filetypes_denylist
                filetypes_allowlist = {},
                -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
                -- See `:help mode()` for possible values
                modes_denylist = {},
                -- modes_allowlist: modes to illuminate, this is overriden by modes_denylist
                -- See `:help mode()` for possible values
                modes_allowlist = {},
                -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
                -- Only applies to the 'regex' provider
                -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                providers_regex_syntax_denylist = {},
                -- providers_regex_syntax_allowlist: syntax to illuminate, this is overriden by providers_regex_syntax_denylist
                -- Only applies to the 'regex' provider
                -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                providers_regex_syntax_allowlist = {},
                -- under_cursor: whether or not to illuminate under the cursor
                under_cursor = true,
                -- large_file_cutoff: number of lines at which to use large_file_config
                -- The `under_cursor` option is disabled when this cutoff is hit
                large_file_cutoff = nil,
                -- large_file_config: config to use for large files (based on large_file_cutoff).
                -- Supports the same keys passed to .configure
                -- If nil, vim-illuminate will be disabled for large files.
                large_file_overrides = nil,
                -- min_count_to_highlight: minimum number of matches required to perform highlighting
                min_count_to_highlight = 1,
            })
        end
    },

    {
        'karb94/neoscroll.nvim',
        keys = {'<C-k>', '<C-j>', 'zt', 'zz', 'zb', {'<C-j>', mode = 'x'}, {'<C-k>', mode = 'x'}},
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = {'<C-k>', '<C-j>', 'zt', 'zz', 'zb'},
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,             -- Function to run after the scrolling animation ends
                performance_mode = false,    -- Disable "Performance Mode" on all buffers.
            })
            local t = {}
            -- Syntax: t[keys] = {function, {function arguments}}
            t['<C-k>'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
            t['<C-j>'] = {'scroll', { 'vim.wo.scroll', 'true', '250'}}
            t['zt']    = {'zt', {'250'}}
            t['zz']    = {'zz', {'250'}}
            t['zb']    = {'zb', {'250'}}

            require('neoscroll.config').set_mappings(t)
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = {"vim", "lua", "c", "make", "markdown", "json", "diff", "cpp", "bash", "verilog", "latex" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<CR>',
                        node_incremental = '<CR>',
                        node_decremental = '<BS>',
                        scope_incremental = '<TAB>',
                    }
                },
                matchup = {
                    enable = true
                },
                textobjects = {
                    swap = {
                        enable = true,
                        swap_next = {
                            ["cx"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["cX"] = "@parameter.inner",
                        },
                    },
                },
            }
        end
    },

    {
        'andymass/vim-matchup',
        event = 'BufReadPost',
        config = function()
            vim.g.matchup_matchparen_offscreen = {}
        end

    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        event = 'BufReadPre',
        config = true
    },

    --  close this plugin to avoid the bug of #47
    -- {
    --     'kevinhwang91/nvim-ufo',
    --     -- event = 'BufRead',
    --     lazy = false,
    --     dependencies = 'kevinhwang91/promise-async',
    --     config = function()
    --         local handler = function(virtText, lnum, endLnum, width, truncate)
    --             local newVirtText = {}
    --             local suffix = ('  %d '):format(endLnum - lnum)
    --             local sufWidth = vim.fn.strdisplaywidth(suffix)
    --             local targetWidth = width - sufWidth
    --             local curWidth = 0
    --             for _, chunk in ipairs(virtText) do
    --                 local chunkText = chunk[1]
    --                 local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    --                 if targetWidth > curWidth + chunkWidth then
    --                     table.insert(newVirtText, chunk)
    --                 else
    --                     chunkText = truncate(chunkText, targetWidth - curWidth)
    --                     local hlGroup = chunk[2]
    --                     table.insert(newVirtText, {chunkText, hlGroup})
    --                     chunkWidth = vim.fn.strdisplaywidth(chunkText)
    --                     -- str width returned from truncate() may less than 2nd argument, need padding
    --                     if curWidth + chunkWidth < targetWidth then
    --                         suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
    --                     end
    --                     break
    --                 end
    --                 curWidth = curWidth + chunkWidth
    --             end
    --             table.insert(newVirtText, {suffix, 'MoreMsg'})
    --             return newVirtText
    --         end
    --         -- global handler
    --         -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
    --         -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
    --         require('ufo').setup({
    --             fold_virt_text_handler = handler
    --         })
    --     end
    -- },

    {
        'anuvyklack/pretty-fold.nvim',
        event = 'VeryLazy',
        config = function()
            require('pretty-fold').setup({
                sections = {
                    left = {
                        'content', ' ', '',
                    },
                    right = {
                        ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
                        function(config) return config.fill_char:rep(2) end
                    }
                },
                fill_char = ' ',
                remove_fold_markers = true,
                -- Keep the indentation of the content of the fold string.
                keep_indentation = true,
                -- Possible values:
                -- "delete" : Delete all comment signs from the fold string.
                -- "spaces" : Replace all comment signs with equal number of spaces.
                -- false    : Do nothing with comment signs.
                process_comment_signs = 'spaces',
                -- Comment signs additional to the value of `&commentstring` option.
                comment_signs = {},
                -- List of patterns that will be removed from content foldtext section.
                stop_words = {
                    '@brief%s*', -- (for C++) Remove '@brief' and all spaces after.
                },
                    add_close_pattern = true, -- true, 'last_line' or false
                    matchup_patterns = {
                        {  '{', '}' },
                        { '%(', ')' }, -- % to escape lua pattern char
                        { '%[', ']' }, -- % to escape lua pattern char
                    },
                    ft_ignore = { 'neorg' },
            })
        end
    },

    {
        'phaazon/hop.nvim',
        branch = 'v2',
        keys = 'f',
        config = function()
            require('hop').setup{keys = "etovxqpdygfblzhckisuran"}
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end
            map("n", "fj",  ":HopWordAC<cr>", {silent = true})
            map("n", "fk",  ":HopWordBC<cr>", {silent = true})
            map("n", "fl", ":HopWordCurrentLineAC<cr>", {silent = true})
            map("n", "fh", ":HopWordCurrentLineBC<cr>", {silent = true})
        end
    },

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
            vmap ) S)
            vmap ( S)
            vmap } S}
            vmap { S}
            ]]
        end
    },

    {
        'nat-418/boole.nvim',
        keys = { '<c-a>', '<c-x>' },
        config = function()
            require('boole').setup({
                mappings = {
                    increment = '<C-a>',
                    decrement = '<C-x>'
                },
                -- User defined loops
                additions = {
                    {'Foo', 'Bar'},
                    {'tic', 'tac', 'toe'}
                },
                allow_caps_additions = {
                    {'enable', 'disable'}
                    -- enable → disable
                    -- Enable → Disable
                    -- ENABLE → DISABLE
                }
            })
        end
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
        event = {'BufReadPre','BufNewFile'},
        config = function()
            vim.g.numbers_exclude ={'gundo', 'minibufexpl', 'cocViewId', 'OUTLINE', 'CocTree', 'CocTree1'}
        end
    },

    {
        'alpertuna/vim-header',
        event = 'CmdlineEnter',
        config = function()
            vim.g.header_auto_add_header = 0
            vim.g.header_field_author = 'zhangzhao'
            vim.g.header_field_author_email = 'zhangzhao@ihep.ac.cn'
        end
    },

    {
        'romainl/vim-cool',
        event = { 'CursorMoved', 'InsertEnter' },
    },

    {
        'kana/vim-textobj-user',
        event = 'VeryLazy',
        dependencies = {
            {'glts/vim-textobj-comment'},
            {'kana/vim-textobj-line'},
            {'tommcdo/vim-exchange'},
            {'sgur/vim-textobj-parameter'}
        }
    },

    {
        'gbprod/yanky.nvim',
        keys = {'p','P','y'},
        config = function()
            local opts = { noremap = true, silent = true }
            vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)", opts)
            vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)", opts)
            vim.keymap.set("n", "<s-w>", "<Plug>(YankyCycleForward)", opts)
            vim.keymap.set("n", "<s-q>", "<Plug>(YankyCycleBackward)", opts)
            require('yanky').setup()
        end
    },

    {
        'fedepujol/move.nvim',
        keys = {'K', 'J', {'K', mode = 'x'}, {'J', mode = 'x'}, {'HH', mode = 'x'}, {'LL', mode = 'x'}},
        config = function()
            local opts = { noremap = true, silent = true }
            -- Normal-mode commands
            vim.keymap.set('n', 'J', ':MoveLine(1)<CR>', opts)
            vim.keymap.set('n', 'K', ':MoveLine(-1)<CR>', opts)

            -- Visual-mode commands
            vim.keymap.set('x', 'J', ':MoveBlock(1)<CR>', opts)
            vim.keymap.set('x', 'K', ':MoveBlock(-1)<CR>', opts)
            vim.keymap.set('x', 'HH', ':MoveHBlock(-1)<CR>', opts)
            vim.keymap.set('x', 'LL', ':MoveHBlock(1)<CR>', opts)
        end
    },

    {
        'lambdalisue/suda.vim',
        lazy = false,
        init = function()
            vim.g.suda_smart_edit = 1
        end
    },

    {
        'mawkler/modicator.nvim',
        init = function()
            -- These are required for Modicator to work
            vim.o.cursorline = true
            vim.o.number = true
            vim.o.termguicolors = true
        end,
        config = function()
            require('modicator').setup({
                -- ...
            })
        end,
    }

}
