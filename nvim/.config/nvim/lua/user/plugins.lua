local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git", "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- General Plugins
    use({ "wbthomason/packer.nvim", commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530" }) -- Have packer manage itself
    use({ "nvim-lua/plenary.nvim", commit = "1c7e3e6b0f4dd5a174fcea9fda8a4d7de593b826" }) -- Useful lua functions used by lots of plugins
    use({ "numToStr/Comment.nvim", commit = "eab2c83a0207369900e92783f56990808082eac2" })
    use({ "kyazdani42/nvim-web-devicons", commit = "13d06d74afad093d8312fe051633b55f24049c16" })
    use({ "kyazdani42/nvim-tree.lua", commit = "96506fee49542f3aedab76368d400a147fea344e" })
    use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
    use({ "nvim-lualine/lualine.nvim", commit = "0050b308552e45f7128f399886c86afefc3eb988" })
    use({ "akinsho/toggleterm.nvim", commit = "" })
    use({ "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" })
    use({ "lewis6991/impatient.nvim", commit = "c90e273f7b8c50a02f956c24ce4804a47f18162e" })
    use({ "lukas-reineke/indent-blankline.nvim", commit = "c4c203c3e8a595bc333abaf168fcb10c13ed5fb7" })
    use({ "goolord/alpha-nvim", commit = "21a0f2520ad3a7c32c0822f943368dc063a569fb" })
    use({ "unblevable/quick-scope", commit = "428e8698347f254d24b248af9f656194a80081e5" })
    use({ "folke/which-key.nvim", commit = "e4fa445065a2bb0bbc3cca85346b67817f28e83e" })
    use({ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" })
    use({ "kylechui/nvim-surround", commit = "ad56e6234bf42fb7f7e4dccc7752e25abd5ec80e" })
    use({ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" })
    use({ "rcarriga/nvim-notify", commit = "bdd647f61a05c9b8a57c83b78341a0690e9c29d7" })
    use({ "ThePrimeagen/harpoon", commit = "21d0d1bfa3000e4384740bfaefa0ebc51c773786" })
    use({ "stevearc/aerial.nvim", commit = "25a5e7873ead5ec15669a78e74021a66c9821770" })
    use({ "ghillb/cybu.nvim", commit = "395791b1e1177e3459c85415970ab8216b19a5dc" })
    use({ "SmiteshP/nvim-gps", commit = "f4734dff6fc2f33b5fd13412e56c4fce06650a74" })
    use({ "Pocco81/auto-save.nvim", commit = "979b6c82f60cfa80f4cf437d77446d0ded0addf0" })
    use({ "Eandrju/cellular-automaton.nvim", commit = "f006ca91972f69056f92e0217d317fc99458753f" })

    -- Colourschemes
    use({ "folke/tokyonight.nvim", commit = "4071f7fa984859c5de7a1fd27069b99c3a0d802a" })
    -- use({ "dracula/vim", commit = "" })
    -- use({ "sainnhe/sonokai", commit = "" })
    use({ "rebelot/kanagawa.nvim", commit = "a6f8ea10900e8d891f9c93e0ed258f118010fb24" })

    -- Cmp plugins
    use({ "hrsh7th/nvim-cmp", commit = "11a95792a5be0f5a40bab5fc5b670e5b1399a939" }) -- The completion plugin
    use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
    use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
    use({ "hrsh7th/cmp-nvim-lsp", commit = "59224771f91b86d1de12570b4070fe4ad7cd1eeb" })
    use({ "hrsh7th/cmp-nvim-lua", commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6" })
    use({ "hrsh7th/cmp-emoji", commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0" })
    use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions

    -- Snippets
    use({ "L3MON4D3/LuaSnip", commit = "8c23e1af82bdafa86556a36c4e075079dd167771" }) --snippet engine
    use({ "rafamadriz/friendly-snippets", commit = "046e4d3491baf664e0eef5231d28beb49333578b" }) -- a bunch of snippets to use

    -- LSP
    use({ "neovim/nvim-lspconfig", commit = "85cd2ecacd8805614efe3fb3a5146ac7d0f88a17" }) -- enable LSP
    use({ "williamboman/nvim-lsp-installer", commit = "ae913cb4fd62d7a84fb1582e11f2e15b4d597123" }) -- simple to use language server installer
    use({ "jose-elias-alvarez/null-ls.nvim", commit = "33cfeb7a761f08e8535dca722d4b237cabadd371" }) -- for formatters and linters
    use({ "RRethy/vim-illuminate", commit = "da80f3877896adcf77f59fb0bf74e9601615d372" })

    -- Telescope
    use({ "nvim-telescope/telescope.nvim", commit = "b69b33eded07341253bc1f0b4ae6bbc5c411a2ab" })

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", commit = "da6dc214ddde3fac867bd4a6f4ea51a794b01e18" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects", commit = "2fb97bd6c53d78517d2022a0b84422c18ce5686e" })
    use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "a0f89563ba36b3bacd62cf967b46beb4c2c29e52" })
    use({ "windwp/nvim-autopairs", commit = "03580d758231956d33c8dd91e2be195106a79fa4" }) -- Autopairs, integrates with both cmp and treesitter

    -- Git
    use({ "lewis6991/gitsigns.nvim", commit = "7b37bd5c2dd4d7abc86f2af096af79120608eeca" })

    -- Tmux
    use({ "christoomey/vim-tmux-navigator", commit = "cdd66d6a37d991bba7997d593586fc51a5b37aa8" })

    -- DAP
    -- use({ "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" })
    -- use({ "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" })
    -- use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })

    --For future needs

    -- Java
    -- use "mfussenegger/nvim-jdtls"

    -- Tex
    -- use "lervag/vimtex"

    -- Sniprun
    -- use { "michaelb/sniprun", run = "bash ./install.sh" , commit = "c37086a0d12b2053bf147c2f4643c0c92318c0c2"}

    -- Automatically set up configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
