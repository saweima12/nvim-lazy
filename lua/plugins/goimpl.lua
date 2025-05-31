local map = LazyVim.safe_keymap_set

return {
  "edolphin-ydf/goimpl.nvim",
  ft = { "go" },
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  config = function()
    require("telescope").load_extension("goimpl")

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "go" },
      callback = function(args)
        map("n", "<localleader>i", function()
          require("telescope").extensions.goimpl.goimpl({})
        end, { desc = "Lsp: Implement interface" })
      end,
    })
  end,
}
