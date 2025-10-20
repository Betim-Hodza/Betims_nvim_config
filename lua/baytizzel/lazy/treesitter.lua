-- lua/baytizzel/lazy/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy-load on buffer read/new file
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "cpp", "markdown", "markdown_inline", "bash", "ada", "disassembly",
        "diff", "go", "json", "lua", "llvm", "make", "regex", "css", "vim",
        "vimdoc", "elixir", "javascript", "html", "python", "typescript",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
