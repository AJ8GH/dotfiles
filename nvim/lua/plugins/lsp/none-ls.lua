return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    local nls = require("null-ls")
    local fmt = nls.builtins.formatting
    local dgn = nls.builtins.diagnostics
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    nls.setup({
      sources = {
        -- # DIAGNOSTICS #
        dgn.checkstyle.with({
          extra_args = {
            "-c",
            vim.fn.expand("~/Projects/dotfiles/config/checkstyle.xml"),
          },
        }),
        -- # FORMATTING #
        fmt.google_java_format,
        fmt.gofumpt,
        fmt.goimports_reviser,
        fmt.golines,
        fmt.stylua,
        fmt.prettier,
        -- python
        fmt.black,
        fmt.isort,
        -- sql
        -- fmt.sqlfmt,
        -- fmt.sleek,
        -- fmt.sql_formatter.with({ command = { "sleek" } }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
