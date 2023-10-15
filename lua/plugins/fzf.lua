return {
    "ibhagwan/fzf-lua",
    { "junegunn/fzf", build = "./install --bin" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({})
    end
}
