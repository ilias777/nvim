local M = {}

local function get_add_path()
    local lang = vim.opt.spelllang:get()[1] or 'de'
    return vim.fn.stdpath('config') .. '/spell/' .. lang .. '.utf-8.add'
end

local function read_words(path)
    local f = io.open(path, 'r')
    if not f then
        return {}
    end
    local lines = {}
    for line in f:lines() do
        if line ~= '' then
            table.insert(lines, line)
        end
    end
    f:close()
    return lines
end

local function write_words(path, words)
    local f = io.open(path, 'w')
    for _, word in ipairs(words) do
        f:write(word .. '\n')
    end
    f:close()
    vim.notify(' Wörter aktualisiert: ' .. path, vim.log.levels.INFO)
end

M.manage_user_words = function()
    local path = get_add_path()
    local words = read_words(path)

    if #words == 0 then
        vim.notify('󰶌 Keine Benutzerwörter gefunden.', vim.log.levels.ERROR)
        return
    end

    vim.ui.select(words, { prompt = '󰧑 Benutzerwörter verwalten:' }, function(choice)
        if not choice then
            return
        end

        vim.ui.select({ ' Löschen', ' Ändern', '󰅌 In Zwischenablage' }, {
            prompt = 'Was tun mit: ' .. choice,
        }, function(action)
            if action == ' Löschen' then
                -- Entferne das Wort
                local updated = vim.tbl_filter(function(w)
                    return w ~= choice
                end, words)
                write_words(path, updated)
            elseif action == ' Ändern' then
                vim.ui.input({ prompt = 'Neues Wort für: ' .. choice }, function(new_word)
                    if new_word and new_word ~= '' then
                        local updated = {}
                        for _, w in ipairs(words) do
                            table.insert(updated, w == choice and new_word or w)
                        end
                        write_words(path, updated)
                    end
                end)
            elseif action == '󰅌 In Zwischenablage' then
                vim.fn.setreg('+', choice)
                vim.notify("󰅌 '" .. choice .. "' in Zwischenablage", vim.log.levels.INFO)
            end
        end)
    end)
end

vim.api.nvim_create_user_command('SpellWordsManage', M.manage_user_words, {})

return M
