return {
  "gbprod/yanky.nvim",
  init = function()
    require("telescope").load_extension("yank_history")
  end,
  keys = {
    {
      "<leader>p",
      function()
        require("telescope").extensions.yank_history.yank_history()
      end,
      desc = "Open Yanky History",
    },
  },
}
