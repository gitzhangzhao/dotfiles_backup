return {
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
}
