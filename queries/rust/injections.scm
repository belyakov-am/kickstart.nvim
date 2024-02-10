(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_scalar")
  )

  (token_tree
    (raw_string_literal) @injection.content
  ) 

  ; Trim leading `r#"` and trailing `"#`.
  (#offset! @injection.content 0 3 0 -2)
  (#set! injection.language "sql")
)

(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#any-of? @_name "query" "query_as" "query_scalar")
  )

  (token_tree
    (string_literal) @injection.content
  )

  ; Trim leading `"` and trailing `"`.
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "sql")
)
