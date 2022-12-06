local lsp = require("lspconfig");

local on_attach = function(_, bufnr)
  local map = require("ayush.keymaps").map;
  local opts = function(desc)
    return {
      buffer = bufnr,
      desc = desc
    }
  end

  map("n", "gi", vim.lsp.buf.implementation, opts("Implementation"));
  map("n", "gt", vim.lsp.buf.type_definition, opts("Type Definition"));
  map("n", "gd", vim.lsp.buf.definition, opts("Definition"));
  map("n", "K", vim.lsp.buf.hover, opts("Hover"));
  map('n', '<leader>hl', vim.lsp.buf.document_highlight, opts("Highlight symbol"))
  map('n', '<leader>rn', vim.lsp.buf.rename, opts("Rename"))
  map('n', '<leader>ca', function() vim.lsp.buf.code_action({ apply = true }) end, opts("Code actions"))
  map('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts("Format"))
  map('n', 'gr', vim.lsp.buf.references, opts("References"))

  map('n', '[d', vim.diagnostic.goto_prev, opts("Previous diagnostic"))
  map('n', ']d', vim.diagnostic.goto_next, opts("Next diagnostic"))

  vim.cmd [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
end

local capabilities = require('cmp_nvim_lsp').default_capabilities();

lsp.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
});

lsp.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
});
