local M = {}

--- This list assumes that all the directories start from the windows user folder
M.directoryList = {
    { name = "Nvim config", path = "AppData\\Local\\nvim" },
    { name = "Programming projects", path = "Pulpit\\~\\Important\\Programming Projects" },
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

M.getUserDirectory = function()
    -- Open a file in read mode
    local file, err = io.open("userdir.txt", "r")

    print(file)
    -- Check if the file exists
    if not file then
        error(err)
        return
    end

    -- Read the first line of the file
    local first_line = file:read("*l")
    print("The first line is: " .. first_line)

    -- Close the file
    file:close()
end

--- Shows the list of available directories and opens the chosen one using netrw
M.prettyChangeDirectory = function()
    local formattedDirList = '';
    local intInput;

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
