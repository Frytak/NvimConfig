local directoryList = require('dirslist')

local M = {}

--- @return string
M.getCurrentWorkingDirectory = function()
    return vim.fn.getcwd()
end

M.getCurrentDirectory = function()
    -- Get the current directory in netrw
    local path = vim.b.netrw_curdir
    -- Concatenate them to get the full path
    -- Change all '\' to '/' for consistency
    path = string.gsub(path, '\\', '/')

    return path
end

--- @return string
M.getSelectedDirectory = function()
    -- Get the current directory in netrw
    local dir = vim.b.netrw_curdir
    -- Get the file name under the cursor
    local file = vim.fn.expand('<cfile>')
    -- Concatenate them to get the full path
    local path = dir .. '/' .. file
    -- Change all '\' to '/' for consistency
    path = string.gsub(path, '\\', '/')

    return path
end

--- @return string
M.getPreviousDirectory = function()
    -- Get the current directory in netrw
    local path = vim.b.netrw_curdir
    -- Change all '\' to '/' for consistency
    path = string.gsub(path, '\\', '/')
    -- Delete the last '/%'
    local subLen = string.len(string.match(path, '/(%w+)$'))
    path = string.sub(path, 1, string.len(path) - subLen)

    return path
end

--- @param path string
M.changeCurrentWorkingDirectory = function(path)
    vim.loop.chdir(path)
end

M.openNetrwCurrentWorkingDirectory = function()
    vim.cmd(string.format(':Ntree %s', M.getCurrentWorkingDirectory()))
end

--- @param path string
M.openNetrwDirectory = function(path)
    vim.cmd(string.format(':Ntree %s', path))
end

--- Shows the list of available directories and opens the chosen one using netrw
M.prettyChangeDirectory = function()
    local formattedDirList = ''
    local intInput
    local path

    -- Print the list of the available directories
    for i, v in ipairs(directoryList) do
        formattedDirList = formattedDirList .. string.format('  %i: %s\n', i, v.name)
    end

    -- Take the directory input
    vim.ui.input({ prompt = string.format('%sChoose from the available directories: ', formattedDirList) }, function(input)
        intInput = tonumber(input);
        if (intInput == nil) then
            print('Invalid input. Must be a number!')
            return
        end
        path = directoryList[intInput].path
    end)

    -- Whether to change the working directory
    vim.ui.input({ prompt = 'Whether to change to working directory (y/N): ' }, function(input)
        if not (input == 'N') then
            M.changeCurrentWorkingDirectory(path)
        end
    end)

    -- If invalid directory input, return
    if (intInput == nil) then return end

    -- Open directory
    M.openNetrwDirectory(path)
end

return M
