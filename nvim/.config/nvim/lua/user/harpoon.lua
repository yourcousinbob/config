local harpoon_status_ok, harpoon = pcall(require, "harpoon")
if not harpoon_status_ok then
	return
end

harpoon:setup({})
