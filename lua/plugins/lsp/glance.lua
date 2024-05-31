return {
    'dnlhc/glance.nvim',
    keys = {
        { '<space>gr', '<cmd>Glance references<cr>', desc = 'Glance references' },
        { '<space>gd', '<cmd>Glance definitions<cr>', desc = 'Glance definitions' },
        { '<space>gy', '<cmd>Glance type_definitions<cr>', desc = 'Glance type_definitions' },
        { '<space>gm', '<cmd>Glance implementations<cr>', desc = 'Glance implementations' },
    },
    config = true,
}
