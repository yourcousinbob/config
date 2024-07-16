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
vim.loader.enable()

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- Install your plugins here
return lazy.setup({
    -- General Plugins
    { "nvim-lua/plenary.nvim",               commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683" },
    { "numToStr/Comment.nvim",               commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb" },
    { "kyazdani42/nvim-web-devicons",        commit = "c0cfc1738361b5da1cd0a962dd6f774cc444f856" },
    { "kyazdani42/nvim-tree.lua",            commit = "2086e564c4d23fea714e8a6d63b881e551af2f41" },
    { "nvim-lualine/lualine.nvim",           commit = "0a5a66803c7407767b799067986b4dc3036e1983" },
    { "akinsho/toggleterm.nvim",             commit = "fee58a0473fd92b28c34f8f724e4918b15ba30a3" },
    { "ahmedkhalf/project.nvim",             commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" },
    { "lukas-reineke/indent-blankline.nvim", commit = "d98f537c3492e87b6dc6c2e3f66ac517528f406f" },
    { "goolord/alpha-nvim",                  commit = "41283fb402713fc8b327e60907f74e46166f4cfd" },
    { "folke/which-key.nvim",                commit = "0099511294f16b81c696004fa6a403b0ae61f7a0" },
    { "norcalli/nvim-colorizer.lua",         commit = "a065833f35a3a7cc3ef137ac88b5381da2ba302e" },
    { "kylechui/nvim-surround",              commit = "b36bf49d097a09781ad6ac0cfea28b40b74570a3" },
    { "tpope/vim-repeat",                    commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" },
    { "rcarriga/nvim-notify",                commit = "d333b6f167900f6d9d42a59005d82919830626bf" },
    { "stevearc/aerial.nvim",                commit = "eb25396dae306cef5b8fffbe9ae98283d2f1c199" },
    { "ghillb/cybu.nvim",                    commit = "c0866ef6735a85f85d4cf77ed6d9bc92046b5a99" },
    { "SmiteshP/nvim-navic",                 commit = "8649f694d3e76ee10c19255dece6411c29206a54" },
    { "Pocco81/auto-save.nvim",              commit = "979b6c82f60cfa80f4cf437d77446d0ded0addf0" },
    { "Eandrju/cellular-automaton.nvim",     commit = "b7d056dab963b5d3f2c560d92937cb51db61cb5b" },
    { "nvim-pack/nvim-spectre",              commit = "366f46fdd4a1593cc237aea13d5ef113739a472c" },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        commit = "0378a6c428a0bed6a2781d459d7943843f374bce",
    },
    {
        "letieu/harpoon-lualine",
        dependencies = {
            {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
            },
        },
        commit = "d1b873c19b701fd80d60a67d086dbb3bcc4eb00e"
    },
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
        commit = "238070a686c1da3bccccf1079700eb4b5e19aea4",
    },

    -- Colourschemes
    { "rebelot/kanagawa.nvim",                       commit = "fe5b2c9e2549862c3dc3f3c8e9cf7ddece0f40c2" },

    -- Cmp plugins
    { "hrsh7th/nvim-cmp",                            commit = "a110e12d0b58eefcf5b771f533fc2cf3050680ac" }, -- The completion plugin
    { "hrsh7th/cmp-buffer",                          commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
    { "hrsh7th/cmp-path",                            commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- path completions
    { "hrsh7th/cmp-nvim-lsp",                        commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef" },
    { "hrsh7th/cmp-nvim-lua",                        commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6" },
    { "hrsh7th/cmp-emoji",                           commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0" },
    { "saadparwaiz1/cmp_luasnip",                    commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843" }, -- snippet completions

    -- -- Snippets
    { "L3MON4D3/LuaSnip",                            commit = "2b6860d15aaab01d3fb90859c0ba97f20ad7bc5f" }, --snippet engine
    { "rafamadriz/friendly-snippets",                commit = "682157939e57bd6a2c86277dfd4d6fbfce63dbac" }, -- a bunch of snippets to use

    -- LSP
    { "neovim/nvim-lspconfig",                       commit = "6806370929cf6a35be6e5e0e74588515a4356e4d" }, -- enable LSP
    { "williamboman/mason.nvim",                     commit = "0950b15060067f752fde13a779a994f59516ce3d" }, -- simple to use language server installer
    { "williamboman/mason-lspconfig.nvim",           commit = "37a336b653f8594df75c827ed589f1c91d91ff6c" }, -- simple to use language server installer
    { "jose-elias-alvarez/null-ls.nvim",             commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" }, -- for formatters and linters
    { "RRethy/vim-illuminate",                       commit = "5eeb7951fc630682c322e88a9bbdae5c224ff0aa" },
    { "ray-x/lsp_signature.nvim",                    commit = "a38da0a61c172bb59e34befc12efe48359884793" },

    -- Telescope
    { "nvim-telescope/telescope.nvim",               commit = "c392f1b78eaaf870ca584bd698e78076ed301b26" },
    { "debugloop/telescope-undo.nvim",               commit = "95b61c01ea3a4c9e8747731148e905bbcf0ccaee" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",             commit = "b967bbc27b564001c3d3b8ea93444cf6d0b21d23" },
    { "nvim-treesitter/nvim-treesitter-textobjects", commit = "fd41b7ccc5490a3a99c734d1ee418b68d06c48a9" },
    { "JoosepAlviste/nvim-ts-context-commentstring", commit = "cb064386e667def1d241317deed9fd1b38f0dc2e" },
    { "windwp/nvim-autopairs",                       commit = "c15de7e7981f1111642e7e53799e1211d4606cb9" }, -- Autopairs, integrates with both cmp and treesitter

    -- Tmux
    { "christoomey/vim-tmux-navigator",              commit = "5b3c701686fb4e6629c100ed32e827edf8dad01e" },

    --Copilot
    {
        "zbirenbaum/copilot.lua",
        event = "VeryLazy",
        commit = "86537b286f18783f8b67bccd78a4ef4345679625",
    },

    -- Obsidian
    -- {
    --     "epwalsh/obsidian.nvim",
    --     commit = "6b17ee6cbd81f5f091712a59473b4257007ae336",
    --     lazy = true,
    --     event = { "BufReadPre path/to/my-vault/**.md" },
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     opts = {
    --         dir = "/mnt/BigBoy/BobVault",
    --     },
    -- },

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
