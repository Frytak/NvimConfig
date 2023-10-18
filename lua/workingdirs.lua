local M = {}

M.directoryList = {
    { name = "Nvim config", path = "C:\\Users\\fryta\\AppData\\Local\\nvim" },
    { name = "Programming projects", path = "C:\\Users\\fryta\\Pulpit\\~\\Important\\Programming Projects" },
};

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

--- @param path string
M.changeCurrentWorkingDirectory = function(path)
    vim.loop.chdir(path)
end

--- @param path string
M.openNetrwCurrentWorkingDirectory = function()
    vim.cmd(string.format(':Ntree %s', M.getCurrentWorkingDirectory()))
end

--- Shows the list of available directories and opens the chosen one using netrw
M.prettyChangeDirectory = function()
    local formattedDirList = '';
    local intInput = 0;

    -- Print the list of the available directories
    for i, v in ipairs(M.directoryList) do
        formattedDirList = formattedDirList .. string.format('  %i: %s\n', i, v.name)
    end

    -- Take the input
    vim.ui.input({ prompt = string.format('%sChoose from the available directories: ', formattedDirList) }, function(input)
        intInput = tonumber(input);
        if (intInput == nil) then
            print('Invalid input. Must be a number!')
            return
        end
        local path = M.directoryList[intInput].path

        M.changeCurrentWorkingDirectory(path)
    end)
    if (intInput == nil) then return end

    M.openNetrwCurrentWorkingDirectory()
end

return M
