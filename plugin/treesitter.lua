if vim.g.vscode then return end
-- plugin/treesitter.lua
require("lazyload").on_vim_enter(function()
  vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  })

  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "dockerfile",
      "go",
      "gomod",
      "gosum",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "toml",
      "vim",
      "yaml",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })

  vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
end)
