local map = LazyVim.safe_keymap_set

return {
  "fang2hou/go-impl.nvim",
  ft = "go",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",

    -- Choose one of the following fuzzy finder
    "folke/snacks.nvim",
    "ibhagwan/fzf-lua",
  },
  config = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "go" },
      callback = function(args)
        map("n", "<localleader>i", function()
          require("go-impl").open()
        end, { desc = "Lsp: Implement interface" })
      end,
    })

    require("go-impl").setup({})
  end,
  opts = {},
}
