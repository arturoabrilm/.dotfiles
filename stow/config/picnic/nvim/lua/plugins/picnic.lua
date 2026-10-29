-- Picnic monorepo integration. Self-contained: delete this file (or set
-- `vim.g.picnic = false` in init.lua) to opt out. Nothing else references it.
--
-- `guide lint`/`guide fix` run the project's pinned ruff with a config bundled in
-- picnic-guide (select = ALL, google docstrings, ...) instead of any project config. Here
-- we point the ruff LSP and the format-on-save step at that same config *and* at the venv's
-- ruff binary, when the project's venv contains picnic-guide.
-- Without it (non-Picnic project, venv not installed) the regular setup applies.
if vim.g.picnic == false then return {} end

local GUIDE_RUFF = "/lib/python*/site-packages/picnic/guide/linters/ruff/ruff.toml"

--- picnic-guide's ruff.toml and the venv's ruff binary for the project containing `path`.
--- Returns nil when picnic-guide isn't installed in the project's venv.
---@return { config: string, bin: string? }?
local function guide_ruff(path)
  -- `path` is nil for the LSP when the file has no project root (e.g. a loose script).
  local root = path and path ~= "" and vim.fs.root(path, "pyproject.toml")
  local venvs = {}
  if root then table.insert(venvs, root .. "/.venv") end
  if vim.env.VIRTUAL_ENV then table.insert(venvs, vim.env.VIRTUAL_ENV) end
  for _, venv in ipairs(venvs) do
    local config = vim.fn.glob(venv .. GUIDE_RUFF, false, true)[1]
    if config then
      local bin = venv .. "/bin/ruff"
      return { config = config, bin = vim.fn.executable(bin) == 1 and bin or nil }
    end
  end
end

-- Ruff LSP: same ruff version and rules as CI. Merges with the `ruff` config in lsp.lua.
-- Picked up when the server starts; run :LspRestart after `poetry install`.
vim.lsp.config("ruff", {
  cmd = function(dispatchers, config)
    local guide = guide_ruff(config.root_dir)
    return vim.lsp.rpc.start({ guide and guide.bin or "ruff", "server" }, dispatchers)
  end,
  before_init = function(params, config)
    local guide = guide_ruff(config.root_dir)
    if guide then
      -- `params` is the already-built initialize request, so edit it, not config.init_options.
      params.initializationOptions = vim.tbl_deep_extend("force", params.initializationOptions or {}, {
        settings = { configuration = guide.config, configurationPreference = "editorFirst" },
      })
    end
  end,
})

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      local default = opts.formatters_by_ft.python
      local command = function(_, ctx)
        local guide = guide_ruff(ctx.dirname)
        return guide and guide.bin or "ruff"
      end
      local args = function(_, ctx)
        local guide = guide_ruff(ctx.dirname)
        return guide and { "--config", guide.config } or {}
      end
      opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
        ruff_fix = { command = command, append_args = args },
        ruff_format = { command = command, append_args = args },
      })
      -- Same order as `guide fix`: apply all autofixes (incl. import sorting), then format.
      opts.formatters_by_ft.python = function(bufnr)
        if guide_ruff(vim.api.nvim_buf_get_name(bufnr)) then
          return { "ruff_fix", "ruff_format" }
        end
        return default
      end
    end,
  },
}
