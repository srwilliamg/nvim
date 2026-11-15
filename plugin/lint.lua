if vim.g.vscode then return end

-- nvim-lint only triggers on BufWritePost; no reason to load it at VimEnter
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    vim.pack.add({
      Utils.github("mfussenegger/nvim-lint"),
    })

    require("lint").linters_by_ft = {
      markdown = { "vale" },
      go = { "golangcilint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
})
