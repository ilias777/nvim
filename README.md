<div align="center">
  <img src="./logo/neovim.png" width="300">
</div>

<h1 align="center">Neovim Configuration</h1>

<div align="center">
  <img src="https://img.shields.io/badge/Made_with_Lua-blue?style=for-the-badge&logo=lua" />
</div>

<h4 align="center">
  <a href="#-features">Features</a> •
  <a href="#%EF%B8%8F-requirements">Requirements</a> •
  <a href="#%EF%B8%8F-installation">Installation</a> •
  <a href="#-folder-and-file-structure">Folder structure</a> •
  <a href="#-configuration">Configuration</a> •
  <a href="#-plugins">Plugins</a> •
  <a href="https://github.com/ilias777/nvim/wiki">Wiki</a>
</h4>

<h5 align="center">
  <a href="https://github.com/ilias777/nvim/blob/main/lua/plugins/lsp/lsp-config.lua">
    &rarr; SEE LSP CONFIGURATION FILE &larr;
  </a>
</h5>


## 🌟 Preview

<div align="center">
  <img width="1480" alt="startup" src="https://github.com/ilias777/nvim/assets/39212564/4f6b437c-c97e-4f27-b7ff-697a3df53131">
  <h6>Find files with Telescope</h6>
  <img width="1480" alt="p1" src="https://github.com/ilias777/nvim/assets/39212564/b53bdb7a-b581-46ba-9f79-415f22363f84">
  <h6>Show keybindings with which-key</h6>
  <img width="1480" alt="p2" src="https://github.com/ilias777/nvim/assets/39212564/6be27432-8004-40b9-bd15-71a65b336e76">
  <h6>File browser with Telescope</h6>
  <img width="1480" alt="p3" src="https://github.com/ilias777/nvim/assets/39212564/013ebe1b-35a2-4828-aa6a-fa3716650dad">
  <h6>Find help with Telescope</h6>
  <img width="1480" alt="help" src="https://github.com/ilias777/nvim/assets/39212564/7b7fb702-b3fe-4f64-abe9-e391abeacb57">
  <h6>Neo-tree file browser</h6>
  <img width="1480" alt="p4" src="https://github.com/ilias777/nvim/assets/39212564/5eccf46d-f5d5-4004-8d16-2d311c30439c">
  <h6>Neo-tree floating file browser</h6>
  <img width="1480" alt="p5" src="https://github.com/ilias777/nvim/assets/39212564/b6c70cb4-d1d9-43c5-933d-2285e34119bd">
  <h6>Lazy.nvim</h6>
  <img width="1480" alt="p6" src="https://github.com/ilias777/nvim/assets/39212564/99871f33-89b5-4aa3-a030-d89532e53b5e">
  <h6>Mason.nvim</h6>
  <img width="1480" alt="p7" src="https://github.com/ilias777/nvim/assets/39212564/d3b0835a-02e0-413c-bb1b-9d5ccbc29418">
  <h6>Autocompletion with nvim-cmp</h6>
  <img width="1480" alt="p8" src="https://github.com/ilias777/nvim/assets/39212564/9724546f-f6e1-4885-853c-9f2810a5eb15">
</div>

## ✨ Features

