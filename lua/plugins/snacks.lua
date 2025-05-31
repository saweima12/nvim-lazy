return {
  "folke/snacks.nvim",
  keys = {
    { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep" },
    { "<leader>sG", false },
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
