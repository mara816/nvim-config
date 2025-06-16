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
vim.cmd [[ autocmd BufNewFile,BufRead *.bicepparam set filetype=bicep-params ]]

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

-- vim.lsp.config('powershell_es', {
--   -- bundle_path = '/home/mteu/.local/share/nvim/mason/packages/powershell-editor-services/PowerShellEditorServices',
--   -- bundle_path = 'C:\\Users\\mteu\\Downloads\\PowerShellEditorServices\\PowerShellEditorServices\\Start-EditorServices.ps1',
--   shell = 'powershell.exe',
--   cmd = {
--     'powershell.exe',
--     '-NoLogo',
--     '-NoProfile',
--     '-File',
--     'C:\\Users\\mteu\\Downloads\\PowerShellEditorServices\\PowerShellEditorServices\\Start-EditorServices.ps1',
--   },
--   init_options = {
--     enableProfileLoading = false,
--   },
-- })
-- --
-- vim.lsp.enable 'powershell_es'
