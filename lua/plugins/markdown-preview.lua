return {
    'selimacerbas/markdown-preview.nvim',
    enabled = true,
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
    dependencies = { 'selimacerbas/live-server.nvim' },
    config = function()
        require('markdown_preview').setup({
            mermaid_renderer = 'js',
        })
    end,
}
