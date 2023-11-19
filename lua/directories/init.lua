local lir = require('lir')
local actions = require('lir.actions')

--- Various utilities for working with directories (supports netrw).
local Directories = {}

--- Get the current working directory
---
--- @return string path
Directories.getCurrentWorkingDirectory = function()
    return vim.fn.getcwd()
end

--- Changes the current working directory to `path`.
---
--- @param path string
--- @return boolean success
Directories.changeCurrentWorkingDirectory = function(path)
     local success = pcall(vim.loop.chdir, path)
     return success
end

--- Makes the path consistent.
---   Change all '\' to '/' for
---   Delete the '/' at the end
---
--- @param path string
--- @return string path
Directories.standardizePath = function(path)
    local standardizePath, replaced = path:gsub('\\', '/')
    if (standardizePath:sub(standardizePath:len(), standardizePath:len()) == '/') then
        standardizePath = standardizePath:sub(1, standardizePath:len()-1)
    end

    return standardizePath
end

Directories.lir = {}

--- TODO
---
--- @return string|nil path
Directories.lir.getCurrentDirectory = function()
    return lir.get_context().dir
end

--- TODO
---
--- @return string|nil path
Directories.lir.getPreviousDirectory = function()
    local context = lir.get_context()
    if (not context) then return nil end

    --- @type string
    local path = Directories.standardizePath(context.dir)
    path = path:sub(1, path:len() - string.len(path:match('/%w+$')))

    print(path)
    return path
end

--- TODO
---
--- @param fullPath boolean|nil
--- @return string|nil path
Directories.lir.getDirectoryUnderCursor = function(fullPath)
    local context = lir.get_context()
    if (not context) then return nil end

    local item = context:current()

    -- Item under the cursor is not a directory
    if (not item.is_dir) then return nil end

    if (fullPath) then
        return context.dir .. item.value
    else
        return item.value
    end
end

--- TODO
---
---@param path string
Directories.lir.openDirectory = function(path)
    vim.cmd("edit " .. path)
end

Directories.netrw = {
    --- Gets the current directory.
    ---
    --- If the user is not in netrw or current directory of netrw is
    --- nil for some other reason the function will return nil.
    ---
    --- @return string|nil path
    getCurrentDirectory = function()
        -- Get the current directory in netrw
        local dir = vim.b.netrw_curdir
        if (dir == nil) then return nil end
        dir = Directories.standardizePath(dir)

        return dir
    end,

    --- Get the current directory under the cursor.
    --- 
    --- If the user is not in netrw, current directory of netrw is
    --- nil for some other reason or the file under the cursor is
    --- incorrect/nil the function will return nil.
    ---
    --- @return string|nil path
    getSelectedDirectory = function()
        -- Get the current directory in netrw
        local dir = vim.b.netrw_curdir
        if (dir == nil) then return nil end

        -- Get the file name under the cursor
        local file = vim.fn.expand('<cfile>')
        if (file == nil) then return nil end

        -- Concatenate them to get the full path
        dir = dir .. '/' .. file
        dir = Directories.standardizePath(dir)

        return dir
    end,

    --- Get the previous directory.
    ---
    --- If the user is not in netrw or current directory of netrw is
    --- nil for some other reason the function will return nil.
    ---
    --- @return string|nil path
    getPreviousDirectory = function()
        -- Get the current directory in netrw
        local dir = vim.b.netrw_curdir
        if (dir == nil) then return nil end
        dir = Directories.standardizePath(dir)

        -- Delete the last '/%'
        dir = string.sub(dir, 1, string.len(dir) - string.len(string.match(dir, '/(%w+)$')))

        return dir
    end,

    --- Opens netrw in the current working directory.
    openCurrentWorkingDirectory = function()
        vim.cmd(string.format(':Ntree %s', Directories.getCurrentWorkingDirectory()))
    end,

    --- Opens the specified directory using netrw.
    --- @param path string
    openDirectory = function(path)
        vim.cmd(string.format(':Ntree %s', path))
    end,
}

--- Shows the list of available directories and opens the chosen one using netrw
Directories.prettyChangeDirectory = function(directoryList)
    local formattedDirList = ''
    local intInput
    local path

    if (directoryList == nil) then
        error('Directory list is empty.')
    end

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
            Directories.changeCurrentWorkingDirectory(path)
        end
    end)

    -- Open directory
    Directories.netrw.openDirectory(path)
end

return Directories
