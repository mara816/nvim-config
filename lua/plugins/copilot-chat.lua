local prompts = {
  -- Code related prompts
  Explain = 'Please explain how the following code works.',
  Review = 'Please review the following code and provide suggestions for improvement.',
  Tests = 'Please explain how the selected code works, then generate unit tests for it.',
  Refactor = 'Please refactor the following code to improve its clarity and readability.',
  FixCode = 'Please fix the following code to make it work as intended.',
  FixError = 'Please explain the error in the following text and provide a solution.',
  BetterNamings = 'Please provide better names for the following variables and functions.',
  Documentation = 'Please provide documentation for the following code.',
  SwaggerApiDocs = 'Please provide documentation for the following API using Swagger.',
  SwaggerJsDocs = 'Please write JSDoc for the following API using Swagger.',
  -- Text related prompts
  Summarize = 'Please summarize the following text.',
  Spelling = 'Please correct any grammar and spelling errors in the following text.',
  Wording = 'Please improve the grammar and wording of the following text.',
  Concise = 'Please rewrite the following text to make it more concise.',
}
-- return {
--  'CopilotC-Nvim/CopilotChat.nvim',
--  dependencies = {
--   { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
--   { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
--  },
--  -- build = 'make tiktoken', -- Only on MacOS or Linux
--  opts = {
--  },
--
--  -- See Configuration section for options
-- }
-- local IS_DEV = false
return {
  -- {
  --  'MeanderingProgrammer/render-markdown.nvim',
  --  optional = true,
  --  opts = {
  --   file_types = { 'markdown', 'copilot-chat' },
  --  },
  --  ft = { 'markdown', 'copilot-chat' },
  -- },
  -- { import = 'plugins.extras.copilot-vim' },
  -- dir = IS_DEV and '~/Projects/research/CopilotChat.nvim' or nil,
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'copilot-chat' },
    },
    ft = { 'markdown', 'copilot-chat' },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main', -- Use the main branch for the latest features
    -- version = "v3.3.0", -- Use a specific version to prevent breaking changes
    dependencies = {
      -- { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim', branch = 'master' },
      -- { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'ibhagwan/fzf-lua' },
      {
        'zbirenbaum/copilot.lua',
        opts = {
          suggestion = {
            enabled = not vim.g.ai_cmp,
            auto_trigger = true,
            keymap = {
              accept = '<Tab>', -- Accept suggestion with Ctrl + y
              next = '<C-n>', -- Next suggestion with Ctrl + n
              prev = '<C-p>', -- Previous suggestion with Ctrl + p
            },
          },
        },
      },
    },

    -- build = 'make tiktoken',
    opts = {
      question_header = '## User ',
      answer_header = '## Copilot ',
      error_header = '## Error ',
      chat_autocomplete = true,
      prompts = prompts,
      model = 'claude-3.7-sonnet-thought',
      mappings = {
        -- Use tab for completion
        complete = {
          detail = 'Use @<Tab> or /<Tab> for options.',
          insert = '<Tab>',
        },
        -- Close the chat
        close = {
          normal = 'q',
          insert = '<C-q>',
        },
        -- Reset the chat buffer
        reset = {
          normal = '<C-x>',
          insert = '<C-x>',
        },
        -- Submit the prompt to Copilot
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-s>',
        },
        -- Accept the diff
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>',
        },
        -- Show help
        show_help = {
          normal = 'g?',
        },
      },
    },
    config = function(_, opts)
      local chat = require 'CopilotChat'
      local user = vim.env.USER or 'User'
      user = user:sub(1, 1):upper() .. user:sub(2)
      opts.question_header = '  ' .. user .. ' '
      opts.answer_header = '  Copilot '
      require('fzf-lua').register_ui_select()
      chat.setup(opts)

      local select = require 'CopilotChat.select'
      vim.api.nvim_create_user_command('CopilotChatVisual', function(args)
        chat.ask(args.args, { selection = select.visual })
      end, { nargs = '*', range = true })
      --
      -- Inline chat with Copilot
      vim.api.nvim_create_user_command('CopilotChatInline', function(args)
        chat.ask(args.args, {
          selection = select.visual,
          window = {
            layout = 'float',
            relative = 'cursor',
            width = 1,
            height = 0.4,
            row = 1,
          },
        })
      end, { nargs = '*', range = true })

      -- -- Restore CopilotChatBuffer
      -- vim.api.nvim_create_user_command('CopilotChatBuffer', function(args)
      --  chat.ask(args.args, { selection = select.buffer })
      -- end, { nargs = '*', range = true })
      --
      -- -- Custom buffer for CopilotChat
      -- vim.api.nvim_create_autocmd('BufEnter', {
      --  pattern = 'copilot-*',
      --  callback = function()
      --   -- vim.opt_local.relativenumber = true
      --   vim.opt_local.number = true

      -- Get current filetype and set it to markdown if the current filetype is copilot-chat
      local ft = vim.bo.filetype
      if ft == 'copilot-chat' then
        vim.bo.filetype = 'markdown'
      end
      -- end,
      -- })
    end,
    event = 'VeryLazy',
  },
}
