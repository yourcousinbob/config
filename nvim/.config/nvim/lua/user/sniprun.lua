local status_ok, sniprun = pcall(require, "sniprun")
if not status_ok then
    return
end

sniprun.setup({
    selected_interpreters = { "Python3_fifo" }, --# use those instead of the default for the current filetype
    repl_enable = { "Python3_fifo" }, --# enable REPL-like behavior for the given interpreters
    repl_disable = {}, --# disable REPL-like behavior for the given interpreters

    interpreter_options = { --# interpreter-specific options, see docs / :SnipInfo <name>
    },

    --# you can combo different display modes as desired and with the 'Ok' or 'Err' suffix
    display = {
        -- "Classic", --# display results in the command-line  area
        -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)

        -- "VirtualText",             --# display results as virtual text
        "TempFloatingWindow", --# display results in a floating window
        -- "LongTempFloatingWindow",  --# same as above, but only long results. To use with VirtualText[Ok/Err]
        -- "Terminal",                --# display results in a vertical split
        -- "TerminalWithCode",        --# display results and code history in a vertical split
        -- "NvimNotify",              --# display with the nvim-notify plugin
        -- "Api"                      --# return output to a programming interface
    },

    live_display = { "VirtualTextOk" }, --# display mode used in live_mode

    display_options = {
        terminal_width = 45, --# change the terminal display option width
        notification_timeout = 5, --# timeout for nvim_notify output
    },

    --# You can use the same keys to customize whether a sniprun producing
    show_no_output = {
        "Classic",
        "TempFloatingWindow", --# implies LongTempFloatingWindow, which has no effect on its own
    },

    --# customize highlight groups (setting this overrides colorscheme)
    snipruncolors = {
        -- SniprunVirtualTextOk = { bg = "#66eeff", fg = "#000000", ctermbg = "Cyan", cterfg = "Black" },
        SniprunFloatingWinOk = { fg = "#6A9589", ctermfg = "Cyan" },
        -- SniprunVirtualTextErr = { bg = "#881515", fg = "#000000", ctermbg = "DarkRed", cterfg = "Black" },
        SniprunFloatingWinErr = { fg = "#E82424", ctermfg = "DarkRed" },
    },

    borders = "single", --# display borders around floating windows
    --# possible values are 'none', 'single', 'double', or 'shadow'
    live_mode_toggle = "off", --# live mode toggle, see Usage - Running for more info
})
