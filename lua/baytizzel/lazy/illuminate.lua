-- lua/baytizzel/lazy/illuminate.lua
return {
  "RRethy/vim-illuminate",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy-load on buffer read/new file
  config = function()
    require("illuminate").configure({
      providers = { "lsp", "treesitter", "regex" },
      delay = 100,
      filetypes_denylist = { "dirvish", "fugitive", "NvimTree" },
      under_cursor = true,
    })

    -- LazyVim default keymaps
    vim.keymap.set("n", "]]", function()
      require("illuminate").goto_next_reference()
      vim.cmd("normal! zz")
    end, { desc = "Next Reference" })
    vim.keymap.set("n", "[[", function()
      require("illuminate").goto_prev_reference()
      vim.cmd("normal! zz")
    end, { desc = "Prev Reference" })
  end,
}
