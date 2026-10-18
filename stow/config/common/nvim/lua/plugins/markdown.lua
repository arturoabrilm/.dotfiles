return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    opts = {},
    keys = {
      { "<leader>um", "<cmd>RenderMarkdown buf_toggle<cr>", desc = "Toggle markdown render" },
    },
  },
}
