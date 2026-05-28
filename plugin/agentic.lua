if vim.g.vscode then return end
require("lazyload").on_vim_enter(function()
  vim.pack.add({
    Utils.github("carlos-algms/agentic.nvim"),
  })

  require("agentic").setup({
    provider = "kiro-acp",
  })

  vim.keymap.set({ "n", "v", "i" }, "<C-\\>", function()
    require("agentic").toggle()
  end, { desc = "Agentic: Toggle chat" })

  vim.keymap.set({ "n", "v" }, "<C-'>", function()
    require("agentic").add_selection_or_file_to_context()
  end, { desc = "Agentic: Add file/selection to context" })

  vim.keymap.set({ "n", "v", "i" }, "<C-,>", function()
    require("agentic").new_session()
  end, { desc = "Agentic: New session" })

  vim.keymap.set({ "n" }, "<leader>ad", function()
    require("agentic").add_current_line_diagnostics()
  end, { desc = "Agentic: Add current line diagnostics" })

  vim.keymap.set({ "n" }, "<leader>aD", function()
    require("agentic").add_buffer_diagnostics()
  end, { desc = "Agentic: Add buffer diagnostics" })
end)
