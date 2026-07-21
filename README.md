# nvim

Personal Neovim config built on [lazy.nvim](https://github.com/folke/lazy.nvim)

## Structure

```
init.lua                -- Entry point: Loader + bootstraps lazy
lua/config/
  options.lua           -- Editor options
  keymap.lua            -- Keymap
  lazy.lua              -- lazy.nvim bootstrap + setup
lua/plugins/
  *.lua                 -- Plugins
```

## Plugins

| Plugin                                                                   | Purpose                                                                                                 |
| ------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------- |
| [snacks.nvim](https://github.com/folke/snacks.nvim)                      | Collection of plugins: Picker/fuzzy finder, file explorer, dashboard, git integration, notifications... |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)               | LSP client configuration                                                                                |
| [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) | TypeScript/JavaScript LSP                                                                               |
| [blink.cmp](https://github.com/saghen/blink.cmp)                         | Code Completions                                                                                        |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim)                    | Lua LSP support for the Neovim API                                                                      |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)    | Syntax highlighting, indentation                                                                        |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                 | Formatting on save                                                                                      |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint)                   | Linting on save                                                                                         |
| [nvim-java](https://github.com/nvim-java/nvim-java)                      | Java LSP setup                                                                                          |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)               | Auto-close brackets/quotes                                                                              |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)             | Auto-close/rename HTML/JSX tags                                                                         |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)            | Floating terminal                                                                                       |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)             | Statusline                                                                                              |
| [noice.nvim](https://github.com/folke/noice.nvim)                        | UI for cmdline/messages                                                                                 |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Live markdown preview in browser                                                                        |
| [live-server.nvim](https://github.com/barrettruth/live-server.nvim)      | Live-reloading local dev server                                                                         |
| [rose-pine](https://github.com/rose-pine/neovim)                         | Rose Pine Colorscheme                                                                                   |

## Requirements

Install via Homebrew:

```zsh
brew install ripgrep fd lazygit gh lua-language-server vscode-langservers-extracted marksman stylua clang-format prettier eslint gradle maven tree-sitter-cli
```

| Package                      | Used for                               |
| ---------------------------- | -------------------------------------- |
| ripgrep, fd                  | File/text search                       |
| lazygit                      | Git UI                                 |
| gh                           | GitHub integration                     |
| lua-language-server          | Lua LSP                                |
| vscode-langservers-extracted | HTML/CSS/JSON LSPs                     |
| marksman                     | Markdown LSP                           |
| stylua                       | Lua formatter                          |
| clang-format                 | C formatter                            |
| prettier                     | HTML/CSS/JS/TS/Markdown/JSON formatter |
| eslint                       | JS/TS linter                           |
| gradle, maven                | Java project/build support             |
| tree-sitter-cli              | Compiling treesitter parsers           |

## Install

```zsh
git clone https://github.com/Moritz2k1/nvim.git ~/.config/nvim
nvim
```
