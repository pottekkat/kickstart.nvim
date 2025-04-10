return {
  -- Markdown-specific settings for elegant text wrapping
  {
    name = "markdown-wrap",
    ft = "markdown",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          -- Set textwidth to 79 for automatic wrapping
          vim.opt_local.textwidth = 79
          
          -- Enable soft wrapping with proper indentation
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true  -- Break lines at word boundaries
          vim.opt_local.breakindent = true  -- Preserve indentation when wrapping
          
          -- Format options for automatic text wrapping
          vim.opt_local.formatoptions:append("t")  -- Auto-wrap text using textwidth
          vim.opt_local.formatoptions:append("c")  -- Auto-wrap comments
          vim.opt_local.formatoptions:append("q")  -- Allow formatting comments with gq
          vim.opt_local.formatoptions:append("n")  -- Recognize numbered lists
          vim.opt_local.formatoptions:append("j")  -- Remove comment leader when joining lines
        end,
        desc = "Set Markdown-specific options for elegant text wrapping at 79 columns",
      })
    end,
  },
}