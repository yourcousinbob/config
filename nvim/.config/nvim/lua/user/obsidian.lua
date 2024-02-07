local status_ok, obsidian = pcall(require, "obsidian")
if not status_ok then
	return
end

obsidian.setup({
	dir = "/mnt/BigBoy/BobVault",

	daily_notes = {
		folder = "daily",
		date_format = "%Y-%m-%d",
	},

	completion = {
		nvim_cmp = true,
		min_chars = 2,
		new_notes_location = "current_dir",
		-- Whether to add the output of the node_id_func to new notes in autocompletion.
		-- E.g. "[[Foo" completes to "[[foo|Foo]]" assuming "foo" is the ID of the note.
		prepend_note_id = true,
	},

	mappings = {
		-- ["gd"] = require("obsidian.mapping").gf_passthrough(),
	},

	open_notes_in = "current",
})

vim.keymap.set("n", "gd", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gd"
  end
end, { noremap = false, expr = true })
