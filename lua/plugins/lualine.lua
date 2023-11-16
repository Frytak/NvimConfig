local function toBool(number)
    if number == 1 then
        return true
    else
        return false
    end
end

return {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    dependencies = { 'linrongbin16/lsp-progress.nvim' },
    config = function ()
        local theme = require('theme/settings')

        require('lualine').setup({
            options = {
                theme = {
                    normal = theme.lualine.mode.normal,
                    visual = theme.lualine.mode.visual,
                    insert = theme.lualine.mode.insert,
                    replace = theme.lualine.mode.replace,
                    terminal = theme.lualine.mode.terminal,
                    command = theme.lualine.mode.terminal,
                },

                component_separators = {
                    a = nil,
                    b = nil,
                    c = nil,
                    x = nil,
                    y = nil,
                    z = nil,
                },
            },

            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = {
                    {
                        'searchcount',
                        cond = function() return toBool(vim.v.hlsearch) end,

                        ---@param component string
                        fmt = function(component)
                            return string.format('Found: %s', component)
                        end
                    },
                    'diagnostics',
                },
                lualine_x = {
                    require('lsp-progress').progress,
                    {
                        'diff',
                        colored = true,
                        diff_color = {
                            added = { fg = theme.diff.added.fg },
                            modified = { fg = theme.diff.modified.fg },
                            removed = { fg = theme.diff.removed.fg },
                        },
                        symbols = {
                            added = theme.diff.added.icon,
                            modified = theme.diff.added.icon,
                            removed = theme.diff.added.icon
                        },
                    }
                },
                lualine_y = { { 'filetype', colored = false } },
                lualine_z = { 'progress', 'location' },
            }
        })

        -- listen lsp-progress event and refresh lualine
        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = "lualine_augroup",
            pattern = "LspProgressStatusUpdated",
            callback = require("lualine").refresh,
        })
    end
}
