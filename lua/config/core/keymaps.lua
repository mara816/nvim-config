vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set

-- COMMON KEYMAPS
keymap('n', '<C-s>', ':w<CR>', { desc = '[S]ave the file' })
keymap('i', '<C-s>', '<Esc>:w<CR>', { desc = '[S]ave the file' })
keymap('n', '<C-q>', ':q<CR>', { desc = '[Q]uit' })
keymap('i', '<C-q>', '<Esc>:q<CR>', { desc = '[Q]uit' })
keymap('n', '<C-Left>', ':vertical resize -5<CR>', { desc = 'Resize window left' })
keymap('n', '<C-Right>', ':vertical resize +5<CR>', { desc = 'Resize window right' })
keymap('n', '<leader>ex', ':Ex<CR>', { desc = '[Ex]it' })
keymap('n', '<C-Up>', ':move -2<CR>', { desc = 'Move line up' })
keymap('n', '<C-Down>', ':move +1<CR>', { desc = 'Move selected lines down' })
keymap('v', '<C-Up>', ":move '<-2<CR>gv", { desc = 'Visual - Move selected lines up' })
keymap('v', '<C-Down>', ":move '<+1<CR>gv", { desc = 'Visual - Move selected lines down' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Navigation between windows
--  See `:help wincmd` for a list of all window commands
keymap('n', '<A-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<A-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })

keymap('n', '<A-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<A-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

keymap('n', '<A-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<A-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })

keymap('n', '<A-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymap('n', '<A-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- COPILOT KEYBINDINGS
keymap('n', '<leader>ae', ':CopilotChatExplain<CR>', { desc = 'Explain code' })
keymap('n', '<leader>at', ':CopilotChatTests<CR>', { desc = 'Generate tests' })
keymap('n', '<leader>aR', ':CopilotChatRefactor<CR>', { desc = 'Refactor code' })
keymap('n', '<leader>ar', ':CopilotChatReview<CR>', { desc = 'Review code' })
keymap('n', '<leader>an', ':CopilotChatBetterNamings<CR>', { desc = 'Better naming' })
keymap('n', '<leader>af', ':CopilotChatFixError<CR>', { desc = 'Fix diagnostics' })
keymap('n', '<leader>al', ':CopilotChatReset<CR>', { desc = 'Clear buffer and chat history' })
keymap('n', '<leader>av', ':CopilotChatToggle<CR>', { desc = 'Toggle/view' })
keymap('x', '<leader>av', ':CopilotChatVisual<CR>', { desc = 'Open in vertical split' })
keymap('x', '<leader>ax', ':CopilotChatInline<CR>', { desc = 'Inline chat' })
keymap('n', '<leader>am', ':CopilotChatModels<CR>', { desc = 'Select model' })
keymap('n', '<leader>aa', ':CopilotChatAgents<CR>', { desc = 'Select agent' })
keymap('n', '<leader>ac', ':CopilotChatCommit<cr>', { desc = 'Generate commit message for all changes' })

keymap('n', '<leader>ap', function()
  require('CopilotChat').select_prompt() { context = { 'buffers' } }
end, { desc = 'Prompt actions' })

keymap('x', '<leader>ap', function()
  require('CopilotChat').select_prompt()
end, { desc = 'Prompt actions' })

keymap('n', '<leader>ai', function()
  local input = vim.fn.input 'Ask Copilot: '
  if input ~= '' then
    vim.cmd('CopilotChat ' .. input)
  end
end, { desc = 'Ask Copilot' })

keymap('n', '<leader>aq', function()
  local input = vim.fn.input 'Quick Chat: '
  if input ~= '' then
    vim.cmd('CopilotChatBuffer ' .. input)
  end
end, { desc = 'Quick chat' })

-- local opts = { silent = true }

-- -- Set <C-y> to accept copilot suggestion
-- keymap('i', '<C-y>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
--
-- -- Set <C-i> to accept line
-- keymap('i', '<C-i>', '<Plug>(copilot-accept-line)', opts)
--
-- -- Set <C-j> to next suggestion, <C-k> to previous suggestion, <C-l> to suggest
-- keymap('i', '<C-j>', '<Plug>(copilot-next)', opts)
-- keymap('i', '<C-k>', '<Plug>(copilot-previous)', opts)
-- keymap('i', '<C-l>', '<Plug>(copilot-suggest)', opts)
--
-- -- Set <C-d> to dismiss suggestion
-- keymap('i', '<C-d>', '<Plug>(copilot-dismiss)', opts)
