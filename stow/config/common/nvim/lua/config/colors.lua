vim.cmd("highlight clear")
if vim.g.syntax_on then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "terminal"

local function hi(name, fg, bg, attrs)
  vim.api.nvim_set_hl(0, name, {
    ctermfg = fg,
    ctermbg = bg,
    cterm = attrs or {},
  })
end

local function link(name, target)
  vim.api.nvim_set_hl(0, name, { link = target })
end

hi("Normal", 7)
hi("NormalFloat", 7, 0)
hi("FloatBorder", 8, 0)
hi("Cursor", 0, 7)
hi("CursorLine", nil, 0)
hi("ColorColumn", nil, 0)
hi("LineNr", 8)
hi("CursorLineNr", 14, nil, { bold = true })
hi("SignColumn", 8)
hi("NonText", 8)
hi("WinSeparator", 8)
hi("MatchParen", 14, nil, { bold = true, underline = true })
hi("Visual", 0, 5)
hi("Search", 0, 3)
hi("IncSearch", 0, 14)
hi("Pmenu", 7, 0)
hi("PmenuSel", 0, 4)
hi("PmenuSbar", nil, 8)
hi("PmenuThumb", nil, 7)
hi("StatusLine", 7, 0)
hi("StatusLineNC", 8, 0)
hi("TabLine", 8, 0)
hi("TabLineSel", 14, 0, { bold = true })
hi("Folded", 8, 0, { italic = true })
hi("Directory", 4)
hi("Title", 13, nil, { bold = true })
hi("ErrorMsg", 9, nil, { bold = true })
hi("WarningMsg", 11)
hi("MoreMsg", 6)

hi("Comment", 8, nil, { italic = true })
hi("Constant", 13)
hi("String", 2)
hi("Number", 9)
hi("Boolean", 6)
hi("Identifier", 7)
hi("Function", 12)
hi("Statement", 4, nil, { bold = true })
hi("Operator", 5)
hi("PreProc", 6)
hi("Type", 5)
hi("Special", 13)
hi("Delimiter", 7)
hi("Underlined", 4, nil, { underline = true })
hi("Ignore", 8)
hi("Todo", 11, nil, { bold = true, underline = true })
hi("DiffAdd", 2, 0)
hi("DiffChange", 3, 0)
hi("DiffDelete", 1, 0)
hi("DiffText", 0, 3, { bold = true })

for severity, color in pairs({ Error = 9, Warn = 11, Info = 12, Hint = 14, Ok = 2 }) do
  hi("Diagnostic" .. severity, color)
  hi("DiagnosticUnderline" .. severity, color, nil, { underline = true })
end
hi("DiagnosticUnnecessary", 8, nil, { italic = true })
for kind, color in pairs({ Bad = 9, Cap = 12, Rare = 13, Local = 14 }) do
  hi("Spell" .. kind, color, nil, { underline = true })
end

-- Explicit links keep modern syntax and plugin UI on the same ANSI palette.
for name, target in pairs({
  CursorColumn = "CursorLine", FoldColumn = "SignColumn",
  SpecialKey = "NonText", Whitespace = "NonText", EndOfBuffer = "NonText",
  NormalNC = "Normal", FloatTitle = "Title", WinBar = "StatusLine",
  WinBarNC = "StatusLineNC", TabLineFill = "StatusLineNC",
  CurSearch = "IncSearch", Substitute = "IncSearch", WildMenu = "PmenuSel",
  PmenuMatch = "Function", PmenuMatchSel = "PmenuSel",
  Conceal = "Comment", Question = "MoreMsg", ModeMsg = "MoreMsg",
  Error = "ErrorMsg", Keyword = "Statement",
  ["@variable"] = "Identifier", ["@variable.builtin"] = "Special",
  ["@property"] = "Identifier", ["@function.builtin"] = "Special",
  ["@markup.heading"] = "Title", ["@markup.link"] = "Underlined",
  GitSignsAdd = "DiagnosticOk", GitSignsChange = "DiagnosticWarn",
  GitSignsDelete = "DiagnosticError",
  MiniStatuslineDevinfo = "StatusLine", MiniStatuslineFileinfo = "StatusLine",
  MiniStatuslineFilename = "StatusLine", MiniStatuslineInactive = "StatusLineNC",
}) do
  link(name, target)
end

for mode, color in pairs({ Normal = 4, Insert = 2, Visual = 5, Replace = 1, Command = 3, Other = 6 }) do
  hi("MiniStatuslineMode" .. mode, 0, color, { bold = true })
end
