return {
  "neovim/nvim-lspconfig",
  init = function()
    local lspconfig = require("lspconfig")
    -- disable the default hover keymap
    -- local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- keys[#keys + 1] = { "K", false }
  end,

  opts = {
    autoformat = false,
    servers = {
      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
      },
      gopls = {
        settings = {
          gopls = {
            analyses = {
              ST1000 = false,
            },
          },
        },
      },
      servers = {
        ["*"] = {
          keys = {
            { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", has = "definition" },
            { "K", false },
          },
        },
      },
    },
  },
}
