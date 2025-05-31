-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.o.showtabline = 2
vim.g.snacks_animate = false
vim.b.autoformat = false

vim.filetype.add({
  pattern = { ["jenkinsfile"] = "groovy" },
  filename = { ["Jenkinsfile"] = "groovy" },
})

vim.cmd([[au BufNewFile,BufRead *.jenkinsfile,*.Jenkinsfile,Jenkinsfile,jenkinsfile setf groovy]])
