local wk_ok, wk = pcall(require, "which-key")
if not wk_ok then
    return
end

wk.setup({})

local conf = require("telescope.config").values
local function harpoon_toggle_telescope(harpoon_files)
    local harpoon = require("harpoon")
    local make_finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(paths, item.value)
        end
        return require("telescope.finders").new_table({ results = paths })
    end

    require("telescope.pickers")
        .new({}, {
            prompt_title = "Harpoon",
            finder = make_finder(),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_buffer_number, map)
                map("n", "d", function()
                    local state = require("telescope.actions.state")
                    local selected_entry = state.get_selected_entry()
                    local current_picker = state.get_current_picker(prompt_buffer_number)
                    harpoon:list():removeAt(selected_entry.index)
                    current_picker:refresh(make_finder())
                end)
                return true
            end,
        })
        :find()
end

wk.add({
    -- Groups
    { "<leader>G", group = "Git" },
    { "<leader>S", group = "Split", icon = { icon = "", color = "purple" } },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>l", group = "LSP" , icon = { icon = "󰘦", color = "green" }},
    { "<leader>t", group = "Terminal" },
    { "<leader>r", group = "Run" },
    { "<leader>z", group = "Fun", icon = { icon = "󱊈", color = "red" } },

    -- Harpoon
    { "<leader>h", function() require("harpoon"):list():add() end, desc = "Harpoon", icon = { icon = "󱡅", color = "white" } },
    { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1", icon = { icon = "󱡅", color = "white" } },
    { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2", icon = { icon = "󱡅", color = "white" } },
    { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3", icon = { icon = "󱡅", color = "white" } },
    { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4", icon = { icon = "󱡅", color = "white" } },

    -- Top-level
    { "<leader>s", "<cmd>Alpha<cr>", desc = "Start", icon = {icon="", color="green" } },
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer", icon = {icon="󱏒", color="yellow" } },
    { "<leader>c", "<Plug>(comment_toggle_linewise_current)", desc = "Comment", icon = {icon="", color="white" } },
    { "<leader>q", "<cmd>x<cr>", desc = "Quit" },
    { "<leader>p", "<cmd>Lazy<cr>", desc = "Plugins", icon = {icon="", color="orange" }},

    -- Git
    { "<leader>Gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
    { "<leader>Gl", "<cmd>GitBlameToggle<cr>", desc = "Blame" },
    { "<leader>Gt", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle Signs" },
    { "<leader>Go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
    { "<leader>Gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>Gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
    { "<leader>Gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },

    -- Split
    { "<leader>Sh", "<cmd>split<cr>", desc = "HSplit" },
    { "<leader>Sv", "<cmd>vsplit<cr>", desc = "VSplit" },

    -- Find
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>ft", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
    { "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
    { "<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>fj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next Diagnostic" },
    { "<leader>fk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Prev Diagnostic" },
    { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo Tree" },
    { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
    { "<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>fK", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>fH", function() harpoon_toggle_telescope(require("harpoon"):list()) end, desc = "Harpoon", icon = { icon = "󱡅", color = "white" } },

    -- LSP
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
    { "<leader>lF", "<cmd>LspToggleAutoFormat<cr>", desc = "Toggle Autoformat" },
    { "<leader>li", "<cmd>Mason<cr>", desc = "Installer Info" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    { "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", desc = "Quickfix" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>lc", "<cmd>Copilot toggle<cr>", desc = "Copilot toggle" },

    -- Terminal
    { "<leader>t1", ":1ToggleTerm<cr>", desc = "1" },
    { "<leader>t2", ":2ToggleTerm<cr>", desc = "2" },
    { "<leader>t3", ":3ToggleTerm<cr>", desc = "3" },
    { "<leader>t4", ":4ToggleTerm<cr>", desc = "4" },
    { "<leader>tg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit" },
    { "<leader>td", "<cmd>lua _LAZYDOCKER_TOGGLE()<CR>", desc = "Lazydocker" },
    { "<leader>tt", "<cmd>lua _BTOP_TOGGLE()<cr>", desc = "System Monitor" },
    { "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>", desc = "Python" },
    { "<leader>tc", "<cmd>ClaudeCode<CR>", desc = "ClaudeCode" },
    { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
    { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },
    { "<leader>tm", "<cmd>Glow<cr>", desc = "Markdown" },

    -- Run
    -- { "<leader>rr", "<Plug>SnipRun", desc = "Run" },
    -- { "<leader>rR", "<Plug>SnipReplMemoryClean", desc = "Reset Memory" },
    -- { "<leader>ro", "<Plug>SnipRunOperator", desc = "Run Operator" },
    -- { "<leader>ri", "<Plug>SnipInfo", desc = "Snip Info" },
    -- { "<leader>rs", "<Plug>SnipReset", desc = "Stop" },

    -- Fun
    { "<leader>zr", "<cmd>CellularAutomaton make_it_rain<cr>", desc = "Rain" },
    { "<leader>zg", "<cmd>CellularAutomaton game_of_life<cr>", desc = "Game of Life" },

    -- Visual mode
    { "<leader>c", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment", mode = "v" },
    { "<leader>B", "<Plug>SnipRun", desc = "Run", mode = "v" },

    { "<leader>c", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment", mode = "v" },
    { "<leader>B", "<Plug>SnipRun", desc = "Run", mode = "v" },

})
