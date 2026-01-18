return {
  {
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
        ["*"] = {
          keys = {
            { "gK", false },
            { "K", false },
            { "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "LSP Rename" },
            { "gF", "<cmd>Lspsaga finder<cr>", desc = "Open LSP Finder" },
          },
        },
      },
    },
  },

  {
    "mrjones2014/codesettings.nvim",
    opts = {
      live_reload = false,
      -- I recommend loading on these filetype so that the
      -- jsonls integration, lua_ls integration, and jsonc filetype setup works
      ft = { "json", "lua" },
    },

    init = function()
      vim.lsp.config("gopls", {
        before_init = function(_, config)
          local codesettings = require("codesettings")
          config = codesettings.with_local_settings(config.name, config)
        end,
      })
    end,
  },
}
