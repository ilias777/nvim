<div align="center">
  <img src="./logo/neovim.png" width="300">
</div>

<h1 align="center">Neovim Configuration</h1>

<div align="center">
  <img src="https://img.shields.io/badge/Made_with_Lua-blue?style=for-the-badge&logo=lua" />
</div>

<h4 align="center">
  <a href="https://github.com/ilias777/nvim#-features">Features</a> •
  <a href="https://github.com/ilias777/nvim#%EF%B8%8F-requirements">Requirements</a> •
  <a href="https://github.com/ilias777/nvim#-used-font">Font</a> •
  <a href="https://github.com/ilias777/nvim#%EF%B8%8F-installation">Installation</a> •
  <a href="https://github.com/ilias777/nvim/blob/main/README.md#-folder-and-file-structure">Folder structure</a> •
  <a href="https://github.com/ilias777/nvim#-configuration">Configuration</a> •
  <a href="https://github.com/ilias777/nvim#-plugins">Plugins</a> •
  <a href="https://github.com/ilias777/nvim/wiki">Wiki</a>
</h4>

## 🌟 Preview

<div align="center">
  <img width="1472" alt="startup" src="https://github.com/ilias777/nvim/assets/39212564/07531cc1-906a-4774-b0ab-8dbb7da92c04">
  <h6>Find files with Telescope</h6>
  <img width="1490" alt="p1" src="https://github.com/ilias777/nvim/assets/39212564/ae7056e1-172b-4ba5-b4cb-3581556fab1a">
  <h6>Show keybindings with which-key</h6>
  <img width="1528" alt="p2" src="https://github.com/ilias777/nvim/assets/39212564/f4bfaacb-7d43-4b22-ae49-ffd248d0b14f">
  <h6>File browser with Telescope</h6>
  <img width="1490" alt="p3" src="https://github.com/ilias777/nvim/assets/39212564/f3dfde21-3c6f-43c8-b69b-0b9559d5d424">
  <h6>Neo-tree file browser</h6>
  <img width="1490" alt="p4" src="https://github.com/ilias777/nvim/assets/39212564/81820deb-26a9-445c-aa00-e7cf174c3a20">
  <h6>Lazy.nvim</h6>
  <img width="1490" alt="p5" src="https://github.com/ilias777/nvim/assets/39212564/242cf526-c75a-45ad-8c46-b6aa05c68ff6">
  <h6>Mason.nvim</h6>
  <img width="1490" alt="p6" src="https://github.com/ilias777/nvim/assets/39212564/777f96a3-5be7-4537-84a0-7bd2da2c1388">
  <h6>Autocompletion with nvim-cmp</h6>
  <img width="1490" alt="p7" src="https://github.com/ilias777/nvim/assets/39212564/15a5c55d-3316-4db7-aba6-89868935214a">
</div>

## ✨ Features

