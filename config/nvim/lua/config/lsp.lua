local shared = require("config.lsp_shared")

vim.lsp.config('*', {
  capabilities = shared.capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    shared.on_attach(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
  end,
})

vim.lsp.config('expert', {
  cmd = { 'expert', '--stdio' },
  filetypes = { 'elixir', 'eelixir', 'heex' },
  root_markers = { 'mix.exs' },
})

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
})

vim.lsp.config('solargraph', {
  init_options = {
    formatting = true
  },
  settings = {
    solargraph = {
      diagnostics = true,
    }
  }
})

vim.lsp.config('ts_ls', {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
})

vim.lsp.config('tailwindcss', {
  filetypes = {
    "eelixir",
    "elixir",
    "eruby",
    "heex",
    "html",
    "html-eex"
  },
  init_options = {
    userLanguages = {
      elixir = "phoenix-heex",
      heex = "phoenix-heex",
    },
  }
})

vim.lsp.config('emmet_ls', {
  filetypes = {
    "html",
    "css",
    "javascriptreact",
    "typescriptreact",
    "heex",
    "eelixir",
  },
})

vim.lsp.config('eslint', {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = { workingDirectory = { mode = "auto" } },
})

vim.lsp.enable({ 'expert', 'lua_ls', 'solargraph', 'ts_ls', 'tailwindcss', 'eslint', 'emmet_ls' })
-- Note: dartls is NOT listed here — flutter-tools manages it via lspconfig
