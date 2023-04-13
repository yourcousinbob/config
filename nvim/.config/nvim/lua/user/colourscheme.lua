local colorscheme = "kanagawa"

local status_ok, kanagawa = pcall(require, "kanagawa")
if not status_ok then
	return
end

kanagawa.setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	variablebuiltinStyle = { italic = true },
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	globalStatus = true, -- adjust window separators highlight for laststatus=3
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

kanagawa.setup({ colors = { palette = my_colors } })

vim.cmd("colorscheme " .. colorscheme)
