local wezterm = require("wezterm") --[[@as Wezterm]]

return {
    pane_mode = {
        { key = "Escape", action = "PopKeyTable" },
        -- SPLIT PANES
        {
            mods = "SHIFT",
            key = "|",
            action = wezterm.action.SplitHorizontal({
                domain = "CurrentPaneDomain",
            }),
        },
        {
            key = "-",
            action = wezterm.action.SplitVertical({
                domain = "CurrentPaneDomain",
            }),
        },
        -- CHANGE PANES
        {
            mods = "CTRL",
            key = "h",
            action = wezterm.action.ActivatePaneDirection("Left"),
        },
        {
            mods = "CTRL",
            key = "l",
            action = wezterm.action.ActivatePaneDirection("Right"),
        },
        {
            mods = "CTRL",
            key = "k",
            action = wezterm.action.ActivatePaneDirection("Up"),
        },
        {
            mods = "CTRL",
            key = "j",
            action = wezterm.action.ActivatePaneDirection("Down"),
        },
        -- RESIZE PANES
        {
            key = "h",
            action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
        },
        {
            key = "l",
            action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
        },
        {
            key = "k",
            action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
        },
        {
            key = "j",
            action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
        },
        -- BIGGER RESIZE PANES
        {
            key = "H",
            action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
        },
        {
            key = "L",
            action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
        },
        {
            key = "K",
            action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
        },
        {
            key = "J",
            action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
        },
    },
}
