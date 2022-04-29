return {
    flags = {
        debounce_text_changes = 150,
    },
    init_options = { documentFormatting = true },
    filetypes = { 'php' },
    settings = {
        rootMarkers = { '.git/' },
        languages = {
            php = {
                lintCommand = './vendor/bin/phpstan analyze --error-format raw --no-progress'
            },
        },
    },
}
