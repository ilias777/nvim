return {
    'mistricky/codesnap.nvim',
    build = 'make',
    cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapASCII' },
    opts = {
        save_path = '~/Desktop',
        has_breadcrumbs = true,
        bg_padding = 0,
        watermark = '',
    },
}