- File explorer with [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Autocompletion with [blink.cmp](https://github.com/Saghen/blink.cmp)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) and [Neogit](https://github.com/NeogitOrg/neogit)
- Fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Formatting with [conform.nvim](https://github.com/stevearc/conform.nvim) and Linting [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- Language Server Protocol with [Native LSP](https://github.com/neovim/nvim-lspconfig)
- Debug Adapter Protocol with [Nvim DAP](https://github.com/mfussenegger/nvim-dap)
- Beautiful UI with [Catppuccin](https://github.com/catppuccin/nvim) and [Noice.nvim](https://github.com/folke/noice.nvim)
- Fast code navigation with [flash.nvim](https://github.com/folke/flash.nvim)

## ⚡️ Requirements

- Neovim >= 0.10.0
- Git >= 2.19.0
- a [Nerd Font](https://www.nerdfonts.com/)

## 🛠️ Installation

### Linux / macOS

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

#### Remove `.git` folder and add your own repo if you want

```shell
rm -rf ~/.config/nvim/.git
```

#### Navigate to nvim folder and open init.lua with Neovim

```shell
cd nvim
nvim init.lua
```

## 📁 Folder and File Structure

```shell
~/.config/nvim
│
├── lua                                  # LUA FOLDER
│   ├── core
│   │   ├── autocommands.lua             # File to store all the autocommands
│   │   ├── usercommands.lua             # File to store all the usercommands
│   │   ├── keymaps.lua                  # Keybindings
│   │   └── options.lua                  # All Neovim options
│   └── plugins
│       ├── lsp                          # LSP RELATED PLUGINS FOLDER
│       │   ├── lsp-config.lua           # nvim-lspconfig
│       │   └── other-lsp-plugins.lua    # Other lsp related plugins
│       ├── init.lua                     # Many plugins in one file
│       ├── plugin_1.lua                 # One or more plugins in one file
│       ├── plugin_2.lua                 # One or more plugins in one file
│       ├── **
│       └── plugin_xx.lua
├── snippets
│   ├── javaspript.lua                   # JavaScript snippets
│   └── lua.lua                          # Lua snippets
├── ftplugin
│   └── java.lua                         # Java configuration
└── init.lua                             # Main file
```

Understanding the file tree &rarr; [look here](https://github.com/ilias777/nvim/wiki/Folder-and-File-Structure)

## ⚙ Configuration

How to configure Neovim is explained in the [Wiki](https://github.com/ilias777/nvim/wiki)

### Plugins

- How to install or uninstall plugins &rarr; [look here](https://github.com/ilias777/nvim/wiki/Plugins)

### Language server

- How to setup a language server &rarr; [look here](https://github.com/ilias777/nvim/wiki/LSP)

### Keymaps

- How to setup or change keymaps &rarr; [look here](https://github.com/ilias777/nvim/wiki/Set-new--or-change-keymaps)

### See all keymaps

- Keymaps are listet &rarr; [here](https://github.com/ilias777/nvim/wiki/All-Keymaps)

## 🔌 Plugins

- Over **90 Plugins** preinstalled
- Startuptime **~40ms - ~59ms**
- Testet on MacOS 14.5 - M1 Pro

<img width="1480" alt="startuptime" src="https://github.com/ilias777/nvim/assets/39212564/1ab9441c-9f77-4889-865a-231f0ca967fa">

### Plugins List

#### Package Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim) - A modern plugin manager.

#### File Explorer

- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) - Manage and browse the file system.

#### Plugins for LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Configurations for the LSP client.
- [mason](https://github.com/williamboman/mason.nvim) - Install and manage LSP servers.
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) - Bridge between mason and lsp-ocnfig.
- [trouble.nvim](https://github.com/folke/trouble.nvim) - A pretty diagnostics, references, telescope results, quickfix and location list.
- [glance.nvim](https://github.com/dnlhc/glance.nvim) - A pretty window for previewing, navigating and editing your LSP locations.
- [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) - Incremental LSP rename command.
- [outline.nvim](https://github.com/hedyhli/outline.nvim) - Code outline sidebar powered by LSP.
- [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) - Extensions for the built-in LSP support for eclipse.jdt.ls.

#### Autocompletion

- [blink.cmp](https://github.com/Saghen/blink.cmp) - Completion plugin.

#### Formatter

- [conform.nvim](https://github.com/stevearc/conform.nvim) - Lightweight yet powerful formatter plugin for Neovim.

#### Linter

- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - An asynchronous linter plugin for Neovim.

#### Colorscheme

- [Catppuccin](https://github.com/catppuccin/nvim) - Warm mid-tone dark theme.

#### Snippets

- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Snippets collection for a set of different programming languages.

#### Tabline and Statusline

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - A snazzy buffer line.
- [feline.nvim](https://github.com/freddiehaddad/feline.nvim) - A minimal, stylish and customizable statusline.

#### Motion

- [flash.nvim](https://github.com/folke/flash.nvim) - Navigate your code with search labels.
- [hop.nvim](https://github.com/smoka7/hop.nvim) - Jump anywhere in a document.
- [nvim-spider](https://github.com/chrisgrieser/nvim-spider) - Use the w, e, b motions like a spider.

#### Git integration

- [advanced-git-search](https://github.com/aaronhallaert/advanced-git-search.nvim) - Search your git history by commit message, content and author with Telescope.
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Interface for easily cycling through diffs.
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git integration: signs, hunk actions, blame, etc.
- [neogit](https://github.com/NeogitOrg/neogit) - A Magit clone for Neovim

#### Utils

- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - IndentLine replacement.
- [noice.nvim](https://github.com/folke/noice.nvim) - Replaces the UI for messages, cmdline and the popupmenu.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - A minimalist autopairs.
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) - A high-performance color highlighter.
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - A fancy, configurable, notification manager.
- [nvim-surround](https://github.com/kylechui/nvim-surround) - A plugin for adding/changing/deleting surrounding delimiter pairs.
- [nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler) - Invert text.
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Ultra fold with modern looking and performance boosting.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Show dev icons.
- [rainbow-delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) - Rainbow delimiters for Neovim with Treesitter.
- [ssr.nvim](https://github.com/cshuaimin/ssr.nvim) - Treesitter based structural search and replace plugin.
- [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim) - Configurable 'statuscolumn' with builtin segments and click handlers.
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) - A neovim lua plugin to help easily manage multiple terminal windows.
- [multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim) - Multiple cursors.
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Popup of keybindings.
- [yanky.nvim](https://github.com/gbprod/yanky.nvim) - Improved Yank and Put functionalities.
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Distraction-free coding.

#### Treesitter

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Neovim Treesitter configurations and abstraction layer.
- [nvim-treehopper](https://github.com/mfussenegger/nvim-treehopper) - Region selection using hints on the abstract syntax tree of a document.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - Shows the context of the currently visible buffer contents.
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects) - Syntax aware text-objects, select, move, swap, and peek support.
- [ts-node-action](https://github.com/ckolkey/ts-node-action) - A framework for executing functional transformations on Tree-sitter nodes.
- [treewalker.nvim](https://github.com/aaronik/Treewalker.nvim?tab=readme-ov-file) - Moving around code in a syntax tree.

#### Telescope

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - An extendable fuzzy finder. Find files, Filter, Preview, Pick. All in one!
- [telescope-emoji.nvim](https://github.com/xiyaowong/telescope-emoji.nvim) - An extension for telescope.nvim that allows you to search emojis 😃.
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) - A file browser extension for telescope.nvim.
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim) - Ability of picking symbols and insert them at point.
- [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) - Visualize your undo tree and fuzzy-search changes in it.
- [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide) - An extension for telescope.nvim that allows you operate [zoxide](https://github.com/ajeetdsouza/zoxide) within Neovim.

#### Comments

- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart and powerful comment plugin.
- [comment-box.nvim](https://github.com/LudoPinelli/comment-box.nvim) - Clarify and beautify your comments using boxes and lines.
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Highlight, list and search todo comments in your projects.

#### Degub Adapter Protocol

- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol client implementation for Neovim.
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - A UI for nvim-dap.
- [nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js) - nvim-dap adapter for vscode-js-debug.

#### Writing

- [vimtex](https://github.com/lervag/vimtex) - A modern Vim and Neovim filetype and syntax plugin for LaTeX files.
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) - Preview markdown on your browser.
- [typst.vim](https://github.com/kaarmu/typst.vim) - Vim plugin for Typst.

### Preinstalled Language Servers

| Language Server                                                                      | Description                                             | Programming Language |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------- | -------------------- |
| [cssls](https://github.com/microsoft/vscode-css-languageservice)                     | Language services for CSS, LESS and SCSS                | CSS                  |
| [emmet-language-server](https://github.com/olrtg/emmet-language-server)              | A language server for emmet.io                          | HMLT - CSS           |
| [html](https://github.com/microsoft/vscode-html-languageservice)                     | Language services for HTML                              | HTML                 |
| [jsonls](https://github.com/microsoft/vscode-json-languageservice)                   | JSON language service                                   | JSON                 |
| [jdtls](https://github.com/eclipse/eclipse.jdt.ls)                                   | Java language server                                    | Java                 |
| [tsserver](https://github.com/typescript-language-server/typescript-language-server) | TypeScript & JavaScript Language Server                 | JavaScript           |
| [ltex](https://valentjn.github.io/ltex/)                                             | Grammar checking of various markup languages            | LaTex, Markdown      |
| [texlab](https://github.com/latex-lsp/texlab)                                        | Language Server Protocol for LaTeX                      | LaTex                |
| [lua_ls](https://github.com/LuaLS/lua-language-server)                               | A language server that offers Lua language support      | Lua                  |
| [intelephense](https://intelephense.com)                                             | PHP language server                                     | PHP                  |
| [ruff](https://github.com/astral-sh/ruff/)                                           | Fast Python linter and code formatter, written in Rust  | Python               |
| [rust_analyzer](https://github.com/rust-lang/rust-analyzer)                          | Rust compiler                                           | Rust                 |
| [tinymist](https://github.com/Myriad-Dreamin/tinymist)                               | Language server for Typst                               | Typst                |
| [volar](https://github.com/johnsoncodehk/volar)                                      | High-performance Vue language tooling based-on Volar.js | Vue                  |
| [yamlls](https://github.com/redhat-developer/yaml-language-server)                   | Language Server for YAML Files                          | YAML                 |
