local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        require('null-ls').builtins.formatting.pint.with({
            condition = function(utils)
                local hasArtisan = utils.root_has_file({ 'artisan' })
                local hasWork = utils.root_has_file({ '.work' })
                if (hasWork)
                then
                    return nil
                end

                return utils.root_has_file({ 'artisan' })
            end,
        })
    }
})