- File explorer with [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Autocompletion with [CMP](https://github.com/hrsh7th/nvim-cmp)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) and [Neogit](https://github.com/NeogitOrg/neogit)
- Fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Formatting  with [conform.nvim](https://github.com/stevearc/conform.nvim) and Linting [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- Language Server Protocol with [Native LSP](https://github.com/neovim/nvim-lspconfig)
- Debug Adapter Protocol with [Nvim DAP](https://github.com/mfussenegger/nvim-dap)
- Beautiful UI with [Catppuccin](https://github.com/catppuccin/nvim) and [Noice.nvim](https://github.com/folke/noice.nvim)
- Fast code navigation with [flash.nvim](https://github.com/folke/flash.nvim)

## ⚡️ Requirements

- Neovim >= 0.8.0
- Git >= 2.19.0
- a [Nerd Font](https://www.nerdfonts.com/) (optional)

## 🔠 Used Font

- [Caskaydia Cove Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/CascadiaCode) - A new monospaced font that includes programming ligatures and is designed to enhance the modern look and feel of the Terminal.

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
├── lua                         # LUA FOLDER
│   ├── core
│   │   ├── autocommands.lua    # File to store all the autocommands
│   │   ├── usercommands.lua    # File to store all the usercommands
│   │   ├── keymaps.lua         # Keybindings
│   │   └── options.lua         # All Neovim options
│   └── plugins
│       ├── init.lua            # Many plugins in one file
│       ├── plugin_1.lua        # One or more plugins in one file
│       ├── plugin_2.lua        # One or more plugins in one file
│       ├── **
│       └── plugin_xx.lua
├── snippets
│   ├── javaspript.lua          # JavaScript snippets
│   └── lua.lua                 # Lua snippets
├── ftplugin
│   └── java.lua                # Java configuration
│── init.lua                    # Main file
└── cheatsheet.txt              # File for cheatsheet.nvim
```

## ⚙ Configuration

How to configure Neovim is explained in the [Wiki](https://github.com/ilias777/nvim/wiki)

### How to install or uninstall plugins

Look &rarr; [here](https://github.com/ilias777/nvim/wiki/Plugins)

### Setup a language server

Look &rarr; [here](https://github.com/ilias777/nvim/wiki/LSP)

### How to setup or change keymaps

Look &rarr; [here](https://github.com/ilias777/nvim/wiki/Set-new--or-change-keymaps)

### All keymaps

Look &rarr; [here](https://github.com/ilias777/nvim/wiki/All-Keymaps)

## 🔌 Plugins

- Over **90 Plugins** preinstalled
- Startuptime **~40ms - ~59ms**

<img width="1566" alt="startuptime" src="https://github.com/ilias777/nvim/assets/39212564/be49c54c-7f25-4a6c-98aa-719011e996c6">

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

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion plugin.

#### Formatter

- [conform.nvim](https://github.com/stevearc/conform.nvim) - Lightweight yet powerful formatter plugin for Neovim.

#### Linter

- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - An asynchronous linter plugin for Neovim.

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
- [hop.nvim](https://github.com/smoka7/hop.nvim) - Jump anywhere in a document.
- [nvim-spider](https://github.com/chrisgrieser/nvim-spider) - Use the w, e, b motions like a spider.

#### Git integration

- [advanced-git-search](https://github.com/aaronhallaert/advanced-git-search.nvim) - Search your git history by commit message, content and author with Telescope.
- [diffview.nvim](https://github.com/sindrets/diffview.nvim) - Interface for easily cycling through diffs.
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) - Git integration: signs, hunk actions, blame, etc.
- [neogit](https://github.com/NeogitOrg/neogit) - A Magit clone for Neovim

#### Utils

- [align.nvim](https://github.com/Vonr/align.nvim) - Aligning lines.
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - IndentLine replacement.
- [live-command.nvim](https://github.com/smjonas/live-command.nvim) - Text editing with immediate visual feedback.
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
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi) - Multiple cursors.
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Popup of keybindings.
- [yanky.nvim](https://github.com/gbprod/yanky.nvim) - Improved Yank and Put functionalities.
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

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - An extendable fuzzy finder. Find files, Filter, Preview, Pick. All in one!
- [telescope-emoji.nvim](https://github.com/xiyaowong/telescope-emoji.nvim) - An extension for telescope.nvim that allows you to search emojis 😃.
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) - A file browser extension for telescope.nvim.
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim) - Ability of picking symbols and insert them at point.
- [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) - Visualize your undo tree and fuzzy-search changes in it.
- [telescope-zoxide](https://github.com/jvgrootveld/telescope-zoxide) - An extension for telescope.nvim that allows you operate [zoxide](https://github.com/ajeetdsouza/zoxide) within Neovim.

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
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim) - Preview markdown on your browser.

### Preinstalled Language Servers

| Language Server                                                                      | Description                                             | Programming Language |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------- | -------------------- |
| [cssls](https://github.com/microsoft/vscode-css-languageservice)                     | Language services for CSS, LESS and SCSS                | CSS                  |
| [emmet_ls](https://github.com/aca/emmet-ls)                                          | Emmet support based on LSP                              | HMLT - CSS           |
| [html](https://github.com/microsoft/vscode-html-languageservice)                     | Language services for HTML                              | HTML                 |
| [jsonls](https://github.com/microsoft/vscode-json-languageservice)                   | JSON language service                                   | JSON                 |
| [jdtls](https://github.com/eclipse/eclipse.jdt.ls)                                   | Java language server                                    | Java                 |
| [tsserver](https://github.com/typescript-language-server/typescript-language-server) | TypeScript & JavaScript Language Server                 | JavaScript           |
| [ltex](https://valentjn.github.io/ltex/)                                             | Grammar checking of various markup languages            | LaTex, Markdown      |
| [texlab](https://github.com/latex-lsp/texlab)                                        | Language Server Protocol for LaTeX                      | LaTex                |
| [lua_ls](https://github.com/LuaLS/lua-language-server)                               | A language server that offers Lua language support      | Lua                  |
| [intelephense](https://intelephense.com)                                             | PHP language server                                     | PHP                  |
| [pyright](https://github.com/microsoft/pyright)                                      | Static Type Checker for Python                          | Python               |
| [rust_analyzer](https://github.com/rust-lang/rust-analyzer)                          | Rust compiler                                           | Rust                 |
| [volar](https://github.com/johnsoncodehk/volar)                                      | High-performance Vue language tooling based-on Volar.js | Vue                  |
| [yamlls](https://github.com/redhat-developer/yaml-language-server)                   | Language Server for YAML Files                          | YAML                 |
