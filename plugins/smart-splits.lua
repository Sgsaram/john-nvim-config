return {
    "mrjones2014/smart-splits.nvim",
    config = function()
        require('smart-splits').setup({})
        vim.keymap.set('n', '<c-left>', require('smart-splits').resize_left)
        vim.keymap.set('n', '<c-down>', require('smart-splits').resize_down)
        vim.keymap.set('n', '<c-up>', require('smart-splits').resize_up)
        vim.keymap.set('n', '<c-right>', require('smart-splits').resize_right)
    end
}
