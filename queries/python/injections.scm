(await 
  (call 
    function: 
      (attribute
        attribute: (identifier) @_method (#any-of? @_method "execute" "executemany" "fetch" "fetchrow" "fetchval")
      ) 
    arguments: 
      (argument_list
 (string (string_content) @injection.content)
      )
  )

  (#set! injection.language "sql")
)
