require("bufferline").setup {
    options = {
        numbers = "buffer_id",
        offsets = {
            {
                filetype = 'NvimTree',
                text = '  Files',
                highlight = 'StatusLine',
                text_align = 'left',
            },
        },
    },
    highlights = {
        fill = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        background = {
            bg = '#282A36',
        },
        tab = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        tab_close = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        tab_selected = {
            bg = '#50fa7b',
        },
        close_button = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
            fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
        },
        close_button_visible = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
            fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
        },
        close_button_selected = {
            fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
        },
        buffer_visible = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        modified = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        modified_visible = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        duplicate = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        duplicate_visible = {
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        separator = {
            fg = { attribute = 'bg', highlight = 'StatusLine' },
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
        separator_selected = {
            fg = { attribute = 'bg', highlight = 'StatusLine' },
            bg = { attribute = 'bg', highlight = 'Normal' }
        },
        separator_visible = {
            fg = { attribute = 'bg', highlight = 'StatusLine' },
            bg = { attribute = 'bg', highlight = 'StatusLine' },
        },
    },
}
