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
  <a href="#-plugins">Plugins</a> •
  <a href="https://github.com/ilias777/nvim/wiki">Wiki</a>
</h4>

## 🌟 Preview

<details>
  <summary>Dark mode</summary>
  <div align="center">
    <img width="1732" alt="startup" src="https://github.com/user-attachments/assets/25de3edb-4205-49ee-aaf3-c8693816acd5" />
    <h6>Find files with Telescope</h6>
    <img width="1732" alt="p1" src="https://github.com/user-attachments/assets/6a6507fd-84ba-4640-9558-57fa5833c854" />
    <h6>Show keybindings with which-key</h6>
    <img width="1732" alt="p2" src="https://github.com/user-attachments/assets/8fab17ea-ba05-4165-8494-2c8c0cb02a5a" />
    <h6>File browser with Telescope</h6>
    <img width="1732" alt="p3" src="https://github.com/user-attachments/assets/ae108b6c-9991-4c2e-a547-aac3cf25ec4a" />
    <h6>Find help with Telescope</h6>
    <img width="1732" alt="p4" src="https://github.com/user-attachments/assets/4ac2b257-a87a-4b46-b8a8-8f4ee77b6be7" />
    <h6>Neo-tree file browser</h6>
    <img width="1732" alt="p5" src="https://github.com/user-attachments/assets/b5bd5077-68d1-4d37-a6a5-c237e9e129a0" />
    <h6>Neo-tree floating file browser</h6>
    <img width="1732" alt="p6" src="https://github.com/user-attachments/assets/73b38070-7669-47dd-b4fb-eb40eef64ae4" />
    <h6>Lazy.nvim</h6>
    <img width="1732" alt="p7" src="https://github.com/user-attachments/assets/8aa0f446-a368-4ca6-ba2a-0541d87869d7" />
    <h6>Mason.nvim</h6>
    <img width="1732" alt="p8" src="https://github.com/user-attachments/assets/f392e6e3-9d1b-45a0-ac57-76d80c2606f3" />
    <h6>Autocompletion with blink.cmp</h6>
    <img width="1732" alt="p9" src="https://github.com/user-attachments/assets/242d43ae-fd69-4593-bb97-6ae6ed7f5805" />
  </div>
</details>
<details>
  <summary>Light mode</summary>
  <div align="center">
    <img width="1732" alt="startup-l" src="https://github.com/user-attachments/assets/c7da7245-744f-4496-ad2b-5740426a5ad4" />
    <h6>Find files with Telescope</h6>
    <img width="1732" alt="p1-l" src="https://github.com/user-attachments/assets/ce243b8e-77e2-47ed-83d5-1d065e609c9d" />
    <h6>Show keybindings with which-key</h6>
    <img width="1732" alt="p2-l" src="https://github.com/user-attachments/assets/e771bd21-9f77-4ff3-9ed0-ce8853d280a3" />
    <h6>File browser with Telescope</h6>
    <img width="1732" alt="p3-l" src="https://github.com/user-attachments/assets/3de86af8-5196-493a-b934-1c854a2e41f1" />
    <h6>Find help with Telescope</h6>
    <img width="1732" alt="p4-l" src="https://github.com/user-attachments/assets/5db46cca-ca95-49a3-8f1a-f150994719df" />
    <h6>Neo-tree file browser</h6>
    <img width="1732" alt="p5-l" src="https://github.com/user-attachments/assets/f7ee43a9-e1e9-4c15-9d39-18c3498a5437" />
    <h6>Neo-tree floating file browser</h6>
    <img width="1732" alt="p6-l" src="https://github.com/user-attachments/assets/34802054-7e7d-472a-a843-d533b2ed0c18" />
    <h6>Lazy.nvim</h6>
    <img width="1732" alt="p7-l" src="https://github.com/user-attachments/assets/2ab29724-1c1a-4117-a94a-2b703e0eef26" />
    <h6>Mason.nvim</h6>
    <img width="1732" alt="p8-l" src="https://github.com/user-attachments/assets/e7373f79-2875-4d1a-8a6f-74a0283585ba" />
    <h6>Autocompletion with blink.cmp</h6>
    <img width="1732" alt="p9-l" src="https://github.com/user-attachments/assets/58678bb7-4dbe-425c-ad34-5071617a87e4" />
  </div>
</details>
<details>
  <summary>Modified light colors</summary>
  <div align="center">
    <h4>All light colors for catppuccin latte are modified with more contrast for better readability.</h4>
    See the difference:
    <h6>Original catppuccin latte colors</h6>
    <img width="1208" alt="origin" src="https://github.com/user-attachments/assets/92e35d2b-c318-4042-907f-8668dae09b14" />
    <h6>Modified catppuccin latte colors</h6>
    <img width="1208" alt="modified" src="https://github.com/user-attachments/assets/fccdf775-2886-455b-b61d-9286eefa880e" />
  </div>
