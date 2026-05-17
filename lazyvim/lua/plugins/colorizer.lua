return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = function()
    return require('config.colorizer-config')
  end,
}
