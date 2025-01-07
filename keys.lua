local wezterm = require("wezterm") --[[@as Wezterm]]
local bagman = wezterm.plugin.require("https://github.com/saltkid/bagman")

local keys = {
    {
        mods = "LEADER",
        key = "a",
        action = wezterm.action.ActivateKeyTable({
            name = "pane_mode",
            one_shot = false,
        }),
    },
    {
        mods = "CTRL|SHIFT",
        key = "d",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    -- CHANGE BACKGROUND IMAGE
    {
        mods = "CTRL",
        key = "i",
        action = bagman.action.next_image,
    },
    -- TAB-LOCAL QUAKE PANE
    {
        -- credits: Kcola's snippet here: https://github.com/wez/wezterm/discussions/3779
        -- edits: direction = "Right" --> "Top"
        --        change pane order since Top pane is 1
        mods = "ALT",
        key = "`",
        action = wezterm.action_callback(function(_, pane)
            local tab = pane:tab()
            if not tab then
                return
            end
            local panes = tab:panes_with_info()
            if #panes == 1 then
                pane:split({
                    direction = "Top",
                    size = 0.4,
                })
            elseif not panes[2].is_zoomed then
                panes[2].pane:activate()
                tab:set_zoomed(true)
            elseif panes[2].is_zoomed then
                tab:set_zoomed(false)
                panes[1].pane:activate()
            end
        end),
    },
}
-- map ctrl+{1-9} to goto tab {0-8} because wezterm's tabs are 0-based
for i = 0, 8 do
    table.insert(keys, {
        mods = "CTRL",
        key = tostring(i + 1),
        action = wezterm.action.ActivateTab(i),
    })
end

return keys
