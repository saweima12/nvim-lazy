local map = LazyVim.safe_keymap_set

return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    -- branch = "develop"
    -- (optional) will update plugin's deps on every update
    opts = {},
    config = function(_, opts)
      require("gopher").setup(opts)

      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "go" },
        callback = function(args)
          --Add tags
          map("n", "<localleader>t", function()
            require("snacks").input({
              prompt = "Add Go tags: ",
              default = "json",
            }, function(value)
              if value and value ~= "" then
                vim.cmd("GoTagAdd " .. value)
              end
            end)
          end, { desc = "Lsp: Add GoTags" })

          --Remove tags
          map("n", "<localleader>T", function()
            require("snacks").input({
              prompt = "Remove Go tags: ",
              default = "json",
            }, function(value)
              if value and value ~= "" then
                vim.cmd("GoTagRm " .. value)
              end
            end)
          end, { desc = "Lsp: Remove GoTag" })
        end,
      })
    end,
  },

  {
    "fang2hou/go-impl.nvim",
    ft = "go",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { "go" },
        callback = function(args)
          map("n", "<localleader>i", function()
            require("go-impl").open()
          end, { desc = "Lsp: Implement interface" })
        end,
      })

      require("go-impl").setup({})
    end,
    opts = {},
  },
}
