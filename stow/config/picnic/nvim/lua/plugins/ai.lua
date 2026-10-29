return {
  {
    "olimorris/codecompanion.nvim",
    version = "^20.0.0",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions", "CodeCompanionCLI" },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI chat toggle" },
      { "<leader>as", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "AI chat add selection" },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI actions" },
      -- CLI agent (claude in a terminal split). Not <LocalLeader>c*: it equals <leader> here and clashes with <leader>ca.
      { "<leader>ao", function() require("codecompanion").toggle() end, desc = "AI CLI/chat toggle" },
      { "<leader>an", "<cmd>CodeCompanionCLI<cr>", desc = "AI CLI new agent" },
      { "<leader>ak", function() require("codecompanion").cli({ prompt = true }) end, mode = { "n", "v" }, desc = "AI CLI prompt (selection is sent)" },
      { "<leader>at", function() require("codecompanion").cli("#{this}", { focus = false }) end, mode = { "n", "v" }, desc = "AI CLI add buffer/selection" },
      { "<leader>ad", function() require("codecompanion").cli("#{diagnostics} Can you fix these?", { focus = false, submit = true }) end, desc = "AI CLI fix diagnostics" },
    },
    opts = {
      -- Claude Code over ACP (needs `claude-agent-acp` on PATH); auth reuses the `claude` login,
      -- or export CLAUDE_CODE_OAUTH_TOKEN in the shell (never commit it).
      -- inline/cmd/background interactions default to the copilot adapter and are left unused.
      interactions = {
        chat = { adapter = "claude_code" },
        cli = {
          agent = "claude_code",
          agents = {
            claude_code = { cmd = "claude", args = {}, description = "Claude Code CLI" },
            codex = { cmd = "codex", args = {}, description = "OpenAI Codex CLI" },
          },
          opts = { auto_insert = true },
        },
      },
      -- Codex (`:CodeCompanionChat adapter=codex` or `ga` in a chat) signs in with ChatGPT, not an API key.
      adapters = {
        acp = {
          codex = function()
            return require("codecompanion.adapters").extend("codex", {
              defaults = { auth_method = "chat-gpt" },
            })
          end,
        },
      },
      display = {
        chat = { window = { width = 0.4 } },
      },
    },
  },
}
