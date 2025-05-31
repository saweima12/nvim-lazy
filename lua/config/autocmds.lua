-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--#region

local map = LazyVim.safe_keymap_set

-- For disable autoformat
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cc", "cpp", "h" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- For yaml & ansible
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "yaml.ansible", "ansible" },
  callback = function(args)
    map("n", "<localleader>r", function()
      require("ansible").run()
    end, { desc = "Ansible Run Playbook/Role", buffer = args.buf })
  end,
})

-- For json
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json" },
  callback = function(args)
    -- Define format json hotkey
    map("n", "<localleader>f", ":%!jq .<CR>", { desc = "Format JSON file", buffer = args.buf })
    map("v", "<localleader>f", ":'<,'>!jq .<CR>", { desc = "Format selected JSON", buffer = args.buf })

    -- Define compact json
    map("n", "<localleader>c", ":%!jq -c .<CR>", { desc = "Compact JSON file", buffer = args.buf })
    map("v", "<localleader>c", ":'<,'>!jq -c .<CR>", { desc = "Compact selected JSON", buffer = args.buf })
  end,
})
