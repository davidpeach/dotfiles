local bufferline = require("bufferline")
bufferline.setup {
    options = {
        numbers = "none",
        offsets = {
            {
                filetype = 'NvimTree',
                text = '  Files',
                highlight = 'StatusLine',
                text_align = 'left',
            },
        },
        show_buffer_close_icons = false,
    },
    highlights = {
        fill = {
            bg = '#282A36',
        },
        background = {
            bg = '#282A36',
        },
        numbers = {
            bg = '#282A36',
        },
        offset_separator = {
            bg = "#bada55",
        },
        tab_selected = {
            bg = '#50fa7b',
            fg = '#222222',
        },
        close_button = {
            bg = '#282A36',
            fg = { attribute = 'fg', highlight = 'StatusLineNonText' },
        },
        buffer_visible = {
            bg = '#282A36',
        },
        modified = {
            fg = '#FFB86C',
            bg = '#282A36',
        },
        modified_visible = {
            fg = '#FFB86C',
            bg = '#282A36',
        },
        modified_selected = {
            fg = '#FFB86C',
            bg = '#282A36',
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
