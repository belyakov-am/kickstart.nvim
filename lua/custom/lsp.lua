
return {
  format = function(...)
    vim.lsp.buf.format {
      filter = function(client)
        return client.name ~= 'tsserver'
      end,
      unpack(...),
    }
  end,
}

