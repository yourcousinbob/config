-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "toggleterm", "telescope" },
    callback = function()
        vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
    end,
})
-- use k and esc to get out of qf
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf" },
    callback = function()
        vim.cmd([[
      nnoremap <silent> <buffer> <CR> :close<CR>
      set nobuflisted
    ]])
    end,
})
-- Illuminate
vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        vim.cmd("hi link illuminatedWord LspReferenceText")
    end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
        vim.cmd([[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
    end,
})

--Refresh winbar
vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost", "InsertEnter", "BufWritePost" }, {
    callback = function()
        require("user.winbar").get_winbar()
    end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown", "tex" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd("set formatoptions-=cro")
    end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
    end,
})

-- Treesitter enable
vim.api.nvim_create_autocmd({ 'Filetype' }, {
  callback = function(event)
    local ignored_fts = {
        "NvimTree",
        "notify",
        "cmp"
    }

    if vim.tbl_contains(ignored_fts, event.match) then return end

    -- make sure nvim-treesitter is loaded
    local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')

    -- no nvim-treesitter, maybe fresh install
    if not ok then return end

    local ft = vim.bo[event.buf].ft
    local lang = vim.treesitter.language.get_lang(ft)
    nvim_treesitter.install({ lang }):await(function(err)
      if err then
        vim.notify('Treesitter install error for ft: ' .. ft .. ' err: ' .. err)
        return
      end

      pcall(vim.treesitter.start, event.buf)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end)
  end,
})
