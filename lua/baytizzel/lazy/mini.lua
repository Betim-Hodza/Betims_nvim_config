-- lua/baytizzel/lazy/mini.lua
return {
  "echasnovski/mini.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy-load on buffer read/new file
  config = function()
    -- mini.comment: Commenting with gc/gcc
    require("mini.comment").setup({
      mappings = {
        comment = "gc",
        comment_line = "gcc",
        textobject = "gc",
      },
    })

    -- mini.pairs: Auto-pairs (replaces nvim-autopairs)
    require("mini.pairs").setup({
      modes = { insert = true, command = false, terminal = false },
      mappings = {
        ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
        ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
        ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
        [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
        ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
        ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
      },
    })

    -- mini.surround: Add/delete/change surrounding pairs
    require("mini.surround").setup({
      mappings = {
        add = "sa", -- Add surrounding
        delete = "sd", -- Delete surrounding
        replace = "sr", -- Replace surrounding
        find = "sf", -- Find surrounding
        find_left = "sF", -- Find left surrounding
        highlight = "sh", -- Highlight surrounding
      },
    })
  end,
}
