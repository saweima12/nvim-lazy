return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        window = {
          min_width = 10,
          max_width = 80,
          max_height = 20,
          border = "rounded",
          winblend = 0,
          scrollbar = true,
        },
      },
    },
  },
}
