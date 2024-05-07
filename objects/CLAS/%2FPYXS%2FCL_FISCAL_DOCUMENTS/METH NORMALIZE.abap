  METHOD normalize.
    normalized = p_str.
    TRANSLATE: normalized USING '. ',
               normalized USING '- ',
               normalized USING '/ '.
    CONDENSE normalized NO-GAPS.
  ENDMETHOD.