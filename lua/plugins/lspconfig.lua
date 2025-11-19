return {
  "neovim/nvim-lspconfig",
  init = function()
    local lspconfig = require("lspconfig")
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
      ["*"] = {
        keys = {
          { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", has = "definition" },
          { "K", false },
        },
      },
    },
  },
}
