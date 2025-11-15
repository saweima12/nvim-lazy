return {
  "akinsho/bufferline.nvim",
  optional = true,
  opts = function(_, opts)
    if (vim.g.colors_name or ""):find("catppuccin") then
      local ok, mod = pcall(require, "catppuccin.groups.integrations.bufferline")
      if ok then
        local get = mod.get_theme or mod.get
        if type(get) == "function" then
          opts.highlights = get({})
        end
      end
    end
  end,
}
