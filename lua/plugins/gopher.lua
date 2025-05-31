return {
  "olexsmir/gopher.nvim",
  ft = "go",
  -- branch = "develop"
  -- (optional) will update plugin's deps on every update
  opts = {},
  config = function(_, opts)
    require("gopher").setup(opts)
  end,
}
