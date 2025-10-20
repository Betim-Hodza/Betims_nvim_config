-- lua/baytizzel/lazy/noice.lua
return {
  "folke/noice.nvim",
  event = "VeryLazy", -- Lazy-load after most plugins
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = true,
          view = "mini",
        },
      },
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
    })
  end,
}
