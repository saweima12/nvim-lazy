return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      fish = { "fish" },
      groovy = { "npm-groovy-lint" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
      -- ["*"] = { "typos" },
    },

    linters = {
      ["npm-groovy-lint"] = {
        ignore_exitcode = true,
      },
    },
  },
}
