return {
  {
    "echasnovski/mini.nvim",
    version = false,
    event = "VeryLazy",
    config = function()
      require("mini.statusline").setup()
      require("mini.pairs").setup()
      require("mini.icons").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
