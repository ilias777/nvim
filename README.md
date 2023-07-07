<div align="center">
  <img src="./logo/neovim.png" width="300">
</div>

<h2 align="center">Neovim configuration</h2>

## 🌟 Preview

<div align="center>
  <img width="1452" alt="p1" src="https://github.com/ilias777/nvim/assets/39212564/aeabf57f-72fe-4551-8536-aa53fb03fdf4">

  <img width="1452" alt="p2" src="https://github.com/ilias777/nvim/assets/39212564/225b5605-7d5a-4cba-a5af-0b3745eb0b83">
  <img width="1452" alt="p3" src="https://github.com/ilias777/nvim/assets/39212564/9d2c6eb0-e81a-402f-baaf-c6d86932dc40">
  <img width="1452" alt="p4" src="https://github.com/ilias777/nvim/assets/39212564/8b740e40-de61-4f48-9331-5fc4795aaf27">
  <img width="1452" alt="p1" src="https://github.com/ilias777/nvim/assets/39212564/adf6a765-537d-4615-aa61-c91e88f85a91">
  <img width="1452" alt="p5" src="https://github.com/ilias777/nvim/assets/39212564/d8ef3bd0-111b-4a44-8faa-fda4076fb0ed">
  <img width="1452" alt="p6" src="https://github.com/ilias777/nvim/assets/39212564/e0f2f0f3-d64b-4b69-ae8a-cb4709b828a5">
  <img width="1452" alt="p7" src="https://github.com/ilias777/nvim/assets/39212564/a88bc4d1-4d37-493e-81de-e9fc2751eaa7">
  
</div>

## ✨ Features

