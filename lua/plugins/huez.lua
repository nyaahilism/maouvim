require("huez").setup({
    fallback = "koalight",
    picker = "telescope",
    picker_opts = require("telescope.themes").get_dropdown({}), })

    local colorscheme = require("huez.api").get_colorscheme()
    vim.cmd("colorscheme " .. colorscheme)

    vim.keymap.set("n", "<leader>co", "<cmd>Huez<CR>", {})

