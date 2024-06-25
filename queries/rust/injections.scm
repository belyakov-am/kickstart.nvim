(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_scalar")
  )

  (token_tree
    (raw_string_literal
      (string_content) @injection.content
    )
  )

  (#set! injection.language "sql")
)

(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_scalar")
  )

  (token_tree
    (string_literal
      (string_content) @injection.content
    )
  )

  (#set! injection.language "sql")
)
