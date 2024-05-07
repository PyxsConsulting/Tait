  PRIVATE SECTION.
    DATA: sel    TYPE ty_Sel,
          open   TYPE RANGE OF i_journalEntry-AccountingDocumentCategory,
          t_out  TYPE TABLE OF ty_main,
          t_Data TYPE TABLE OF ty_data.
    METHODS read_db.
    METHODS map.