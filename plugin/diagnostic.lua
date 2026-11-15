if vim.g.vscode then return end

-- Diagnostic decoration is meaningless without a buffer; defer past VimEnter
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
    })
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config({ virtual_text = false })
  end,
})