- File explorer with [Nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- Autocompletion with [CMP](https://github.com/hrsh7th/nvim-cmp)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) and [Neogit](https://github.com/NeogitOrg/neogit)
- Fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Formatting and Linting with [Null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Language Server Protocol with [Native LSP](https://github.com/neovim/nvim-lspconfig)
- Debug Adapter Protocol with [Nvim DAP](https://github.com/mfussenegger/nvim-dap)
- Beautiful UI with [Catppuccin](https://github.com/catppuccin/nvim) and [Noice.nvim](https://github.com/folke/noice.nvim)
- Fast code navigation with [flash.nvim](https://github.com/folke/flash.nvim)

## ⚡️ Requirements

- Neovim >= 0.8.0
- Git >= 2.19.0
- a [Nerd Font](https://www.nerdfonts.com/) (optional)

## 🛠️ Installation

### Linux / MacOS (Unix)

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Go to your .config folder

```shell
cd ~/.config
```

#### Clone the Repository

```shell
git clone https://github.com/ilias777/nvim.git
```

#### Navigate to nvim folder and open init.lua with Neovim

```shell
cd nvim
nvim init.lua
```

### 📺 Preview installation process

https://github.com/ilias777/nvim/assets/39212564/096991aa-2841-41db-a807-8a3d6ad63d93

#### Notes

If you see the Treesitter installing the parser messages, press `Enter` to skip these.

At the first time the Command `MasonUpdate` is not found. Please wait about 2 minutes for the
language server installation to finish.
When all language servers are installed, restart Neovim.

## 🔌 Plugins

- Over **70 Plugins** preinstalled
- Startuptime **~100ms - ~130ms**

<img width="1452" alt="startup" src="https://github.com/ilias777/nvim/assets/39212564/fb09cd4f-e8a7-4e02-9da4-fe510cd20a7d">

---

### Plugins List

#### Package Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim) - A modern plugin manager.

#### File Explorer

- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) - A simple and fast file explorer tree.

#### Plugins for LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Configurations for the LSP client.
- [mason](https://github.com/williamboman/mason.nvim) - Install and manage LSP servers.
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - Bridge between mason and lsp-ocnfig.

#### Autocompletion

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin.

#### Formatter and linter

- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) - Language server to inject LSP diagnostics, code actions, and more via Lua.

#### Colorscheme

- [Catppuccin](https://github.com/catppuccin/nvim) - Warm mid-tone dark theme.

#### Snippet Engine

- [Luasnip](https://github.com/L3MON4D3/LuaSnip) - A snippet engine.
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippets collection for a set of different programming languages.

#### Tabline and Statusline

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - A snazzy buffer line.
- [feline.nvim](https://github.com/freddiehaddad/feline.nvim) - A minimal, stylish and customizable statusline.

#### Motion

- [cinnamon.nvim](https://github.com/declancm/cinnamon.nvim) - Smooth scrolling for any movement command.
- [flash.nvim](https://github.com/folke/flash.nvim) - Navigate your code with search labels.
- [hop.nvim](https://github.com/phaazon/hop.nvim) - Jump anywhere in a document.
- [nvim-spider](https://github.com/chrisgrieser/nvim-spider) - Use the w, e, b motions like a spider.

#### Git integration

- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Interface for easily cycling through diffs.
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git integration: signs, hunk actions, blame, etc.
- [neogit](https://github.com/NeogitOrg/neogit) - A Magit clone for Neovim

#### Utils

- [align.nvim](https://github.com/Vonr/align.nvim) - Aligning lines.
- [cheatsheet.nvim](https://github.com/sudormrfbin/cheatsheet.nvim) - Searchable cheatsheet.
- [focus.nvim](https://github.com/beauwilliams/focus.nvim) - Auto-Focusing and Auto-Resizing Splits/Windows.
- [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) - Incremental LSP rename command.
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - IndentLine replacement.
- [live-command.nvim](https://github.com/smjonas/live-command.nvim) - Text editing with immediate visual feedback.
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) - Preview markdown on your browser.
- [noice.nvim](https://github.com/folke/noice.nvim) - Replaces the UI for messages, cmdline and the popupmenu.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - A minimalist autopairs.
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter.
- [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) - Extensions for the built-in LSP support for eclipse.jdt.ls.
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - A fancy, configurable, notification manager.
- [nvim-surround](https://github.com/kylechui/nvim-surround) - A plugin for adding/changing/deleting surrounding delimiter pairs.
- [nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler) - Invert text.
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Ultra fold with modern looking and performance boosting.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Show dev icons.
- [sentiment.nvim](https://github.com/utilyre/sentiment.nvim) - Enhanced matchparen.
- [ssr.nvim](https://github.com/cshuaimin/ssr.nvim) - Structural search and replace.
- [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim) - Configurable 'statuscolumn' with builtin segments and click handlers.
- [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) - A tree like view for symbols.
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi) - Multiple cursors.
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Popup of keybindings.
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Distraction-free coding.

#### Treesitter

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Neovim Treesitter configurations and abstraction layer.
- [nvim-treehopper](https://github.com/mfussenegger/nvim-treehopper) - Region selection using hints on the abstract syntax tree of a document.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - Shows the context of the currently visible buffer contents.
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - Syntax aware text-objects, select, move, swap, and peek support.
- [nvim-treesitter-textsubjects](https://github.com/RRethy/nvim-treesitter-textsubjects) - Location and syntax aware text objects which _do what you mean_.
- [ts-node-action](https://github.com/ckolkey/ts-node-action) - A framework for executing functional transformations on Tree-sitter nodes.
- [ts-playground](https://github.com/nvim-treesitter/playground) - View treesitter information directly in Neovim.

#### Telescope

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Find, Filter, Preview, Pick.
- [telescope-emoji.nvim](https://github.com/xiyaowong/telescope-emoji.nvim) - An extension for telescope.nvim that allows you to search emojis 😃.
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) - A file browser extension for telescope.nvim.
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim) - Ability of picking symbols and insert them at point.
- [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) - Visualize your undo tree and fuzzy-search changes in it.

#### Comments

- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and powerful comment plugin.
- [comment-box.nvim](https://github.com/LudoPinelli/comment-box.nvim) - Clarify and beautify your comments using boxes and lines.
- [nvim-comment-frame](https://github.com/s1n7ax/nvim-comment-frame) - Detects the language using treesitter and adds a comment block.
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Highlight, list and search todo comments in your projects.

#### Degub Adapter Protocol

- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation for Neovim.
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - A UI for nvim-dap.
- [nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js) - nvim-dap adapter for vscode-js-debug.

#### Writing

- [vimtex](https://github.com/lervag/vimtex) - A modern Vim and Neovim filetype and syntax plugin for LaTeX files.

---

### Preinstalled Language Servers

- [cssls](https://github.com/microsoft/vscode-css-languageservice) - Language services for CSS, LESS and SCSS.
- [emmet_ls](https://github.com/aca/emmet-ls) - Emmet support based on LSP.
- [html](https://github.com/microsoft/vscode-html-languageservice) - Language services for HTML.
- [intelephense](https://intelephense.com) - PHP language server.
- [jdtls](https://github.com/eclipse/eclipse.jdt.ls) - Java language server.
- [jsonls](https://github.com/microsoft/vscode-json-languageservice) - JSON language service.
- [ltex](https://valentjn.github.io/ltex/) - Grammar checking of various markup languages.
- [lua_ls](https://github.com/LuaLS/lua-language-server) - A language server that offers Lua language support.
- [pyright](https://github.com/microsoft/pyright) - Static Type Checker for Python.
- [rust_analyzer](https://github.com/rust-lang/rust-analyzer) - Rust compiler.
- [texlab](https://github.com/latex-lsp/texlab) - Language Server Protocol for LaTeX.
- [tsserver](https://github.com/typescript-language-server/typescript-language-server) - TypeScript & JavaScript Language Server.
- [volar](https://github.com/johnsoncodehk/volar) - High-performance Vue language tooling based-on Volar.js.
- [yamlls](https://github.com/redhat-developer/yaml-language-server) - Language Server for YAML Files.

---
