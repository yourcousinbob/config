local ok, glow = pcall(require, "glow") if not ok then
	return
end

glow.setup {
    border = "rounded",
    width_ratio = 0.5,
    height_ratio = 0.7
}

