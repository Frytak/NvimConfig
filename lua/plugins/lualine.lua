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
    config = function ()
        local colors = require('colorscheme')

        require('lualine').setup({
            options = {
                theme = {
                    normal = colors.lualine.mode.normal,
                    visual = colors.lualine.mode.visual,
                    insert = colors.lualine.mode.insert,
                    replace = colors.lualine.mode.replace,
                    terminal = colors.lualine.mode.terminal,
                    command = colors.lualine.mode.terminal,
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
                    'diagnostics'
                },
                lualine_x = { 'diff' },
                lualine_y = { 'filetype' },
                lualine_z = { 'progress', 'location' },
            }
        })
    end
}
