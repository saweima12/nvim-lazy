return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    opts.icons = opts.icons or {}
    opts.icons.rules = vim.tbl_extend("force", opts.icons.rules or {}, {
      { pattern = "outline", icon = "󰦂", color = "yellow" },
      { pattern = "lsp", icon = "", color = "yellow" },
      { pattern = "run", icon = "", color = "yellow" },
    })
    return opts
  end,
}
