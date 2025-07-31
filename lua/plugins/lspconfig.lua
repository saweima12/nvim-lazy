return {
  "neovim/nvim-lspconfig",
  init = function()
    local lspconfig = require("lspconfig")
    -- disable the default hover keymap
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
  end,

  opts = {
    autoformat = false,
  },
}
