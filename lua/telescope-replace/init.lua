local M = {}

-- Define the find-and-replace function
M.find_and_replace = function()
  require('telescope.builtin').live_grep {
    prompt_title = 'Find and Replace',
    attach_mappings = function(_, map)
      map('i', '<C-e>', function(prompt_bufnr)
        local input = require('telescope.actions.state').get_current_line() -- Text to find
        require('telescope.actions').close(prompt_bufnr)
        local replacement = vim.fn.input('Replace with: ') -- Prompt for replacement text
        local escaped_input = vim.fn.escape(input, "/") -- Escape search term
        local escaped_replacement = vim.fn.escape(replacement, "/\\") -- Escape replacement text
        vim.cmd(string.format("args `rg -l '%s'`", escaped_input)) -- Find files containing the text
        vim.cmd('argdo %s/' .. escaped_input .. '/' .. escaped_replacement .. '/g | update') -- Perform replacement
      end)
      return true
    end,
  }
end

return M