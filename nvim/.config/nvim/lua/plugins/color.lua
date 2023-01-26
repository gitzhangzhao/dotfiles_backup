-- color
vim.opt.termguicolors = true

-- cursor
vim.cmd [[
au VimEnter * set guicursor= | call chansend(v:stderr, "\x1b[ q")
au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
au WinLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
]]

-- themes settings
-- everforest
vim.g.everforest_backgroud                 = 'soft'
vim.g.everforest_sign_column_background    = 'none'
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_line_highlight = 1
vim.g.everforest_current_word              = 'underline'
vim.g.everforest_ui_contrast               = 'low'
vim.g.everforest_better_performance        = 1
vim.g.everforest_enable_italic             = 1
vim.g.everforest_show_eob                  = 0
