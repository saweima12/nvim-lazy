return {
  "glepnir/lspsaga.nvim",
  opts = {
    lightbulb = {
      enable = false,
      sign = false,
    },
  },
  config = function(_, opts)
    require("lspsaga").setup(opts)
  end,
}
