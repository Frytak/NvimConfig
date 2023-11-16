return {
    'linrongbin16/lsp-progress.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local max_message_size = 40

        require('lsp-progress').setup({
            --- Format series message.
            ---
            --- By default it looks like: `formatting isort (100%) - done`.
            ---
            --- @param title string?
            ---     Message title.
            --- @param message string?
            ---     Message body.
            --- @param percentage integer?
            ---     Progress in percentage numbers: 0-100.
            --- @param done boolean
            ---     Indicate whether this series is the last one in progress.
            --- @return SeriesFormatResult
            ---     The returned value will be passed to function `client_format` as
            ---     one of the `series_messages` array, or ignored if return nil.
            series_format = function(title, message, percentage, done)
                local builder = {}
                local has_title = false
                local has_message = false
                if type(title) == "string" and string.len(title) > 0 then
                    local escaped_title = title:gsub("%%", "%%%%")
                    table.insert(builder, escaped_title)
                    has_title = true
                end
                if type(message) == "string" and string.len(message) > 0 then
                    local escaped_message = message:gsub("%%", "%%%%")
                    table.insert(builder, escaped_message)
                    has_message = true
                end
                if percentage and (has_title or has_message) then
                    table.insert(builder, string.format("(%.0f%%%%)", percentage))
                end
                if done and (has_title or has_message) then
                    table.insert(builder, "- done")
                end
                return table.concat(builder, " ")
            end,

            --- Format client message.
            ---
            --- By default it looks like:
            --- `[null-ls] ⣷ formatting isort (100%) - done, formatting black (50%)`.
            ---
            --- @param client_name string
            ---     Client name.
            --- @param spinner string
            ---     Spinner icon.
            --- @param series_messages string[]|table[]
            ---     Messages array.
            --- @return ClientFormatResult
            ---     The returned value will be passed to function `format` as one of the
            ---     `client_messages` array, or ignored if return nil.
            client_format = function(client_name, spinner, series_messages)
                local client_name = "[" .. client_name .. "]"
                return #series_messages > 0
                        and (string.gsub(table.concat(series_messages, ", "), 1, max_message_size) .. " " .. spinner .. " " .. client_name)
                    or nil
            end,

            --- Format (final) message.
            ---
            --- @param client_messages string[]|table[]
            ---     Client messages array.
            --- @return string
            ---     The returned value will be returned as the result of `progress` API.
            format = function(client_messages)
                local sign = "" -- nf-fa-gear \uf013
                if #client_messages > 0 then
                    return sign .. "" .. table.concat(client_messages, " ")
                end
                if #vim.lsp.get_active_clients() > 0 then
                    return sign
                end
                return ""
            end,
        })
    end
}
