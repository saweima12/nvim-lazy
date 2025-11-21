return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep" },
    { "<leader>sG", false },
    {
      "<leader>gg",
      function()
        Snacks.lazygit({ win = { border = "double" } })
      end,
      desc = "Open Lazygit",
    },
  },

  opts = {
    dashboard = {
      preset = {
        header = [[
███████╗  ██╗       ███████╗  ███████╗  ██████╗    z  
██╔════╝  ██║       ██╔════╝  ██╔════╝  ██╔══██╗     Z
███████╗  ██║       █████╗    █████╗    ██████╔╝   z  
╚════██║  ██║       ██╔══╝    ██╔══╝    ██╔═══╝      Z
███████║  ███████╗  ███████╗  ███████╗  ██║        z  
╚══════╝  ╚══════╝  ╚══════╝  ╚══════╝  ╚═╝      Z z  ]],
      },
    },
  },
}
