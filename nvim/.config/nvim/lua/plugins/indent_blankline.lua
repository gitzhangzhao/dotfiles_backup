vim.cmd [[highlight IndentBlanklineContextStart guifg=#C678DD gui=underline]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#C678DD gui=nocombine]]
require("indent_blankline").setup {
	space_char_blankline = " ",
    show_first_indent_level = false,
    show_current_context = true,
--	show_current_context_start = true,
	use_treesitter_scope = true
}
