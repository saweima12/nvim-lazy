local function toggleLazygit()
  local lazygit = require("plugins.terminals.lazygit")
  lazygit:toggle()
end

return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  opts = {
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
  },
  keys = {
    -- {
    --   "<leader>gg",
    --   function()
    --     toggleLazygit()
    --   end,
    --   desc = "Lazygit",
    -- },
  },
}
