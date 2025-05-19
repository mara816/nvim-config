vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- COMMON KEYMAPS
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = '[S]ave the file' })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { desc = '[S]ave the file' })
vim.keymap.set('n', '<C-q>', ':q<CR>', { desc = '[Q]uit' })
vim.keymap.set('i', '<C-q>', '<Esc>:q<CR>', { desc = '[Q]uit' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -5<CR>', { desc = 'Resize window left' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +5<CR>', { desc = 'Resize window right' })
vim.keymap.set('n', '<leader>ex', ':Ex<CR>', { desc = '[Ex]it' })
vim.keymap.set('n', '<C-Up>', ':move -2<CR>', { desc = 'Move line up' })
vim.keymap.set('n', '<C-Down>', ':move +1<CR>', { desc = 'Move selected lines down' })
vim.keymap.set('v', '<C-Up>', ":move '<-2<CR>gv", { desc = 'Visual - Move selected lines up' })
vim.keymap.set('v', '<C-Down>', ":move '<+1<CR>gv", { desc = 'Visual - Move selected lines down' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Navigation between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<A-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })

vim.keymap.set('n', '<A-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

vim.keymap.set('n', '<A-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })

vim.keymap.set('n', '<A-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- COPILOT KEYBINDINGS
vim.keymap.set('n', '<leader>cc', ':CopilotChat<CR>', { desc = 'Open Copilot Chat' })
vim.keymap.set('n', '<leader>cq', ':CopilotChatClose<CR>', { desc = 'Close Copilot Chat' })
vim.keymap.set('n', '<leader>cr', ':CopilotChatReset<CR>', { desc = 'Reset Copilot Chat' })
vim.keymap.set('n', '<leader>cm', ':CopilotChatModels<CR>', { desc = 'Choose language model' })
vim.keymap.set('n', '<leader>ca', ':CopilotChatAgents<CR>', { desc = 'Choose agent' })
