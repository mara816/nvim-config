require 'config.core.settings'
require 'config.core.config'
require 'config.core.keymaps'
require 'config.core.lazy'
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
