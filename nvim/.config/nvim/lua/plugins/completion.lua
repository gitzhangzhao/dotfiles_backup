return {

    {
        'neoclide/coc.nvim',
        event = {'BufReadPost', 'BufAdd', 'BufNewFile' },
        branch = 'master',
        build = 'yarn install --frozen-lockfile',
        dependencies = {
            'honza/vim-snippets'
        },
        config = function()
            -- coc plugins
            vim.g.coc_global_extensions = { 'coc-clangd', 'coc-snippets', 'coc-json', 'coc-sh', 'coc-prettier', 'coc-tabnine',
            'coc-vimlsp', 'coc-sumneko-lua' }
            local keyset = vim.keymap.set

            -- Autocomplete
            function _G.check_back_space()
                local col = vim.fn.col('.') - 1
                return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
            end

            -- Use Tab for trigger completion with characters ahead and navigate
            -- NOTE: There's always a completion item selected by default, you may want to enable
            -- no select by setting `"suggest.noselect": true` in your configuration file
            -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
            -- other plugins before putting this into your config
            -- local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
            local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
            keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
            opts)
            keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

            -- Make <CR> to accept selected completion item or notify coc.nvim to format
            -- <C-g>u breaks current undo, please make your own choice
            keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
            keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

            -- diagnostic jump
            -- Use `[g` and `]g` to navigate diagnostics
            -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
            keyset("n", 'g[', "<Plug>(coc-diagnostic-prev)", { silent = true })
            keyset("n", 'g]', "<Plug>(coc-diagnostic-next)", { silent = true })

            -- GoTo code navigation
            keyset("n", 'gd', "<Plug>(coc-definition)", { silent = true })
            keyset("n", 'gy', "<Plug>(coc-type-definition)", { silent = true })
            keyset("n", 'gi', "<Plug>(coc-implementation)", { silent = true })
            keyset("n", 'gr', "<Plug>(coc-references)", { silent = true })

            -- Hover
            -- Use D to show documentation in preview window
            function _G.show_docs()
                local cw = vim.fn.expand('<cword>')
                if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
                    vim.api.nvim_command('h ' .. cw)
                elseif vim.api.nvim_eval('coc#rpc#ready()') then
                    vim.fn.CocActionAsync('doHover')
                else
                    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
                end
            end
            keyset("n", "D", '<CMD>lua _G.show_docs()<CR>', { silent = true })
            -- do 'hover' automatically
            -- zhangzhao add: create an automatic command with a delay of 1000 ms after vim starts, in case the automatic command is executed before the LSP starts and prints an error.
            -- clangd is faster than LSP of lua. For C, 500 ms is enough.
            vim.fn.timer_start(1000, function()
                vim.api.nvim_create_autocmd({"CursorHold"},{
                    pattern = {"*.c", "*.lua"},
                    command = "lua _G.show_docs()"
                })
            end)

            -- Highlight the symbol and its references on a CursorHold event(cursor is idle)
            vim.api.nvim_create_augroup("CocGroup", {})
            vim.api.nvim_create_autocmd("CursorHold", {
                group = "CocGroup",
                command = "silent call CocActionAsync('highlight')",
                desc = "Highlight symbol under cursor on CursorHold"
            })

            -- Symbol renaming
            keyset("n", 'gn', "<Plug>(coc-rename)", { silent = true })

            -- Setup formatexpr specified filetype(s)
            vim.api.nvim_create_autocmd("FileType", {
                group = "CocGroup",
                pattern = "c,cpp,vim,lua,json,python",
                command = "setl formatexpr=CocAction('formatSelected')",
                desc = "Setup formatexpr specified filetype(s)."
            })

            -- Update signature help on jump placeholder
            vim.api.nvim_create_autocmd("User", {
                group = "CocGroup",
                pattern = "CocJumpPlaceholder",
                command = "call CocActionAsync('showSignatureHelp')",
                desc = "Update signature help on jump placeholder"
            })

            -- textobj
            local opts = { silent = true, noremap = true }
            -- Run the Code Lens actions on the current line
            -- keyset("n", 'gl', "<Plug>(coc-codelens-action)", opts)
            -- Map function and class text objects
            -- NOTE: Requires 'textDocument.documentSymbol' support from the language server
            keyset("x", 'if', "<Plug>(coc-funcobj-i)", opts)
            keyset("o", 'if', "<Plug>(coc-funcobj-i)", opts)
            keyset("x", 'af', "<Plug>(coc-funcobj-a)", opts)
            keyset("o", 'af', "<Plug>(coc-funcobj-a)", opts)
            -- Use CTRL-S for selections ranges
            -- Requires 'textDocument/selectionRange' support of language server ( this function is sama as incremental selection of treesitter, so quit it)
            -- keyset("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
            -- keyset("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })

            -- Add commands
            -- Add `:Format` command to format current buffer
            vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
            -- " Add `:Fold` command to fold current buffer
            vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
            -- Add `:OR` command for organize imports of the current buffer
            vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
            -- Add (Neo)Vim's native statusline support
            -- NOTE: Please see `:h coc-status` for integrations with external plugins that

            keyset('n', '<F5>', "call CocAction('showIncomingCalls')", opts)
            vim.cmd [[
            autocmd BufEnter * call CheckOutline()
            function! CheckOutline() abort
            if &filetype ==# 'coctree' && winnr('$') == 1
                if tabpagenr('$') != 1
                    close
                else
                    bdelete
                    endif
                    endif
                    endfunction

                    nnoremap <silent><nowait> <F5> :call ToggleOutline()<CR>
                    function! ToggleOutline() abort
                    let winid = coc#window#find('cocViewId', 'OUTLINE')
                    if winid == -1
                        call CocActionAsync('showOutline', 1)
                    else
                        call coc#window#close(winid)
                        endif
                        endfunction
                        ]]

                        -- coc-clangd
                        keyset('n', '<F12>', '<CMD>CocCommand clangd.switchSourceHeader<CR>', opts)
                    end
                },

                {
                    'gelguy/wilder.nvim',
                    event = 'CmdlineEnter',
                    config = function()
                        local wilder = require('wilder')
                        wilder.setup({
                            modes = {':', '/', '?'},
                            next_key = {'<tab>', '<Down>'},
                            previous_key = '<s-tab>'
                        })
                        wilder.set_option('renderer', wilder.popupmenu_renderer(
                        wilder.popupmenu_border_theme({
                            highlights = {
                                border = 'Normal', -- highlight to use for the border
                            },
                            -- 'single', 'double', 'rounded' or 'solid'
                            -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
                            border = 'rounded',
                            left = {' ', wilder.popupmenu_devicons()},
                            right = {' ', wilder.popupmenu_scrollbar()}
                        })
                        ))
                    end
                },

                {
                    "danymat/neogen",
                    keys = {
                        {'gs', ":lua require('neogen').generate()<CR>"},
                    },
                    dependencies = "nvim-treesitter/nvim-treesitter",
                    config = function()
                        require('neogen').setup()
                    end
                    -- Uncomment next line if you want to follow only stable versions
                    -- version = "*" 
                },

            }
