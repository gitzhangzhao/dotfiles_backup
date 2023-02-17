local M = {}

local C = require("catppuccin.palettes").get_palette()
local lsp = require "feline.providers.lsp"

local assets = {
    left_separator = "",
    right_separator = "",
    mode_icon = "",
    dir = "",
    file = "",
    lsp = {
        server = "",
        error = "",
        warning = "",
        info = "",
        hint = "",
    },
    git = {
        branch = "",
        added = "",
        changed = "",
        removed = "",
    },
}

if require("catppuccin").options.transparent_background then C.surface0 = "NONE" end

local mode_colors = {
    ["n"] = { "NORMAL", C.lavender },
    ["no"] = { "N-PENDING", C.lavender },
    ["i"] = { "INSERT", C.green },
    ["ic"] = { "INSERT", C.green },
    ["t"] = { "TERMINAL", C.green },
    ["v"] = { "VISUAL", C.flamingo },
    ["V"] = { "V-LINE", C.flamingo },
    [""] = { "V-BLOCK", C.flamingo },
    ["R"] = { "REPLACE", C.maroon },
    ["Rv"] = { "V-REPLACE", C.maroon },
    ["s"] = { "SELECT", C.maroon },
    ["S"] = { "S-LINE", C.maroon },
    [""] = { "S-BLOCK", C.maroon },
    ["c"] = { "COMMAND", C.peach },
    ["cv"] = { "COMMAND", C.peach },
    ["ce"] = { "COMMAND", C.peach },
    ["r"] = { "PROMPT", C.teal },
    ["rm"] = { "MORE", C.teal },
    ["r?"] = { "CONFIRM", C.mauve },
    ["!"] = { "SHELL", C.green },
}

function M.setup(opts)
    if opts then
        opts.assets = opts.assets or {}
        opts.sett = opts.sett or {}
        opts.mode_colors = opts.mode_colors or {}
    else
        opts = {}
    end
    assets = vim.tbl_deep_extend("force", assets, opts.assets)
    sett = vim.tbl_deep_extend("force", sett, opts.sett)
    mode_colors = vim.tbl_deep_extend("force", mode_colors, opts.mode_colors)
end

-- current function
vim.cmd [[
function! NearestMethodOrFunction() abort
return get(b:, 'vista_nearest_method_or_function', '')
endfunction
" set statusline+=%{NearestMethodOrFunction()}
autocmd User CocStatusChange call vista#RunForNearestMethodOrFunction()
]]

function M.get()
    local shortline = false

    local components = {
        active = { {}, {}, {} }, -- left, center, right
        inactive = { {} },
    }

    local function is_enabled(min_width)
        if shortline then return true end

        return vim.api.nvim_win_get_width(0) > min_width
    end

    -- -- helpers
    -- local function any_git_changes()
    --     local gst = vim.b.gitsigns_status_dict -- git stats
    --     if gst then
    --         if
    --             gst["added"] and gst["added"] > 0
    --             or gst["removed"] and gst["removed"] > 0
    --             or gst["changed"] and gst["changed"] > 0
    --             then
    --                 return true
    --             end
    --         end
    --         return false
    --     end

    local function any_git_changes()
        local gst = vim.b.gitsigns_status_dict -- git stats
        if gst then
            if gst["head"] == "" then
                return false
            else
                return true
            end
            return false
        end
    end


        -- #################### STATUSLINE ->

        -- ######## Left

        -- Current vi mode ------>
        local vi_mode_hl = function()
            return {
                fg = C.surface0,
                bg = mode_colors[vim.fn.mode()][2],
                style = "bold",
            }
        end

        components.active[1][1] = {
            provider = assets.left_separator,
            hl = function()
                return {
                    fg = mode_colors[vim.fn.mode()][2],
                    bg = C.surface0,
                }
            end,
        }

        components.active[1][2] = {
            provider = assets.mode_icon .. " ",
            hl = function()
                return {
                    fg = C.surface0,
                    bg = mode_colors[vim.fn.mode()][2],
                }
            end,
        }

        components.active[1][3] = {
            provider = function() return mode_colors[vim.fn.mode()][1] end,
            hl = vi_mode_hl,
        }

        -- enable if git diffs are available
        components.active[1][4] = {
            provider = assets.right_separator,
            hl = function()
                return {
                    fg = mode_colors[vim.fn.mode()][2],
                    bg = C.mauve,
                }
            end,
            enabled = function() return any_git_changes() end,
        }

        -- -- enable if git diffs are not available
        components.active[1][5] = {
            provider = assets.right_separator,
            hl = function()
                return {
                    fg = mode_colors[vim.fn.mode()][2],
                    bg = C.surface0
                }
            end,
            enabled = function() return not any_git_changes() end,
        }

        components.active[1][6] = {
            provider = "git_branch",
            hl = {
                fg = C.surface0,
                bg = C.mauve,
            },
            icon = " " .. assets.git.branch .. " ",
            right_sep = {
                str = assets.right_separator,
                hl = {
                    fg = C.mauve,
                    bg = C.surface0,
                },
            },
        }

        components.active[1][7] = {
            provider = function()
                local func = vim.fn.NearestMethodOrFunction()
                if func ~= "" then
                    return string.format("   " .. func)
                else
                    return ""
                end
            end,
            hl = {
                fg = C.overlay2,
                bg = C.surface0,
            },

        }

        components.active[3][1] = {
            provider = function()
                local filename = vim.fn.expand "%:t"
                local extension = vim.fn.expand "%:e"
                local present, icons = pcall(require, "nvim-web-devicons")
                local icon = present and icons.get_icon(filename, extension) or assets.file
                return (false and "%m" or "") .. "" .. icon .. " " .. filename .. " "
            end,
            enabled = is_enabled(70),
            hl = {
                fg = C.surface0,
                bg = C.maroon,
            },
            left_sep = {
                str = assets.left_separator,
                hl = {
                    fg = C.maroon,
                    bg = C.surface0,
                },
            },
        }

        components.active[3][2] = {
            provider = "position",
            hl = {
                fg = C.surface0,
                bg = C.peach
            },
            left_sep = {
                str = assets.left_separator,
                hl = {
                    fg = C.peach,
                    bg = C.maroon,
                },
            },
        }

        components.active[3][3] = {
            provider = " ",
            hl = {
                fg = C.surface0,
                bg = C.peach
            },

        }

        components.active[3][4] = {
            provider = function()
                local current_line = vim.fn.line "."
                local total_line = vim.fn.line "$"

                if current_line == 1 then
                    return "Top" .. " "
                elseif current_line == vim.fn.line "$" then
                    return "Bot" .. " "
                end
                local result, _ = math.modf((current_line / total_line) * 100)
                return result .. "%%"
            end,
            hl = {
                fg = C.surface0,
                bg = C.flamingo,
            },
            left_sep = {
                str = assets.left_separator,
                hl = {
                    fg = C.flamingo,
                    bg = C.peach,
                },
            },
            right_sep = {
                str = assets.right_separator,
                hl = {
                    fg = C.flamingo,
                    bg = C.surface0,
                },
            },

        }

        components.inactive[1][1] = {
            provider = function() return " " .. string.upper(vim.bo.ft) .. " " end,
            hl = {
                fg = C.overlay2,
                bg = C.mantle,
            },
        }

        return components
    end

    return M
