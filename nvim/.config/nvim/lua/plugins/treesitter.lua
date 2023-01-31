return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
        'andymass/vim-matchup'
    },
    build = ':TSUpdate',
    config = function()
        require'nvim-treesitter.configs'.setup {
            -- 安装 language parser
            -- :TSInstallInfo 命令查看支持的语言
            ensure_installed = {"vim", "c", "make", "markdown", "json", "diff", "cpp", "bash", "verilog", "latex"},
            -- 启用代码高亮功能
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
                -- 启用增量选择
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
            }
        }
    end
}


