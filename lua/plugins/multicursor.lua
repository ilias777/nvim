return {
    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    config = function()
        -- stylua: ignore start
        local clr = require('catppuccin.palettes').get_palette()
        local mc = require('multicursor-nvim')

        mc.setup()

        local set = vim.keymap.set

        -- ADD MATCH CURSOR
        set({ 'n', 'v' }, '<c-n>', function() mc.matchAddCursor(1) end, { desc = 'Add multicursor match next' })

        -- ADD CURSOR UP/DOWN
        set({ 'n', 'x' }, '<c-up>', function() mc.lineAddCursor(-1) end, { desc = 'Add multicursor up' })
        set({ 'n', 'x' }, '<c-down>', function() mc.lineAddCursor(1) end, { desc = 'Add multicursor down' })

        -- TOGGLE CURSOR
        set({ 'n', 'x' }, '<c-q>', mc.toggleCursor, { desc = 'Toggle multicursor' })

        -- OPERATOR
        set('n', 'ga', mc.addCursorOperator, { desc = 'Add multicursor operator' })

        -- CLONE EVERY CURSOR AND DISABLE THE ORIGINALS.
        set({ 'n', 'x' }, '\\d', mc.duplicateCursors, { desc = 'Duplicate multicursor' })

        -- ALIGN CURSOR COLUMNS.
        set('n', '\\a', mc.alignCursors, { desc = 'Align multicursor' })

        -- MATCH NEW CURSORS WITHIN VISUAL SELECTIONS BY REGEX.
        set('x', '\\r', mc.matchCursors, { desc = 'Match multicursor in visual by regex' })

        -- BRING BACK CURSORS IF YOU ACCIDENTALLY CLEAR THEM
        set('n', '\\gv', mc.restoreCursors, { desc = 'Restore multicursor' })

        -- ADD A CURSOR FOR ALL MATCHES OF CURSOR WORD/SELECTION IN THE DOCUMENT.
        set({ 'n', 'x' }, '\\A', mc.matchAllAddCursors, { desc = 'Add multicursor under the cursor' })

        -- APPEND/INSERT FOR EACH LINE OF VISUAL SELECTIONS.
        -- SIMILAR TO BLOCK SELECTION INSERTION.
        set('x', 'I', mc.insertVisual, { desc = 'Insert multicursor for each line' })
        set('x', 'A', mc.appendVisual, { desc = 'Append multicursor for each line' })

        -- INCREMENT/DECREMENT SEQUENCES, TREAING ALL CURSORS AS ONE SEQUENCE.
        set({ 'n', 'x' }, 'g<c-a>', mc.sequenceIncrement, { desc = 'Increment sequence multicursor' })
        set({ 'n', 'x' }, 'g<c-x>', mc.sequenceDecrement, { desc = 'Decrement sequence multicursor' })

        -- ADD A CURSOR TO EVERY SEARCH RESULT IN THE BUFFER.
        set('n', '\\/A', mc.searchAllAddCursors, { desc = 'Add multicursor to every search result' })

        -- ADD A CURSOR AND JUMP TO THE NEXT/PREVIOUS SEARCH RESULT.
        set('n', '\\\\n', function() mc.searchAddCursor(1) end, { desc = 'Add multicursor and jump to next search' })
        set('n', '\\\\N', function() mc.searchAddCursor(-1) end, { desc = 'Add multicursor and jump to previous search' })

        -- JUMP TO THE NEXT/PREVIOUS SEARCH RESULT WITHOUT ADDING A CURSOR.
        set('n', '\\\\s', function() mc.searchSkipCursor(1) end, { desc = 'Jump to next search without multicursor' })
        set('n', '\\\\S', function() mc.searchSkipCursor(-1) end, { desc = 'Jump to previous search without multicursor' })

        -- PRESSING `<LEADER>MIWAP` WILL CREATE A CURSOR IN EVERY MATCH OF THE
        -- STRING CAPTURED BY `IW` INSIDE RANGE `AP`.
        -- THIS ACTION IS HIGHLY CUSTOMIZABLE, SEE `:H MULTICURSOR-OPERATOR`.
        set({ 'n', 'x' }, '<leader>m', mc.operator, { desc = 'Multicursor operator' })

        -- ADD/SKIP CURSOR BY WORD FORWARD OR BACKWARD
        set('n', '<c-right>', function() mc.addCursor('w') end, { desc = 'Add multicursor word forward' })
        set('n', '<c-left>', function() mc.addCursor('b') end, { desc = 'Add multicursor word backward' })
        set('n', '\\<right>', function() mc.skipCursor('w') end, { desc = 'Skip multicursor word forward' })
        set('n', '\\<left>', function() mc.skipCursor('b') end, { desc = 'Skip multicursor word backward' })

        -- SPLIT VISUAL SELECTIONS BY REGEX.
        set('x', '\\l', mc.splitCursors, { desc = 'Split multicursor by regex' })

        -- ROTATE THE TEXT CONTAINED IN EACH VISUAL SELECTION BETWEEN CURSORS.
        set("x", "\\t", function() mc.transposeCursors(1) end, { desc = 'Transponse multicursor down' })
        set("x", "\\T", function() mc.transposeCursors(-1) end, { desc = 'Transponse multicursor up' })

        -- MOUSE
        set('n', '<c-leftmouse>', mc.handleMouse)
        set('n', '<c-leftdrag>', mc.handleMouseDrag)
        set('n', '<c-leftrelease>', mc.handleMouseRelease)

        -- EXIT MULTICURSOR
        set('n', '<esc>', function()
            if not mc.cursorsEnabled() then
                mc.enableCursors()
            elseif mc.hasCursors() then
                mc.clearCursors()
            else
                vim.cmd('noh')
            end
        end)

        mc.addKeymapLayer(function(layerSet)
            layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
            layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)
            layerSet({ 'n', 'x' }, '\\x', mc.deleteCursor)
            layerSet({ 'n', 'x' }, 'q', function() mc.matchSkipCursor(1) end)
            layerSet({ 'n', 'x' }, 'Q', function() mc.matchSkipCursor(-1) end)
            layerSet({ 'n', 'x' }, 'n', function() mc.matchAddCursor(1) end)
            layerSet({ 'n', 'x' }, 'N', function() mc.matchAddCursor(-1) end)

            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)

        -- CUSTOMIZE HOW CURSORS LOOK.
        local hl = vim.api.nvim_set_hl
        hl(0, 'MultiCursorCursor', { bg = clr.red, fg = clr.mantle })
        hl(0, 'MultiCursorVisual', { link = 'Visual' })
        hl(0, 'MultiCursorSign', { link = 'SignColumn' })
        hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
        hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
        hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
        -- stylua: ignore end
    end,
}
