local colorscheme = "kanagawa"

local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
    return
end

kanagawa.setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = { bold = true },
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    terminalColors = true,
    specialReturn = true,    -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = true,      -- do not set background color
    dimInactive = false,     -- dim inactive window `:h hl-NormalNC`
    globalStatus = true,     -- adjust window separators highlight for laststatus=3
})

local my_colors = {
    waveRed = "#bf54b5",
    waveAqua2 = "#ab3e6d",
    sumiInk0 = "#1b1b24",
}

vim.opt.laststatus = 3
vim.opt.fillchars:append({
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┨",
    vertright = "┣",
    verthoriz = "╋",
})

kanagawa.setup({
    colors = {
        palette = my_colors,
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    overrides = function(colors)
        local theme = colors.theme
        local makeDiagnosticColor = function(color)
            local c = require("kanagawa.lib.color")
            return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
        end
        return {
            NormalFloat                = { bg = "none" },
            FloatBorder                = { bg = "none" },
            FloatTitle                 = { bg = "none" },
            TabLineFill                = { bg = "none" },

            NormalDark                 = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

            -- Popular plugins that open floats will link to NormalFloat by default;
            -- set their background accordingly if you wish to keep them dark and borderless
            LazyNormal                 = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            MasonNormal                = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
            TelescopeBorder            = { bg = "none" },

            DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
            DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
            DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
            DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
        }
    end,
})

vim.cmd("colorscheme " .. colorscheme)
