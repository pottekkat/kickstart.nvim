return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    keys = {
      {
        '<leader>cc',
        function()
          require('CopilotChat').toggle() -- Toggle the chat window
        end,
        desc = 'Copilot: [C]ode [C]hat',
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}