(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_scalar")
  )

  (token_tree
    (raw_string_literal) @injection.content
  ) 

  (#offset! @injection.content 1 0 0 0)
  (#set! injection.language "sql")
)
