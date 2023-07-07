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

- Over **80 Plugins** preinstalled
- Startuptime **~100ms - 120ms**

<img width="1452" alt="startup" src="https://github.com/ilias777/nvim/assets/39212564/fb09cd4f-e8a7-4e02-9da4-fe510cd20a7d">

#### Package Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim)

#### File Explorer

- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)

#### Plugins for LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [mason](https://github.com/williamboman/mason.nvim)
- [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)

#### Autocompletion

- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

#### Formatter and linter

- [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)

#### Colorscheme

- [Catppuccin](https://github.com/catppuccin/nvim)

#### Snippet Engine

- [Luasnip](https://github.com/L3MON4D3/LuaSnip)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)

#### Tabline and Statusline

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [feline.nvim](https://github.com/freddiehaddad/feline.nvim)

#### Motion

- [cinnamon.nvim](https://github.com/declancm/cinnamon.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [hop.nvim](https://github.com/phaazon/hop.nvim)
- [nvim-spider](https://github.com/chrisgrieser/nvim-spider)

#### Git integration

- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [neogit](https://github.com/NeogitOrg/neogit)

#### Utils

- [align.nvim](https://github.com/Vonr/align.nvim)
- [cheatsheet.nvim](https://github.com/sudormrfbin/cheatsheet.nvim)
- [focus.nvim](https://github.com/beauwilliams/focus.nvim)
- [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [live-command.nvim](https://github.com/smjonas/live-command.nvim)
- [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua)
- [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [nvim-surround](https://github.com/kylechui/nvim-surround)
- [nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler)
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [sentiment.nvim](https://github.com/utilyre/sentiment.nvim)
- [ssr.nvim](https://github.com/cshuaimin/ssr.nvim)
- [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim)
- [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)
- [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim)

#### Treesitter

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treehopper](https://github.com/mfussenegger/nvim-treehopper)
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter-textsubjects](https://github.com/RRethy/nvim-treesitter-textsubjects)
- [ts-node-action](https://github.com/ckolkey/ts-node-action)
- [ts-playground](https://github.com/nvim-treesitter/playground)

#### Telescope

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-emoji.nvim](https://github.com/xiyaowong/telescope-emoji.nvim)
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim)
- [telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim)

#### Comments

- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [comment-box.nvim](https://github.com/LudoPinelli/comment-box.nvim)
- [nvim-comment-frame](https://github.com/s1n7ax/nvim-comment-frame)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

#### Degub Adapter Protocol

- [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- [nvim-dap-vscode-js](https://github.com/mxsdev/nvim-dap-vscode-js)

#### Writing

- [vimtex](https://github.com/lervag/vimtex)
