return {
  {
    'vyfor/cord.nvim',
    build = ':Cord update',
    opts = function()
      return require('config.cord-config')
    end,
  },
}
