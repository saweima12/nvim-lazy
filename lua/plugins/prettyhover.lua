return {
  "Fildo7525/pretty_hover",
  event = "LspAttach",
  opts = {},
  config = function(_, opts)
    require("pretty_hover").setup(opts)
  end,
}
