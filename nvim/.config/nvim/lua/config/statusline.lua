local modes = {
    ["n"] = " ",
    ["no"] = " ",
    ["nov"] = " ",
    ["noV"] = " ",
    ["no"] = " ",
    ["niI"] = " ",
    ["niR"] = " ",
    ["niV"] = " ",

    ["i"] = " ",
    ["ic"] = " ",
    ["ix"] = " ",
    ["s"] = " ",
    ["S"] = " ",

    ["v"] = " ",
    ["V"] = " ",
    [""] = " ",
    ["r"] = "﯒ ",
    ["r?"] = " ",
    ["c"] = " ",
    ["t"] = " ",
    ["!"] = " ",
    ["R"] = " ",
}

local status = {
    ["func"] = "",
}

local icons = {
    ["typescript"] = " ",
    ["python"] = " ",
    ["java"] = " ",
    ["html"] = " ",
    ["css"] = " ",
    ["scss"] = " ",
    ["javascript"] = " ",
    ["javascriptreact"] = " ",
    ["markdown"] = " ",
    ["sh"] = " ",
    ["zsh"] = " ",
    ["vim"] = " ",
    ["rust"] = " ",
    ["cpp"] = " ",
    ["c"] = " ",
    ["go"] = " ",
    ["lua"] = " ",
    ["conf"] = " ",
    ["haskel"] = " ",
    ["ruby"] = " ",
    ["txt"] = " ",
}

local function color()
    local mode = vim.api.nvim_get_mode().mode
    local mode_color = "%#StatusLine#"
    if mode == "n" then
        mode_color = "%#StatusNormal#"
    elseif mode == "i" or mode == "ic" then
        mode_color = "%#StatusInsert#"
    elseif mode == "v" or mode == "V" or mode == "" then
        mode_color = "%#StatusVisual#"
    elseif mode == "R" then
        mode_color = "%#StatusReplace#"
    elseif mode == "c" then
        mode_color = "%#StatusCommand#"
    elseif mode == "t" then
        mode_color = "%#StatusTerminal#"
    end
    return mode_color
end

local function branch()
    local cmd = io.popen("git branch --show-current 2>/dev/null")
    local branch = cmd:read("*l") or cmd:read("*a")
    cmd:close()
    if branch ~= "" then
        return string.format("   " .. branch)
    else
        return ""
    end
end

vim.cmd [[
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
" set statusline+=%{NearestMethodOrFunction()}
autocmd User CocStatusChange call vista#RunForNearestMethodOrFunction()
]]

local function current_func()
    local func = vim.fn.NearestMethodOrFunction()
    if func ~= "" then
        return string.format("   " .. func)
    else
        return ""
    end
end

-- StatusLine Modes
Status = function()
    return table.concat({
        color(), -- mode colors
        string.format(" %s", modes[vim.api.nvim_get_mode().mode]):upper(), -- mode
        "%#StatusActive#", -- middle color
        branch(),
        current_func(),
        "%=", -- right align
        string.format("%s", (icons[vim.bo.filetype] or "")),
        "%f",
        color(), -- mode colors
        "  %l:%c ", -- line, column
    })
end

-- Execute statusline
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
    pattern = "*",
    command = "setlocal statusline=%!v:lua.Status()",
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
    pattern = "*",
    command = "setlocal statusline=%#StatusLine#",
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "WinEnter", "BufEnter", "FileType" }, {
    pattern = { "NvimTree*", "terminal" },
    command = "setlocal statusline=%#StatusNormal#",
})
