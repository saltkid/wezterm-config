local wezterm = require("wezterm") --[[@as Wezterm]]
local colors = require("kanagawa-dragon")
local config = wezterm.config_builder()

-- WEZTERM CONFIG {{{
config.leader = { key = "Space", mods = "CTRL" }
config.keys = require("keys")
config.key_tables = require("key-tables")

config.colors = colors
config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
}

config.font = wezterm.font("Terminess Nerd Font")
config.font_size = 16

config.window_decorations = "NONE"
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.force_reverse_video_cursor = true
config.cursor_blink_rate = 0

-- WINDOWS SPECIFIC
if wezterm.target_triple:find("windows") then
    config.default_domain = "WSL:Debian"
end
-- }}}

-- CYCLE BG IMAGES {{{
wezterm.plugin.require("https://github.com/saltkid/bagman").setup({
    dirs = {
        {
            path = wezterm.home_dir .. "/Pictures/wt_bg/center-uniform-0.1",
            opacity = 0.1,
        },
        {
            path = wezterm.home_dir
                .. "/Pictures/wt_bg/center-uniformToFill-0.1",
            object_fit = "Cover",
            opacity = 0.1,
        },
        {
            path = wezterm.home_dir .. "/Pictures/wt_bg/right-uniform-0.1",
            vertical_align = "Bottom",
            horizontal_align = "Right",
            opacity = 0.1,
        },
    },
    backdrop = {
        color = colors.background,
        opacity = 0.95,
    },
    interval = 30 * 60,
    change_tab_colors = true,
    -- experimental = {
    --     contain_fix_wezterm_build = true,
    -- },
})
-- }}}

-- SHOW MODE ON LEFT STATUS {{{
wezterm.on("update-status", function(window, _)
    local name = window:active_key_table()
    if not name then
        window:set_left_status("")
        return
    end
    local effective_colors = window:effective_config().colors
    local status = " " .. name
    local status_fg = {
        Foreground = { Color = effective_colors.tab_bar.active_tab.bg_color },
    }
    local left_arrow = " " .. utf8.char(0xe0b2)
    local arrow_fg = status_fg

    if window:active_tab():tab_id() ~= 0 then
        arrow_fg = {
            Foreground = {
                Color = effective_colors.tab_bar.inactive_tab.bg_color,
            },
        }
    end

    window:set_left_status(wezterm.format({
        { Background = { Color = effective_colors.tab_bar.background } },
        status_fg,
        { Text = status },
        arrow_fg,
        { Text = left_arrow },
    }))
end)
-- }}}

-- CWD AS TAB TITLE {{{
wezterm.on("update-status", function(window, pane)
    local cwd = pane:get_current_working_dir()
    if not cwd then
        return
    end
    cwd = cwd.path:match("[^/]*/$")
    cwd = cwd:sub(1, cwd:len() - 1) -- remove trailing slash
    if
        cwd
        == (os.getenv("USER") or os.getenv("LOGNAME") or os.getenv("USERNAME"))
    then
        cwd = "~"
    end
    window:active_tab():set_title(cwd)
end)
-- }}}

return config
