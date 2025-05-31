return {
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    opts = {
      date_format = "%Y.%m.%d",
    },
    config = function(_, opts)
      require("blame").setup(opts)
    end,
    dependencies = {
      "folke/snacks.nvim",
    },
  },
}
