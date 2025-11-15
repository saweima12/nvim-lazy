-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Disable layyvim's original keymap
vim.keymap.del({ "n" }, "<leader>K")
vim.keymap.del({ "n" }, "<leader>`")
vim.keymap.del({ "n" }, "<leader>?")

-- Disable Lazy.nvim keymap
vim.keymap.del({ "n" }, "<leader>L", { silent = true })
vim.keymap.del({ "n" }, "<leader>l", { silent = true })

-- Disable quickfix related
vim.keymap.del({ "n" }, "<leader>xL", { silent = true })
vim.keymap.del({ "n" }, "<leader>xQ", { silent = true })
vim.keymap.del({ "n" }, "<leader>xT", { silent = true })
vim.keymap.del({ "n" }, "<leader>xX", { silent = true })

-- Disable git & lazygit related
vim.keymap.del({ "n" }, "<leader>gb", { silent = true })
vim.keymap.del({ "n" }, "<leader>gB", { silent = true })
vim.keymap.del({ "n" }, "<leader>gY", { silent = true })
vim.keymap.del({ "n" }, "<leader>gl", { silent = true })
vim.keymap.del({ "n" }, "<leader>gL", { silent = true })
vim.keymap.del({ "n" }, "<leader>gf", { silent = true })
vim.keymap.del({ "n" }, "<leader>gG", { silent = true })

-- Disable buffer related
-- vim.keymap.del({ "n" }, "<leader>bd", { silent = true })
-- vim.keymap.del({ "n" }, "<leader>bD", { silent = true })

-- Disable inspect related
vim.keymap.del({ "n" }, "<leader>ui", { silent = true })
vim.keymap.del({ "n" }, "<leader>uI", { silent = true })

-- Disable terminal related
vim.keymap.del({ "n" }, "<leader>fT", { silent = true })
vim.keymap.del({ "n" }, "<leader>ft", { silent = true })
vim.keymap.del({ "n" }, "<c-/>", { silent = true })
vim.keymap.del({ "n" }, "<c-_>", { silent = true })

-- Disable Window related
vim.keymap.del({ "n" }, "<leader>-", { silent = true })
vim.keymap.del({ "n" }, "<leader>|", { silent = true })
vim.keymap.del({ "n" }, "<leader>wm", { silent = true })
vim.keymap.del({ "n" }, "<leader>wd", { silent = true })

vim.keymap.del({ "n" }, "<C-Right>", { silent = true })
vim.keymap.del({ "n" }, "<C-Left>", { silent = true })

-- Disable Mason & outline related
vim.keymap.del({ "n" }, "<leader>cs", { silent = true })
vim.keymap.del({ "n" }, "<leader>cS", { silent = true })

-- Disable Ui related
vim.keymap.del({ "n" }, "<leader>uC", { silent = true })
vim.keymap.del({ "n" }, "<leader>ub", { silent = true })

-- Disable & Overwrite search related
-- vim.keymap.del({ "n" }, "<leader>sg", { silent = true })

-- Add tab to indent
map("n", "<tab>", ">gv")
map("n", "<S-tab>", "<gv")
map("n", "<S-tab>", "<gv")

map("v", "<tab>", ">gv")
map("v", "<S-tab>", "<gv")
map("v", "<S-tab>", "<gv")

-- Add hotkey for close buffer
map("n", "<A-c>", function()
  Snacks.bufdelete()
end)
map("n", "<A-S-c>", function()
  Snacks.bufdelete({ force = true })
end)

-- Overwrite hover key
map("n", "K", function()
  require("pretty_hover").hover()
end)

-- Add Snecks toggle for git blame
Snacks.toggle
  .new({
    id = "git_blame",
    name = "Git Blame",
    get = function()
      local is_open = require("blame").is_open() or false
      return is_open
    end,
    set = function(_)
      vim.cmd("BlameToggle virtual")
    end,
  })
  :map("<leader>gb")

-- Add Snecks picker for colorscheme
map("n", "<leader>u`", function()
  Snacks.picker.colorschemes()
end, { desc = "Change colorscheme" })

map("n", "<leader>bq", function()
  Snacks.bufdelete()
end, { desc = "Close Buffer" })

-- Add lsp related keybindings
map("n", "gF", "<cmd>Lspsaga finder<cr>", { desc = "Finder" })
map("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "LSP Rename" })

-- Mapping fn+left & fn+right
map("n", "<Find>", "^")
map("i", "<Find>", "<C-o>^")
map("v", "<Find>", "^")

map("n", "<Select>", "$")
map("i", "<Select>", "<C-o>$")
map("v", "<Select>", "$")

-- Add mark highlight
map({ "n", "v" }, "<leader>cm", function()
  local word
  -- visual mode: with selection
  if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
    vim.cmd('normal! "vy')
    word = vim.fn.getreg("v")
    word = word:gsub("\n", "\\n")
  else
    -- Normal mode: Get word by cursor
    word = vim.fn.expand("<cword>")
  end

  if word ~= "" then
    vim.fn.setreg("/", word)
    vim.opt.hlsearch = true
    print("Highlighted: " .. word)
  end
end, { desc = "Highlight selection or word" })

map("n", "<leader>cr", function()
  local search_word = vim.fn.getreg("/")

  if search_word == "" then
    print("No search pattern found. Highlight something first.")
    return
  end

  local replace_cmd = ":%s/" .. search_word .. "//g"
  vim.fn.feedkeys(":" .. vim.api.nvim_replace_termcodes(replace_cmd, true, false, true))
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Left><Left>", true, false, true))

  print("Global replace mode for: " .. search_word)
end, { desc = "Replace all occurrences of highlighted text" })
