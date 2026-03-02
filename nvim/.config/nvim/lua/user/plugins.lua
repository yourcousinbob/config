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
    { "nvim-lua/plenary.nvim",               commit = "b9fd5226c2f76c951fc8ed5923d85e4de065e509" },
    { "numToStr/Comment.nvim",               commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb" },
    { "kyazdani42/nvim-web-devicons",        commit = "737cf6c657898d0c697311d79d361288a1343d50" },
    { "kyazdani42/nvim-tree.lua",            commit = "ae16aab5fd1792b97758622b9fb53408ec804fd8" },
    { "nvim-lualine/lualine.nvim",           commit = "47f91c416daef12db467145e16bed5bbfe00add8" },
    { "akinsho/toggleterm.nvim",             commit = "9a88eae817ef395952e08650b3283726786fb5fb" },
    { "ahmedkhalf/project.nvim",             commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4f" },
    { "lukas-reineke/indent-blankline.nvim", commit = "d28a3f70721c79e3c5f6693057ae929f3d9c0a03" },
    { "goolord/alpha-nvim",                  commit = "a9d8fb72213c8b461e791409e7feabb74eb6ce73" },
    { "folke/which-key.nvim",                commit = "3aab2147e74890957785941f0c1ad87d0a44c15a" },
    { "norcalli/nvim-colorizer.lua",         commit = "a065833f35a3a7cc3ef137ac88b5381da2ba302e" },
    { "kylechui/nvim-surround",              commit = "5553dd1fbb3559abb176a8227a12e8f1cab07e93" },
    { "tpope/vim-repeat",                    commit = "65846025c15494983dafe5e3b46c8f88ab2e9635" },
    { "rcarriga/nvim-notify",                commit = "8701bece920b38ea289b457f902e2ad184131a5d" },
    { "ghillb/cybu.nvim",                    commit = "2b970234efb91e4e005d7e53985694139c361075" },
    { "SmiteshP/nvim-navic",                 commit = "f5eba192f39b453675d115351808bd51276d9de5" },
    { "Pocco81/auto-save.nvim",              commit = "979b6c82f60cfa80f4cf437d77446d0ded0addf0" },
    { "Eandrju/cellular-automaton.nvim",     commit = "1606e9d5d04ff254023c3f3c62842d065708d6d3" },
    { "nvim-pack/nvim-spectre",              commit = "72f56f7585903cd7bf92c665351aa585e150af0f" },
    { 'nvim-mini/mini.icons',                commit = "5b9076dae1bfbe47ba4a14bc8b967cde0ab5d77e" },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        commit = "87b1a3506211538f460786c23f98ec63ad9af4e5",
    },
    {
        "letieu/harpoon-lualine",
        dependencies = {
            {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
            },
        },
        commit = "215c0847dfb787b19268f7b42eed83bdcf06b966"
    },
    {
        "ellisonleao/glow.nvim",
        config = true,
        cmd = "Glow",
        commit = "5d5954b2f22e109d4a6eba8b2618c5b96e4ee7a2",
    },

    -- Colourschemes
    { "rebelot/kanagawa.nvim",             commit = "aef7f5cec0a40dbe7f3304214850c472e2264b10" },

    -- Cmp plugins
    { "hrsh7th/nvim-cmp",                  commit = "da88697d7f45d16852c6b2769dc52387d1ddc45f" }, -- The completion plugin
    { "hrsh7th/cmp-buffer",                commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657" }, -- buffer completions
    { "hrsh7th/cmp-path",                  commit = "c642487086dbd9a93160e1679a1327be111cbc25" }, -- path completions
    { "hrsh7th/cmp-nvim-lsp",              commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
    { "hrsh7th/cmp-nvim-lua",              commit = "e3a22cb071eb9d6508a156306b102c45cd2d573d" },
    { "hrsh7th/cmp-emoji",                 commit = "e8398e2adf512a03bb4e1728ca017ffeac670a9f" },
    { "saadparwaiz1/cmp_luasnip",          commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" }, -- snippet completions

    -- Snippets
    { "L3MON4D3/LuaSnip",                  commit = "dae4f5aaa3574bd0c2b9dd20fb9542a02c10471c" }, --snippet engine
    { "rafamadriz/friendly-snippets",      commit = "6cd7280adead7f586db6fccbd15d2cac7e2188b9" }, -- a bunch of snippets to use

    -- LSP
    { "neovim/nvim-lspconfig",             commit = "a40d22e75d951ad2fcf236ceb013d88f81d2cc9a" }, -- enable LSP
    { "williamboman/mason.nvim",           commit = "44d1e90e1f66e077268191e3ee9d2ac97cc18e65" }, -- simple to use language server installer
    { "williamboman/mason-lspconfig.nvim", commit = "6c4830e37743b060d13c9269394176aea6a0fbc8" }, -- simple to use language server installer
    { "benomahony/uv.nvim",                commit = "b0bce1b61584fde99c316aa0587a4996c52df206" },

    -- { "jose-elias-alvarez/null-ls.nvim",             commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" }, -- for formatters and linters
    { "RRethy/vim-illuminate",             commit = "0d1e93684da00ab7c057410fecfc24f434698898" },
    { "ray-x/lsp_signature.nvim",          commit = "0efb088dce050d38a3608ee69f80f2a62cf9849c" },

    -- Telescope
    { "nvim-telescope/telescope.nvim",     commit = "5255aa27c422de944791318024167ad5d40aad20" },
    { "debugloop/telescope-undo.nvim",     commit = "928d0c2dc9606e01e2cc547196f48d2eaecf58e5" },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ':TSUpdate',
        commit = "0f5b204603234a523fafa8f6b860fd36f80a23f6"
    },
    { "nvim-treesitter/nvim-treesitter-textobjects", commit = "a0e182ae21fda68c59d1f36c9ed45600aef50311" },
    { "JoosepAlviste/nvim-ts-context-commentstring", commit = "1b212c2eee76d787bbea6aa5e92a2b534e7b4f8f" },
    { "windwp/nvim-autopairs",                       commit = "59bce2eef357189c3305e25bc6dd2d138c1683f5" }, -- Autopairs, integrates with both cmp and treesitter

    -- Tmux
    { "christoomey/vim-tmux-navigator",              commit = "e41c431a0c7b7388ae7ba341f01a0d217eb3a432" },

    -- Claude Code
    {
        "greggh/claude-code.nvim",
        commit = "55c0cb59828fbc3bec744288286a46f5d5750b83",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    --Copilot
    {
        "zbirenbaum/copilot.lua",
        event = "VeryLazy",
        commit = "a12fd5672110c8aa7e3c8419e28c96943ca179be",
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
