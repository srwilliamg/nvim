if vim.g.vscode then return end
-- plugin/treesitter.lua
require("lazyload").on_vim_enter(function()
  vim.pack.add({
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
  })

  require("tree-sitter-manager").setup({
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
    -- markdown uses vim regex for indentation; keep syntax on for it
    nohighlight = {},
    highlight = true,
  })

  vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
end)
