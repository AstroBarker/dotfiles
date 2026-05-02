return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('gruvbox').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
        transparent_mode = true,
      }

      -- Load the colorscheme here.
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },
  {
    'jpwol/thorn.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      theme = nil, -- 'light' or 'dark' - defaults to vim.o.background if unset
      background = 'warm', -- options are 'warm' and 'cold'

      transparent = true, -- transparent background
      terminal = true, -- terminal colors

      styles = {
        keywords = { italic = true, bold = false },
        comments = { italic = true, bold = false },
        strings = { italic = true, bold = false },

        diagnostic = {
          underline = true, -- if true, flat underlines will be used. Otherwise, undercurls will be used

          -- true will apply the bg highlight, false applies the fg highlight
          error = { highlight = true },
          hint = { highlight = false },
          info = { highlight = false },
          warn = { highlight = false },
        },
      },

      on_highlights = function(hl, palette) end, -- apply your own highlights
    },
    config = function()
      -- Load the colorscheme here.
      vim.cmd.colorscheme 'thorn'
    end,
  },
  {
    'reobin/olive-crt.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      theme = nil, -- 'light' or 'dark' - defaults to vim.o.background if unset
      background = 'warm', -- options are 'warm' and 'cold'

      transparent = true, -- transparent background
      terminal = true, -- terminal colors

      styles = {
        keywords = { italic = true, bold = false },
        comments = { italic = true, bold = false },
        strings = { italic = true, bold = false },

        diagnostic = {
          underline = true, -- if true, flat underlines will be used. Otherwise, undercurls will be used

          -- true will apply the bg highlight, false applies the fg highlight
          error = { highlight = true },
          hint = { highlight = false },
          info = { highlight = false },
          warn = { highlight = false },
        },
      },

      on_highlights = function(hl, palette) end, -- apply your own highlights
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
