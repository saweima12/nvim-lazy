local map = LazyVim.safe_keymap_set

return {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
  lazy = false,
  config = function(_, opts)
    require("outline").setup(opts)
  end,
  keys = {
    { "<localleader>o", "<cmd>Outline<cr>", desc = "Outline" },
  },
}
