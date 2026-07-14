if vim.g.vscode then return end
-- plugin/treesitter.lua
require("lazyload").on_vim_enter(function()
  vim.pack.add({
    { src = "https://github.com/romus204/tree-sitter-manager.nvim" },
  })

  require("tree-sitter-manager").setup({
    ensure_installed = {
      "asm",
      "bash",
      "c",
      "cpp",
      "css",
      "go",
      "gomod",
      "gosum",
      "html",
      "java",
      "javascript",
      "json",
      "latex",
      "lua",
      "luau",
      "markdown",
      "markdown_inline",
      "python",
      "sql",
      "tsx",
      "typescript",
      "typst",
      "vim",
      "xml",
      "yaml",
    },
    -- markdown uses vim regex for indentation; keep syntax on for it
    nohighlight = {},
    highlight = true,
  })

  vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
end)
