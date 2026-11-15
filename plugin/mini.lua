if vim.g.vscode then return end
-- mini.pairs and mini.surround are needed before any editing session starts
require("lazyload").on_vim_enter(function()
  vim.pack.add({
    Utils.github("nvim-mini/mini.pairs"),
    Utils.github("nvim-mini/mini.surround"),
  })

  require("mini.pairs").setup()
  require("mini.surround").setup({
    mappings = {
      add = "sa", -- Add surrounding in Normal and Visual modes
      delete = "sd", -- Delete surrounding
      find = "sf", -- Find surrounding [ to the right ]
      find_left = "sF", -- Find surrounding [ to the left ]
      highlight = "sh", -- Highlight surrounding
      replace = "sr", -- Replace surrounding
      update_n_lines = "sn", -- Update `n_lines`
    },
  })
end)

-- todo-comments and marks are display-only; defer until a buffer is actually read
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    vim.pack.add({
      Utils.github("folke/todo-comments.nvim"), -- depends on "nvim-lua/plenary.nvim"
      Utils.github("chentoast/marks.nvim"),
    })
    require("marks").setup()
    require("todo-comments").setup()
  end,
})
