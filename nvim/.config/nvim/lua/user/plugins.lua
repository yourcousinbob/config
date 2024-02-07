-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
return lazy.setup({
	-- General Plugins
	{ "nvim-lua/plenary.nvim", commit = "9ac3e9541bbabd9d73663d757e4fe48a675bb054" },
	{ "numToStr/Comment.nvim", commit = "eab2c83a0207369900e92783f56990808082eac2" },
	{ "kyazdani42/nvim-web-devicons", commit = "13d06d74afad093d8312fe051633b55f24049c16" },
	{ "kyazdani42/nvim-tree.lua", commit = "b601b5aa25627f68d3d73ba9269b49e4f04ce126" },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "nvim-lualine/lualine.nvim", commit = "84ffb80e452d95e2c46fa29a98ea11a240f7843e" },
	{ "akinsho/toggleterm.nvim", commit = "1c5996ee3c30b54751093fe68d40676859e7778f" },
	{ "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" },
	{ "lewis6991/impatient.nvim", commit = "c90e273f7b8c50a02f956c24ce4804a47f18162e" },
	{ "lukas-reineke/indent-blankline.nvim", commit = "018bd04d80c9a73d399c1061fa0c3b14a7614399" },
	{ "goolord/alpha-nvim", commit = "dafa11a6218c2296df044e00f88d9187222ba6b0" },
	{ "folke/which-key.nvim", commit = "4b73390eec680b4c061ea175eb32c0ff3412271d" },
	{ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" },
	{ "kylechui/nvim-surround", commit = "e6047128e57c1aff1566fb9f627521d2887fc77a" },
	{ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" },
	{ "rcarriga/nvim-notify", commit = "50d037041ada0895aeba4c0215cde6d11b7729c4" },
	{ "stevearc/aerial.nvim", commit = "7371322c60120a56bcc833c407de96be42c18172" },
	{ "ghillb/cybu.nvim", commit = "395791b1e1177e3459c85415970ab8216b19a5dc" },
	{ "SmiteshP/nvim-navic", commit = "27124a773d362628b114cd12016e743dab4ccf3e" },
	{ "Pocco81/auto-save.nvim", commit = "979b6c82f60cfa80f4cf437d77446d0ded0addf0" },
	{ "Eandrju/cellular-automaton.nvim", commit = "679943b8e1e5ef79aaeeaf4b00782c52eb4e928f" },
	{ "nvim-pack/nvim-spectre", commit = "eb17a856a6f17e03d8d610cbc00cd9f2f39e3fd7" },
    { "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" }, commit = "a38be6e0dd4c6db66997deab71fc4453ace97f9c" },

	-- Colourschemes
	{ "rebelot/kanagawa.nvim", commit = "22adef57f08a3cd07978b65966ce68da42501f68" },

	-- Cmp plugins
	{ "hrsh7th/nvim-cmp", commit = "777450fd0ae289463a14481673e26246b5e38bf2" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" },
	{ "hrsh7th/cmp-nvim-lua", commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6" },
	{ "hrsh7th/cmp-emoji", commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0" },
	{ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }, -- snippet completions

	-- -- Snippets
	{ "L3MON4D3/LuaSnip", commit = "eb592e4be52fff5a514b7540d5341b55ca4c3226" }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "8d91ba2dc2421a54981115f61b914974f938fa77" }, -- a bunch of snippets to use

	-- LSP
	{ "neovim/nvim-lspconfig", commit = "6fe69025b8825029ea9bf291ab3b1750f9bcb39e" }, -- enable LSP
	{ "williamboman/mason.nvim", commit = "df4bf38688c31056d222e68aa9f26e3c51090a97" }, -- simple to use language server installer
	{ "williamboman/mason-lspconfig.nvim", commit = "b81c50c4baae7d80b1723b3fa86e814d7754d15b" }, -- simple to use language server installer
	{ "jose-elias-alvarez/null-ls.nvim", commit = "f8ffcd7cb8fb3325c711d459152ef132b5b65aed" }, -- for formatters and linters
	{ "RRethy/vim-illuminate", commit = "a2907275a6899c570d16e95b9db5fd921c167502" },
	{ "ray-x/lsp_signature.nvim", commit = "775c0cdf5be5adcc08f27c9058edb00b5b517520" },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", commit = "6258d50b09f9ae087317e392efe7c05a7323492d" },
	{ "debugloop/telescope-undo.nvim", commit = "231b5ebb4328d2768c830c9a8d1b9c696116848d" },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", commit = "18f9e1a47fc25272836a84aa8adb03925c73b33d" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", commit = "8673926519ea61069f9c1366d1ad1949316d250e" },
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "729d83ecb990dc2b30272833c213cc6d49ed5214" },
	{ "windwp/nvim-autopairs", commit = "7470af886ffb3df32800e5ef9c072a6cd825770d" }, -- Autopairs, integrates with both cmp and treesitter

	-- Git
	{ "lewis6991/gitsigns.nvim", commit = "372d5cb485f2062ac74abc5b33054abac21d8b58" },

	-- Tmux
	{ "christoomey/vim-tmux-navigator", commit = "cdd66d6a37d991bba7997d593586fc51a5b37aa8" },

	--Copilot
	{
		"zbirenbaum/copilot.lua",
		event = "VeryLazy",
		commit = "b3798d85322b1aaa56cad9d651d2d1aaec6298e9",
	},

	-- Obsidian
	{
		"epwalsh/obsidian.nvim",
		commit = "6b17ee6cbd81f5f091712a59473b4257007ae336",
		lazy = true,
		event = { "BufReadPre path/to/my-vault/**.md" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			dir = "/mnt/BigBoy/BobVault",
		},
	},

	--For future needs

	-- DAP
	-- {"mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" },
	-- {"rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" },
	-- {"ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" },
	--
	-- Java
	-- use "mfussenegger/nvim-jdtls"

	-- Tex
	-- use "lervag/vimtex"

	-- Sniprun
	-- use { "michaelb/sniprun", run = "bash ./install.sh" , commit = "c37086a0d12b2053bf147c2f4643c0c92318c0c2"}
})
