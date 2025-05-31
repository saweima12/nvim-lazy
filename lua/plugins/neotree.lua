return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    filesystem = {
      bind_to_cwd = true,
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle reveal left<cr>", desc = "Explorer (NeoTree)" },
    { "<leader>E", false },
    { "<leader>ge", false },
    { "<leader>fE", false },
    { "<leader>fe", false },
  },
}
