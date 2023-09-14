--  ╭──────────────────────────────────────────────────────────╮
--  │                    JAVA CONFIGURATION                    │
--  ╰──────────────────────────────────────────────────────────╯

local jdtls_path = vim.fn.stdpath('data') .. '/mason/packages/jdtls'

local jdtls_bin_folder = jdtls_path .. 'bin/'
local jdtls_binary_path = jdtls_bin_folder .. 'jdtls'

local path_to_lsp_server = jdtls_path .. '/config_mac'
local path_to_plugins = jdtls_path .. '/plugins/'
local path_to_jar = path_to_plugins .. 'org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar'
local lombok_path = jdtls_path .. '/lombok.jar'

local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == '' then
    return
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name

-- local bundles = vim.fn.glob("/Users/ilias/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
-- vim.list_extend(bundles, vim.split(vim.fn.glob("/Users/ilias/.config/nvim/vscode-java-test/server/*.jar", 1), "\n"))

local bundles = {
    vim.fn.glob('/Users/ilias/.config/nvim/debug/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', 1),
}

local extendedClientCapabilities = require('jdtls').extendedClientCapabilities
extendedClientCapabilities.onCompletionItemSelectedCommand = 'editor.action.triggerParameterHints'

local config = {
    cmd = {
        'java', -- '/opt/homebrew/Cellar/openjdk@17/17.0.5/libexec/openjdk.jdk/Contents/Home',

        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-javaagent:' .. lombok_path,
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens',
        'java.base/java.util=ALL-UNNAMED',
        '--add-opens',
        'java.base/java.lang=ALL-UNNAMED',

        '-jar',
        path_to_jar,
        '-configuration',
        path_to_lsp_server,
        '-data',
        workspace_dir,
    },
    root_dir = root_dir,
    vim.list_extend(bundles, vim.split(vim.fn.glob('/Users/ilias/.config/debug/vscode-java-test/server/*.jar', 1), '\n')),

    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint(bufnr, true)
    end,

    settings = {
        java = {
            inlayHints = { parameterNames = { enabled = 'all' } },
        },
    },

    init_options = {
        bundles = bundles,
        extendedClientCapabilities = extendedClientCapabilities,
    },

    -- init_options = {
    --     bundles = {
    --         vim.fn.glob('/Users/ilias/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar', 1),
    --     },
    -- },

    -- on_attach = function (client, bufnr)
    --     require('jdtls').setup_dap({ hotcodereplace = 'auto' })
    -- end
}
require('jdtls').start_or_attach(config)

-- Keymaps
vim.keymap.set('n', '<M-o>', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
vim.keymap.set({ 'n', 'v' }, 'crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
vim.keymap.set({ 'n', 'v' }, 'crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
vim.keymap.set('v', 'crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })

-- Keymaps for nvim-dap
vim.keymap.set('n', '<leader>df', "<Cmd>lua require'jdtls'.test_class()<CR>", { desc = 'Test Class' })
vim.keymap.set('n', '<leader>dn', "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", { desc = 'Test Nearest Method' })

--  ╭──────────────────────────────────────────────────────────╮
--  │                 Introductions for Debug                  │
--  ╰──────────────────────────────────────────────────────────╯
-- Open a .java file
-- Set a breakpoint with <Leader>db '<cmd>DapToggleBreakpoint<cr>'
-- Call the command:
-- require('jdtls.dap').setup_dap_main_class_configs()
-- or:
-- JdtUpdateDebugConfigs
-- Then continue the debug with <Leader>dc '<cmd>DapContinue<CR>'
