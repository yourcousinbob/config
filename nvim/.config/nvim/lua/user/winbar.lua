local M = {}

M.winbar_filetype_exclude = {
	"help",
	"dashboard",
	"packer",
	"NvimTree",
	"alpha",
	"Outline",
	"toggleterm",
	"Aerial",
	"harpoon",
}

local get_filename = function()
	local filename = vim.fn.expand("%:t")
	local extension = vim.fn.expand("%:e")
	local f = require("user.functions")

	if not f.isempty(filename) then
		local file_icon, file_icon_color =
			require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })

		local hl_group = "FileIconColor" .. extension

		vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
		if f.isempty(file_icon) then
			file_icon = ""
			file_icon_color = ""
		end

		return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
	end
end

local get_gps = function()
	local status_gps_ok, gps = pcall(require, "nvim-navic")
	if not status_gps_ok then
		return ""
	end

	local status_ok, gps_location = pcall(gps.get_location, {})
	if not status_ok then
		return ""
	end

	if not gps.is_available() or gps_location == "error" then
		return ""
	end

	if not require("user.functions").isempty(gps_location) then
		return '' .. " " .. gps_location
	else
		return ""
	end
end
local excludes = function()
	if vim.tbl_contains(M.winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return true
	end
	return false
end

M.get_winbar = function()
	if excludes() then
		return
	end
	local f = require("user.functions")
	local value = get_filename()

	local gps_added = false
	if not f.isempty(value) then
		local gps_value = get_gps()
		value = value .. " " .. gps_value
		if not f.isempty(gps_value) then
			gps_added = true
		end
	end

	if not f.isempty(value) and f.get_buf_option("mod") then
		local mod = "%#LineNr#" .. "" .. "%*"
		if gps_added then
			value = value .. " " .. mod
		else
			value = value .. mod
		end
	end

	local status_ok, _ = pcall(vim.api.nvim_set_option_value, "winbar", value, { scope = "local" })
	if not status_ok then
		return
	end
end

return M
