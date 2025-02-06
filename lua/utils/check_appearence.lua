local M = {}

M.manual_override = nil

function M.set_background()
    if M.manual_override ~= nil then
        if M.manual_override then
            vim.o.background = 'dark'
        else
            vim.o.background = 'light'
        end
        return
    end

    local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
    if handle then
        local result = handle:read('*a')
        handle:close()
        if result:match('Dark') then
            vim.o.background = 'dark'
        else
            vim.o.background = 'light'
        end
    else
        vim.o.background = 'light' -- Fallback in case of error
    end
end

function M.toggle_theme()
    if M.manual_override == nil then
        M.manual_override = vim.o.background == 'light'
    else
        M.manual_override = not M.manual_override
    end

    if M.manual_override then
        vim.o.background = 'dark'
        vim.cmd('colorscheme ' .. M.dark_theme)
    else
        vim.o.background = 'light'
        vim.cmd('colorscheme ' .. M.light_theme)
    end
end

function M.watch_macos_appearance()
    local uv = vim.loop
    local config_path = os.getenv('HOME') .. '/Library/Preferences/.GlobalPreferences.plist'

    local watcher = uv.new_fs_event()
    if watcher then
        watcher:start(config_path, {}, function()
            vim.schedule(M.set_background)
        end)
    end
end

M.set_background()

M.watch_macos_appearance()

vim.api.nvim_create_user_command('ToggleTheme', M.toggle_theme, {})

return M
