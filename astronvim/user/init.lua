return {
  colorscheme = "gruvbox",
  plugins = {
    {
      "ellisonleao/gruvbox.nvim",
      as = "gruvbox",
      config = function()
        require("gruvbox").setup {}
      end,
    },
  }
}
