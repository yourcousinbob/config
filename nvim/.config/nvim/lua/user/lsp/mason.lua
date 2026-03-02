local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"cssls",
	"cssmodules_ls",
	"emmet_ls",
	"html",
	"lua_ls",
	"jsonls",
	"pyright",
	"bashls",
}

local settings = {
	ui = {
		border = "rounded",
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local handlers = require("user.lsp.handlers")

for _, server_name in ipairs(servers) do
	local opts = {
		on_attach = handlers.on_attach,
		capabilities = handlers.capabilities,
	}

	local has_settings, server_settings = pcall(require, "user.lsp.settings." .. server_name)
	if has_settings then
		opts = vim.tbl_deep_extend("force", server_settings, opts)
	end

	vim.lsp.config(server_name, opts)
end

vim.lsp.enable(servers)