</details>

## ✨ Features

- File explorer with [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Autocompletion with [blink.cmp](https://github.com/Saghen/blink.cmp)
- Git integration with [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) and [Neogit](https://github.com/NeogitOrg/neogit)
- Fuzzy finding with [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Formatting with [conform.nvim](https://github.com/stevearc/conform.nvim) and Linting [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- Language Server Protocol
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
~/.config/nvim/
├── lua/                                # Lua Folder
│   ├── config/                         # Configuration
│   │   ├── lsp/                        # LSP Configuration Folder
│   │   │   ├── servers/                # All LSP Servers
│   │   │   │   ├── <servername_1>.lua
│   │   │   │   ├── <servername_2>.lua
│   │   │   │   └── **
│   │   │   ├── diagnostic_config.lua
│   │   │   ├── diagnostic_keymaps.lua
│   │   │   ├── global.lua              # Main LSP Configuration File
│   │   │   └── lsp_keymaps.lua
│   │   ├── autocommands.lua
│   │   ├── cursor.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   ├── options.lua
│   │   └── usercommands.lua
│   ├── lib/
│   │   └── icons.lua
│   ├── plugins/                        # All Plugins
│   │   ├── <plugin-name_1>.lua
│   │   ├── <plugin-name_2>.lua
│   │   └── **
│   └── utils/                          # Utility Files
│       ├── <utility-file_1>.lua
│       ├── <utility-file_2>.lua
│       └── **
├── snippets/
│   └── lua.json
├── spell/
│   ├── en.utf-8.spl
│   └── **
├── .luarc.json
└── init.lua                            # Main File
```

## 🔌 Plugins

- Over **90 Plugins** preinstalled
- Startuptime **~40ms - ~59ms**
- Testet on MacOS 14.5 - M1 Pro

<img width="1732" alt="startuptime" src="https://github.com/user-attachments/assets/45e9553e-0573-4825-9014-ba81e0e0b88c" />

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
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast statusline.

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
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - The fastest Neovim colorizer.
- [nvim-notify](https://github.com/rcarriga/nvim-notify) - A fancy, configurable, notification manager.
- [nvim-surround](https://github.com/kylechui/nvim-surround) - A plugin for adding/changing/deleting surrounding delimiter pairs.
- [nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler) - Invert text.
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) - Ultra fold with modern looking and performance boosting.
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - Show dev icons.
- [rainbow-delimiters](https://github.com/HiPhish/rainbow-delimiters.nvim) - Rainbow delimiters for Neovim with Treesitter.
- [ssr.nvim](https://github.com/cshuaimin/ssr.nvim) - Treesitter based structural search and replace plugin.
- [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) - Find And Replace plugin for neovim.
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
- [typst-preview.nvim](https://github.com/chomosuke/typst-preview.nvim) - markdown, Typst, latex, html(inline) & YAML previewer.

### Preinstalled Language Servers

| Language Server                                                                      | Description                                             | Programming Language |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------- | -------------------- |
| [cssls](https://github.com/microsoft/vscode-css-languageservice)                     | Language services for CSS, LESS and SCSS                | CSS                  |
| [emmet-language-server](https://github.com/olrtg/emmet-language-server)              | A language server for emmet.io                          | HMLT - CSS           |
| [html](https://github.com/microsoft/vscode-html-languageservice)                     | Language services for HTML                              | HTML                 |
| [jsonls](https://github.com/microsoft/vscode-json-languageservice)                   | JSON language service                                   | JSON                 |
| [jdtls](https://github.com/eclipse/eclipse.jdt.ls)                                   | Java language server                                    | Java                 |
| [ts_ls](https://github.com/typescript-language-server/typescript-language-server)    | TypeScript & JavaScript Language Server                 | JavaScript           |
| [ltex](https://valentjn.github.io/ltex/)                                             | Grammar checking of various markup languages            | LaTex, Markdown      |
| [texlab](https://github.com/latex-lsp/texlab)                                        | Language Server Protocol for LaTeX                      | LaTex                |
| [lua_ls](https://github.com/LuaLS/lua-language-server)                               | A language server that offers Lua language support      | Lua                  |
| [ruff](https://github.com/astral-sh/ruff/)                                           | Fast Python linter and code formatter, written in Rust  | Python               |
| [rust_analyzer](https://github.com/rust-lang/rust-analyzer)                          | Rust compiler                                           | Rust                 |
| [tinymist](https://github.com/Myriad-Dreamin/tinymist)                               | Language server for Typst                               | Typst                |
| [vue_ls](https://github.com/vuejs/language-tools)                                    | High-performance Vue language tooling based-on Volar.js | Vue                  |
| [yamlls](https://github.com/redhat-developer/yaml-language-server)                   | Language Server for YAML Files                          | YAML                 |
