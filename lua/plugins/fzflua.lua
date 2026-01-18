return {
  {
    "ibhagwan/fzf-lua",
    init = function ()
      require('fzf-lua')
    end,
    opts = {},
    keys = {
      { "<leader>ff", "<CMD>FzfLua files<CR>", desc="Find Files(Root)" },
    }
  },
}
