if vim.g.vscode then return end

-- Load markdown plugins only when a markdown file is opened.
-- once=true so this doesn't re-run on every markdown buffer.
-- No on_vim_enter wrapper — VimEnter may have already fired when this
-- FileType event triggers, causing a vim.schedule race with the setup calls.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  once = true,
  callback = function()
    vim.pack.add({
      { src = Utils.github("OXY2DEV/markview.nvim"), name = "markview" },
      { src = Utils.github("brianhuster/live-preview.nvim"), name = "live-preview" },
      -- snacks.nvim and blink.cmp are already loaded eagerly; no need to re-add
    })
    require("markview").setup()
    vim.keymap.set("n", "<leader>mls", function()
      vim.cmd("LivePreview start")
    end, { desc = "Live preview Start" })
    vim.keymap.set("n", "<leader>mlc", function()
      vim.cmd("LivePreview close")
    end, { desc = "Live preview Close" })
    vim.keymap.set("n", "<leader>mlp", function()
      vim.cmd("LivePreview pick")
    end, { desc = "Live preview Pick" })
    vim.keymap.set("n", "<leader>mst", function()
      vim.cmd("Markview splitToggle")
    end, { desc = "split toggle" })
    vim.keymap.set("n", "<leader>mht", function()
      vim.cmd("Markview hybridToggle")
    end, { desc = "hybrid toggle" })
    vim.keymap.set("n", "<leader>mt", function()
      vim.cmd("Markview Toggle")
    end, { desc = "Toggle" })
  end,
})
