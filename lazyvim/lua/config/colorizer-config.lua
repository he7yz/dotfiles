-- Enable all CSS color formats
require("colorizer").setup({
  options = { parsers = { css = true } },
})

-- CSS functions only, with virtualtext display
require("colorizer").setup({
  options = {
    parsers = { css_fn = true },
    display = {
      mode = "virtualtext",
      virtualtext = { position = "after" },
    },
  },
})

-- Preset with individual override
require("colorizer").setup({
  options = {
    parsers = { css = true, rgb = { enable = false } },
  },
})

-- Per-filetype overrides
require("colorizer").setup({
  filetypes = {
    "*",
    "!markdown",
    html = { mode = "foreground" },
    cmp_docs = { always_update = true },
  },
})
