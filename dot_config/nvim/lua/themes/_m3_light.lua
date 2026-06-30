---@type Base46Table
local M = {}


M.base_30 = {
  deep_black = "#263238",
  white = "#37474F",
  -- darker_black = "#f7f7f7",
  darker_black = "#f7f7f7",
  black = "#ffffff", --  nvim bg
  black2 = "#ECEFF1",
  one_bg = "#ebebeb", -- real bg of onedark
  one_bg2 = "#e0e0e0",
  one_bg3 = "#d4d4d4",
  grey = "#c4c4c4",
  grey_fg = "#828282",
  grey_fg2 = "#a3a3a3",
  light_grey = "#848484",
  faded_grey = "#509050",
  red = "#EF5350",
  tintred = "#BF616A",
  baby_pink = "#b55dc4",
  pink = "#AB47BC",
  line = "#e0e0e0", -- for lines like vertsplit
  green = "#66BB6A",
  vibrant_green = "#75c279",
  nord_blue = "#42A5F5",
  blue = "#0075A0",
  yellow = "#d0b22b",
  sun = "#E2C12F",
  purple = "#2565aa",
  dark_purple = "#1247A7",
  teal = "#008080",
  orange = "#FF6F00",
  cream = "#e09680",
  clay = "#D08770",
  cyan = "#26C6DA",
  statusline_bg = "#ECEFF1",
  lightbg = "#e0e0e0",
  pmenu_bg = "#673AB7",
  folder_bg = "#4C566A",
}

M.base_16 = {
  base00 = M.base_30.black, -- default background
  base01 = M.base_30.black2, -- lighter background
  base02 = M.base_30.one_bg, -- selection background
  base03 = M.base_30.grey, -- comments and line highlighting
  base04 = M.base_30.grey_fg, -- dark foreground
  base05 = M.base_30.white, -- default foreground
  base06 = M.base_30.folder_bg, -- light foreground
  base07 = M.base_30.deep_black, -- light background
  base08 = M.base_30.purple, -- variables, errors
  base09 = M.base_30.blue, -- constants, numbers
  base0A = M.base_30.dark_purple, -- classes, warnings
  base0B = M.base_30.faded_grey, -- strings
  base0C = M.base_30.purple, -- escape characters
  base0D = M.base_30.pink, -- functions, methods
  base0E = M.base_30.purple, -- keywords
  base0F = M.base_30.blue, -- deprecated, specific
}

M.polish_hl = {
  treesitter = {
    -- ["@function"] = { fg = M.base_30.pink },
    -- ["@function.call"] = { fg = M.base_30.pink },
    -- ["@function.method.call"] = { fg = M.base_30.pink },
    -- ["@function"] = { bold = true },
    ["@function.builtin"] = { bold = true },
    ["@function.call"] = { bold = true },
    ["@function.method.call"] = { bold = true },
    ["@constructor"] = { fg = M.base_30.purple },
    ["@variable.parameter"] = { fg = M.base_30.white },
    ["@module"] = { fg = M.base_30.deep_black },
    ["@symbol"] = { fg = M.base_30.purple },
    ["@keyword"] = { fg = M.base_30.purple },
  },

  telescope = {
    TelescopeMatching = { fg = M.base_30.purple, bg = M.base_30.one_bg2 },
  },

  nvdash = {
    NvDashAscii = { fg = M.base_30.grey_fg, bg = M.base_30.purple },
  },
}

M.type = "light"

M = require("base46").override_theme(M, "nano-light")

return M
