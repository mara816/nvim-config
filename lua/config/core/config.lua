-- pcall(require("telescope").load_extension, "fzf")
-- pcall(require("telescope").load_extension, "ui-select")
-- pcall(require("telescope").load_extension, "flutter")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Command-completion
require('command-completion').setup()

-- Harpoon2
local harpoon = require 'harpoon'

harpoon:setup()

local harpoon_extensions = require 'harpoon.extensions'
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

-- harpoon2 keymaps
vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<c-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
