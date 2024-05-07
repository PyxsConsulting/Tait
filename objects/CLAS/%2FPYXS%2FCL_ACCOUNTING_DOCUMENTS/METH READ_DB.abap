  METHOD read_db.
    SELECT hdr~*, itm~*, cpn~*
      FROM i_journalentry AS hdr
      INNER JOIN I_OperationalAcctgDocItem AS itm
      ON hdr~CompanyCode = itm~CompanyCode
      AND hdr~AccountingDocument = itm~AccountingDocument
      AND hdr~FiscalYear = itm~fiscalYear
      INNER JOIN I_CompanyCode as cpn
      ON cpn~CompanyCode = hdr~CompanyCode
      WHERE hdr~companyCode = @sel-companycode
        AND hdr~PostingDate IN @sel-postingdate
        AND hdr~AccountingDocument IN @sel-accountingdocument
        AND hdr~FiscalYear IN @sel-fiscalyear
        AND hdr~AccountingDocumentType IN @sel-documenttype
        AND itm~GLAccount IN @sel-account
        AND hdr~AccountingDocumentCategory IN @open
        INTO TABLE @t_data.
  ENDMETHOD.