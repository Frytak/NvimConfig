local directoryList = require('dirslist')

--- Various utilities for working with directories (supports netrw).
local WorkingDirs = {}

--- Get the current working directory
---
--- @return string path
WorkingDirs.getCurrentWorkingDirectory = function()
    return vim.fn.getcwd()
end

--- Gets the current directory.
---
--- If the user is not in netrw or current directory of netrw is
--- nil for some other reason the function will return nil.
---
--- @return string|nil path
WorkingDirs.getCurrentNetrwDirectory = function()
    -- Get the current directory in netrw
    local dir = vim.b.netrw_curdir
    if (dir) then return nil end

    -- Change all '\' to '/' for consistency
    dir = string.gsub(dir, '\\', '/')

    return dir
end

--- Get the current directory under the cursor.
--- 
--- If the user is not in netrw, current directory of netrw is
--- nil for some other reason or the file under the cursor is
--- incorrect/nil the function will return nil.
---
--- @return string|nil path
WorkingDirs.getSelectedDirectory = function()
    -- Get the current directory in netrw
    local dir = vim.b.netrw_curdir
    if (dir) then return nil end

    -- Get the file name under the cursor
    local file = vim.fn.expand('<cfile>')
    if (file) then return nil end

    -- Concatenate them to get the full path
    dir = dir .. '/' .. file

    -- Change all '\' to '/' for consistency
    dir = string.gsub(dir, '\\', '/')

    return dir
end

--- Get the previous directory.
---
--- If the user is not in netrw or current directory of netrw is
--- nil for some other reason the function will return nil.
---
--- @return string|nil path
WorkingDirs.getPreviousDirectory = function()
    -- Get the current directory in netrw
    local dir = vim.b.netrw_curdir
    if (dir) then return nil end

    -- Change all '\' to '/' for consistency
    dir = string.gsub(dir, '\\', '/')

    -- Delete the last '/%'
    dir = string.sub(dir, 1, string.len(dir) - string.len(string.match(dir, '/(%w+)$')))

    return dir
end

--- Changes the current working directory to `path`.
---
--- @param path string
--- @return boolean success
WorkingDirs.changeCurrentWorkingDirectory = function(path)
     local success = pcall(vim.loop.chdir, path)
     return success
end

--- Opens netrw in the current working directory.
WorkingDirs.openNetrwCurrentWorkingDirectory = function()
    vim.cmd(string.format(':Ntree %s', WorkingDirs.getCurrentWorkingDirectory()))
end

--- Opens the specified directory using netrw.
--- @param path string
WorkingDirs.openNetrwDirectory = function(path)
    vim.cmd(string.format(':Ntree %s', path))
end

-- TODO: Add path parameter
--- Shows the list of available directories and opens the chosen one using netrw
WorkingDirs.prettyChangeDirectory = function()
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

        -- If invalid directory input, return
        if (intInput == nil) then return end

        path = directoryList[intInput].path
    end)

    -- If invalid directory input, return
    if (intInput == nil) then return end

    -- Whether to change the working directory
    vim.ui.input({ prompt = 'Whether to change to working directory (y/N): ' }, function(input)
        if not (input == 'N') then
            WorkingDirs.changeCurrentWorkingDirectory(path)
        end
    end)

    -- Open directory
    WorkingDirs.openNetrwDirectory(path)
end

return WorkingDirs
