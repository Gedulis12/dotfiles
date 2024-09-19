local obsidian = require("obsidian")


obsidian.setup({
    workspaces = {
        {
            name = "notes",
            path = "~/Documents/notes",
        },
    },

    daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        default_tags = { "daily-notes" },
    },

    mappings = {},

    completion = {
        nvim_cmp = true,
        min_chars = 2,
    },

    new_notes_location = "notes_subdir",

    templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {
            yesterday = function()
                return os.date("%Y-%m-%d", os.time() - 86400)
            end,
            tomorrow = function()
                return os.date("%Y-%m-%d", os.time() + 86400)
            end,
        },
    },
})
