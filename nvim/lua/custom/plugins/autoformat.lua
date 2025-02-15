return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = {
        c = true,
        cpp = true,
      }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    -- log_level = vim.log.levels.DEBUG,
    formatters = {
      custom_tf_fmt = {
        command = 'tf',
        args = { 'fmt', '-list=false', '-no-color', '$FILENAME' },
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = {
        'prettierd',
        'prettier',
        stop_after_first = true,
      },
      typescript = {
        'prettierd',
        'prettier',
        stop_after_first = true,
      },
      go = {
        'goimports',
        'gofmt',
      },
      nix = {
        'nixfmt',
      },
      terraform = {
        -- 'terraform_fmt',
        'custom_tf_fmt',
      },
    },
  },
}
