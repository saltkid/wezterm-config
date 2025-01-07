-- credits:
--  reblot for the [original theme](https://github.com/rebelot/kanagawa.nvim) made for neovim
--  ramonvermeulen for the [port](https://github.com/rebelot/kanagawa.nvim/pull/258) to wezterm
--  marcelarie for creating the [configuration](https://github.com/marcelarie/kanagawa.nvim/commit/a6bc7140d923fb9ffaf59cadeae3b9cc1da2e74d) (for nushell)
--  sravioli for [kanagawa dragon tab_bar and indexed colors](https://github.com/sravioli/kanagawa.nvim/blob/master/extras/wezterm/kanagawa-dragon.lua)
---@type Palette
local kanagawa_dragon = {
    foreground = "#C5C9C5",
    background = "#181616",

    cursor_bg = "#C8C093",
    cursor_fg = "#C8C093",
    cursor_border = "#C8C093",

    selection_fg = "#C8C093",
    selection_bg = "#2D4F67",

    scrollbar_thumb = "#16161D",
    split = "#16161D",

    ansi = {
        "#0D0C0C",
        "#C4746E",
        "#8A9A7B",
        "#C4B28A",
        "#8BA4B0",
        "#A292A3",
        "#8EA4A2",
        "#C8C093",
    },

    brights = {
        "#A6A69C",
        "#E46876",
        "#87A987",
        "#E6C384",
        "#7FB4CA",
        "#938AA9",
        "#7AA89F",
        "#C5C9C5",
    },

    indexed = {
        [16] = "#B6927B",
        [17] = "#B98D7B",
    },

    tab_bar = {
        background = "#0D0C0C",

        active_tab = {
            bg_color = "#938AA9",
            fg_color = "#0D0C0C",
        },

        inactive_tab = {
            bg_color = "#a6a69c",
            fg_color = "#0D0C0C",
        },

        inactive_tab_hover = {
            bg_color = "#223249",
            fg_color = "#0D0C0C",
            italic = true,
        },

        new_tab = {
            bg_color = "#a6a69c",
            fg_color = "#0D0C0C",
        },

        new_tab_hover = {
            bg_color = "#223249",
            fg_color = "#0D0C0C",
            italic = true,
        },
    },
}

return kanagawa_dragon
