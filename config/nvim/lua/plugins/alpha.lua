local alpha = require("alpha")
local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local col = function(strlist, opts)
  -- strlist is a TABLE of TABLES, representing columns of text
  -- opts is a text display option

  -- column spacing
  local padding = 6
  -- fill lines up to the maximim length with 'fillchar'
  local fillchar = " "
  -- columns padding char (for testing)
  local padchar = " "

  -- define maximum string length in a table
  local maxlen = function(str)
    local max = 0
    for i in pairs(str) do
      if #str[i] > max then
        max = #str[i]
      end
    end
    return max
  end

  -- add as much right-padding to align the text block
  local pad = function(str, max)
    local strlist = {}
    for i in pairs(str) do
      if #str[i] < max then
        local newstr = str[i] .. string.rep(fillchar, max - #str[i])
        table.insert(strlist, newstr)
      else
        table.insert(strlist, str[i])
      end
    end
    return strlist
  end

  -- this is a table for text strings
  local values = {}
  -- process all the lines
  for i = 1, maxlen(strlist) do
    local str = ""
    -- process all the columns but last, because we dont wand extra padding
    -- after last column
    for column = 1, #strlist - 1 do
      local maxstr = maxlen(strlist[column])
      local padded = pad(strlist[column], maxstr)
      if strlist[column][i] == nil then
        str = str .. string.rep(fillchar, maxstr) .. string.rep(padchar, padding)
      else
        str = str .. padded[i] .. string.rep(padchar, padding)
      end
    end

    -- lets process the last column, no extra padding
    do
      local maxstr = maxlen(strlist[#strlist])
      local padded = pad(strlist[#strlist], maxstr)
      if strlist[#strlist][i] == nil then
        str = str .. string.rep(fillchar, maxlen(strlist[#strlist]))
      else
        str = str .. padded[i]
      end
    end

    -- insert result into output table
    table.insert(values, { type = "text", val = str, opts = opts })
  end

  return values
end

-- DEFAULT THEME
local default = {}

default.ascii = {
"⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⣀⣤⣶⣾⣿⣿⣷⣶⣤⣀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠜⠉⣿⡆⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢰⣿⠉⠃⠀⠀⠀⠀⠀",
"⠀⢀⣤⣴⣦⣄⣴⠟⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡎⢻⣦⣠⣴⣦⣄⠀⠀",
"⠀⡞⠁⣠⣾⢿⣧⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣽⡿⣷⣄⠈⢷⠀",
"⠀⣠⣾⠟⠁⢸⣿⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⣿⡇⠈⠻⣷⣄⠀",
"⣰⡿⠁⠀⢀⣾⣏⣾⣄⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⣰⣷⣹⣷⠀⠀⠈⢿⣆",
"⣿⡇⠀⢠⣾⠏⢸⣿⣿⣿⣿⠋⢻⣿⣿⣿⣿⡟⠙⣿⣿⣿⣿⡇⠹⣷⡀⠀⢸⣿",
"⠹⣿⣴⡿⠋⠀⠈⠛⠉⣹⣿⣦⣄⡹⣿⣿⣋⣠⣶⣿⣏⠉⠛⠁⠀⠙⢿⣦⣿⠏",
"⠀⣸⣿⠿⠿⣿⣾⣿⡿⠿⣿⣿⣿⣿⡆⢰⣿⣿⣿⣿⠿⢿⣿⣶⣿⠿⠿⣻⣇⠀",
"⠀⣿⡇⢀⣴⣶⣤⣀⣴⣿⠿⣻⡿⣿⣧⣾⣿⢿⣟⠿⣿⣦⣀⣤⣶⣦⠀⢸⣿⠀",
"⠀⢿⣧⠈⠃⢀⣵⣿⡋⠁⢀⣿⡷⣿⡇⢻⣿⣿⣿⡀⠈⢛⣿⣮⡀⠘⠀⣼⡟⠀",
"⠀⠈⠻⣷⣤⣟⣋⣿⣧⣴⡿⠋⠀⣿⡇⢸⣿⠀⠙⢿⣦⣼⣿⣙⣻⣤⣾⠟⠁⠀",
"⠀⠀⠀⠈⢽⣿⠛⢻⣏⢉⣤⣶⣶⣿⠁⠈⣿⣶⣶⣤⡉⣽⡟⠛⣿⡏⠁⠀⠀⠀",
"⠀⠀⠀⠀⠈⠿⣷⣾⣾⣟⣉⣠⣿⢿⡇⢸⠿⣿⣄⣙⣻⣷⣷⣾⠿⠁⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠿⠛⢁⡼⠃⠘⢦⡈⠛⠿⠟⠃⠀⠀⠀⠀⠀⠀⠀⠀",
}


---default.ascii = {
---  "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
---  "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
---  "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
---  "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
---  "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
---  "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
---  "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
---  " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
---  " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
---  "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
---  "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
---}

default.header = {
  type = "text",
  val = default.ascii,
  opts = {
    position = "center",
    hl = "SpecialComment",
  },
}

-- key reference
local telescope = {
  "<spc>ff  find files",
  "<spc>fb  buffers",
  "<spc>fg  live grep",
  "<spc>fb  buffers",
  "<Ctrl-/> fuzzy search",
  "<spc>fh  help",
}

local buffers = {
  "<spc>bd   buff delete",
  "<spc>bn   buff next",
  "<spc>bp   buff prev",
}

local git_blame_and_lsp_utils = {
  "<spc>gbt  toggle blame",
  "<spc>gbo  open blame url",
  "",
  "<spc>lio  lsp organize",
  "<spc>lrn  lsp rename file",
  "<spc>ll   lsp import all",
}

local split = {
  "<spc>sl  vertical split",
  "<spc>sj  horizontal split",
  "<Ctrl-w> cycle splits",
}

local lsp_nav1 = {
  "<spc>gD  goto decl",
  "<spc>gd  goto def",
  "<spc>gi  goto impl",
  "<spc>]d  goto next",
  "<spc>[d  goto prev",
  "",
}

local lsp_nav2 = {
  "<spc>K    view hover",
  "<spc>E    open float",
  "<spc>lf   formatting",
  "<Ctrl-s>  sig help",
  "<spc>ca   code action",
  "<spc>vf   get refs",
}

local empty = {
  "",
  "",
  "",
  "",
  "",
}

default.buttons = {
  type = "group",
  val = {
    button("e", "  new", ":ene <BAR> startinsert <CR>"),
    button("c", "  config", ":e ~/.config/nvim/init.lua <CR>"),
    button("u", "  update", ":PackerSync<CR>"),
    button("q", "  quit", ":qa<CR>"),
  },
  position = "center",
}

default.block1 = {
  type = "group",
  val = col({ telescope, buffers, split }, {
    position = "center",
    hl = {
      { "SpecialKey", 0, -1 },
      -- { "MoreMsg", 13, 20 },
      -- { "MoreMsg", 39, 47 },
      -- { "MoreMsg", 67, 74 },
    },
  }),
  opts = {
    spacing = 0,
  },
}

default.block2 = {
  type = "group",
  val = col({ lsp_nav1, empty, lsp_nav2 }, {
    position = "center",
    hl = {
      { "SpecialKey", 0, -1 },
      -- { "MoreMsg", 12, 20 },
      -- { "MoreMsg", 43, 51 },
      -- { "MoreMsg", 67, 75 },
    },
  }),
  opts = {
    spacing = 0,
  },
}

-- load config
alpha.setup({
  layout = {
    { type = "padding", val = 1 },
    default.header,
    { type = "padding", val = 1 },
    default.buttons,
    { type = "padding", val = 1 },
    default.block1,
    { type = "padding", val = 1 },
    default.block2,
    { type = "padding", val = 20 },
  },
  opts = {},
})

-- autocmd
-- hide/unhide tabs when toggling Alpha
-- vim.cmd([[ autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2 ]])

