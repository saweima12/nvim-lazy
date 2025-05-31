return {
  "nosduco/remote-sshfs.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  init = function()
    require("telescope").load_extension("remote-sshfs")
    require("remote-sshfs").setup()
  end,
}
