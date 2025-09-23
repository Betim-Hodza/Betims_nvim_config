-- lua/baytizzel/lazy/format.lua
return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format, -- C/C++ formatting
          null_ls.builtins.formatting.black,        -- Python formatting
          null_ls.builtins.diagnostics.ruff,        -- Python linting
        },
      })
    end,
  },
}
