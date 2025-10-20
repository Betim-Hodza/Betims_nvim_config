-- lua/baytizzel/lazy/conform.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Lazy-load on write
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      go = { "gofmt" },
      javascript = { "prettier" },
      typescript = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
