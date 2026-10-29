return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    opts = { file_types = { "markdown", "codecompanion" } },
    keys = {
      { "<leader>um", "<cmd>RenderMarkdown buf_toggle<cr>", desc = "Toggle markdown render" },
    },
  },
}
