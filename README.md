# flutter.nvim

Neovim plugin for flutter development.

## Installation

Install with your favorite package manager (e.g. [lazy.nvim](https://github.com/folke/lazy.nvim)).

```lua
{
    "mskelton/flutter.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = true,
}
```

## Options

The following shows the available options with their configured defaults

```lua
require('flutter').setup({
    closing_labels = {
        highlight = "Comment", -- highlight for the closing label
        prefix = "// ", -- character(s) to use for close label e.g. // Widget
        enabled = true -- set to false to disable
    },
    hot_reload = true, -- Hot reload automatically on save
    lsp = {
        capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
        -- OR you can specify a function to deactivate or change or control how
        -- the config is created.
        capabilities = function(capabilities)
            capabilities.specificThingIDontWant = false
            return capabilities
        end,
    }
})
```

## Screenshots

### Closing Tags

[Closing tags](https://github.com/mskelton/flutter.nvim/assets/25914066/3d26d621-3392-4b8c-969a-259168c10d68)
