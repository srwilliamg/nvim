if vim.g.vscode then return end

-- format_on_save fires on buffer write; defer conform until a file is first opened
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    vim.pack.add({
      Utils.github("stevearc/conform.nvim"),
    })

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofmt" },
        python = { "black" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        json = { "prettierd", "prettier", stop_after_first = true },
        jsonc = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd" },
      },
      formatters = {},
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
})
