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
