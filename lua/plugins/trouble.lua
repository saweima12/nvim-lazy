-- local function toggleLspFinder(trouble)
--   local opts = {
--     mode = "lsp",
--     focus = true,
--     win = {
--       type = "split",
--       position = "bottom",
--     },
--     preview = {
--       type = "float",
--       border = "bold",
--       minimal = false,
--       size = { width = 0.8, height = 0.7 },
--       position = { 0, 0.5 },
--     },
--   }
--
--   trouble.toggle(opts)
-- end

return {
  "folke/trouble.nvim",
  cmd = "Trouble",
}
