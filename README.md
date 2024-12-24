# Telescope Replace

A simple Neovim extension for dynamic find-and-replace across files using Telescope and ripgrep.

## Installation

### Using Lazy.nvim

```lua
{
  "sabinsthnp/telescope-replace",
  config = function()
    vim.keymap.set('n', '<leader>fx', function()
      require('telescope-replace').find_and_replace()
    end, { desc = 'Find and replace across files' })
  end,
  dependencies = { "nvim-telescope/telescope.nvim" }
}
