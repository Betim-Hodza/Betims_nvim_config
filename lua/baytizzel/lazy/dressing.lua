-- lua/baytizzel/lazy/dressing.lua
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy", -- Lazy-load after most plugins
  config = function()
    require("dressing").setup({
      input = {
        enabled = true,
        default_prompt = "Input:",
        win_options = { winblend = 10 },
      },
      select = {
        enabled = true,
        backend = { "telescope", "builtin" },
        telescope = require("telescope.themes").get_dropdown(),
      },
    })
  end,
}
