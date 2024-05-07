  METHOD read_nf_db.
    TYPES: BEGIN OF ty_docref,
             br_nfreferencedocument TYPE i_br_nfdocument-br_notafiscal,
           END OF ty_docref,
           BEGIN OF ty_awkey,
             br_nfsourcedocumentnumber TYPE i_journalentry-originalreferencedocument,
           END OF ty_awkey.

    DATA: lt_docref TYPE TABLE OF ty_docref,
          lt_awkey  TYPE TABLE OF  ty_awkey,
          r_docnum  TYPE RANGE OF i_br_nfdocument-br_notafiscal.

    SELECT *
      FROM i_br_nfdocument
      WHERE companycode = @sel-company
        AND businessplace = @sel-branch
        AND creationdate IN @sel-creation
        AND br_nfdocumenttype IN @sel-category
        AND br_notafiscal IN @sel-document
        AND br_nfissuedate IN @sel-docdate
        AND br_nfpostingdate IN @sel-pstdate
        AND br_nfarrivalordeparturedate IN @sel-dsaient
        AND lastchangedate IN @sel-changed
      INTO TABLE @t_nfdocs. "J_1BNFDOC/J_1BNFNAD

    SELECT *
      FROM i_br_nfpartner
      FOR ALL ENTRIES IN @t_nfdocs
      WHERE br_notafiscal = @t_nfdocs-br_notafiscal
      INTO TABLE @t_partner.

    " SELECT * FROM I_BR_NFMessage INTO @DATA(ltmsg).

    LOOP AT t_nfdocs INTO DATA(ls_nf).
      APPEND VALUE #( sign = 'I' option = 'EQ' low = ls_nf-br_notafiscal ) TO r_docnum.
    ENDLOOP.

    "MOVE-CORRESPONDING t_nfdocs TO lt_docref.
    "DELETE lt_docref WHERE BR_NFReferenceDocument IS INITIAL.

    SELECT *
      FROM /pyxs/nf_branch
      FOR ALL ENTRIES IN @t_nfdocs
      WHERE cod_estab = @t_nfdocs-businessplace
     INTO TABLE @t_branch.



    SELECT *
      FROM i_br_nftax
       FOR ALL ENTRIES IN @t_nfdocs
      WHERE br_notafiscal = @t_nfdocs-br_notafiscal
      INTO TABLE @t_nftax_itm. " J_1BNFSTX


    LOOP AT t_nftax_itm INTO DATA(ls_nftax).
      READ TABLE t_nftax ASSIGNING FIELD-SYMBOL(<tax>)
      WITH KEY
        br_notafiscal = ls_nftax-br_notafiscal
        br_taxtype = ls_nftax-br_taxtype
        taxgroup = ls_nftax-taxgroup.
      IF sy-subrc IS INITIAL.
        <tax>-br_nfitembaseamount += ls_nftax-br_nfitembaseamount.
        <tax>-br_nfitemtaxamount += ls_nftax-br_nfitemtaxamount.
      ELSE.
        APPEND ls_nftax TO t_nftax.
      ENDIF.
    ENDLOOP.

    SELECT *
      FROM i_br_nfimportdocument
      FOR ALL ENTRIES IN @t_nfdocs
      WHERE br_notafiscal = @t_nfdocs-br_notafiscal
      INTO TABLE @t_imp_di. " J_1BNFIMPORT_DI

    SELECT *
      FROM i_br_nfeactive
      FOR ALL ENTRIES IN @t_nfdocs
      WHERE br_notafiscal = @t_nfdocs-br_notafiscal
      INTO TABLE @t_active. " J_1BNFE_ACTIVE

    SELECT *                                  "#EC CI_FAE_LINES_ENSURED
      FROM i_br_nfeactive
      FOR ALL ENTRIES IN @lt_docref
      WHERE br_notafiscal = @lt_docref-br_nfreferencedocument
      INTO TABLE @t_active_ref. " J_1BNFE_ACTIVE

    MOVE-CORRESPONDING t_nfitem TO lt_awkey.

    SELECT companycode, fiscalyear, accountingdocument, originalreferencedocument "#EC CI_FAE_LINES_ENSURED
      FROM i_journalentry
      FOR ALL ENTRIES IN @lt_awkey
     WHERE originalreferencedocument = @lt_awkey-br_nfsourcedocumentnumber
       INTO TABLE @t_bkpf. " BKPF

    SELECT companycode, fiscalyear, accountingdocument, ledgergllineitem, financialaccounttype,
            controllingdebitcreditcode, netduedate, invoicereference
      FROM i_glaccountlineitemrawdata
      FOR ALL ENTRIES IN @t_bkpf
      WHERE companycode = @t_bkpf-companycode
        AND fiscalyear = @t_bkpf-fiscalyear
        AND accountingdocument = @t_bkpf-accountingdocument
        INTO TABLE @t_bseg. "BSEG

    SELECT companycode, fiscalyear, accountingdocument, accountingdocumentitem, withholdingtaxtype, "#EC CI_NO_TRANSFORM
            withholdingtaxcode, whldgtaxbaseamtincocodecrcy, whldgtaxamtincocodecrcy, withholdingtaxpercent,
            clearingaccountingdocument, clearingdate
      FROM i_withholdingtaxitem
       FOR ALL ENTRIES IN @t_bkpf
      WHERE companycode = @t_bkpf-companycode
        AND fiscalyear = @t_bkpf-fiscalyear
        AND accountingdocument = @t_bkpf-accountingdocument
        AND withholdingtaxcode <> ''
        INTO TABLE @t_withtax.



    SELECT nf~*, a~product, a~producttype, a~baseunit, b~alternativeunit, b~quantitynumerator,
            c~plant, c~iscoproduct,
            a~\_producttype-referenceproducttype,
            nf~\_BaseUnit-UnitOfMeasureISOCode, nf~\_BaseUnit-UnitOfMeasure_E
      FROM i_br_nfitem AS nf
      LEFT OUTER JOIN i_product AS a
      ON nf~material = a~product
      LEFT OUTER JOIN i_productunitsofmeasure AS b
      ON a~product = b~product
      LEFT OUTER JOIN I_ProductPlantBasic AS c
      ON a~product = c~product
      AND c~plant = nf~Plant
      WHERE nf~br_notafiscal IN @r_docnum
      INTO TABLE @t_nfitem. "J_BNFLIN

    SELECT *
      FROM i_regiontext
      WHERE language = 'P'
        AND country = 'BR'
      INTO TABLE @t_region.

    SELECT *
      FROM i_countrytext
     WHERE language = 'P'
     INTO TABLE @t_country.

    SELECT *                                       "#EC CI_NO_TRANSFORM
      FROM i_unitofmeasuretext
      FOR ALL ENTRIES IN @t_nfitem
     WHERE unitofmeasure = @t_nfitem-nf-baseunit
     AND language = 'P'
     INTO TABLE @t_units.

  ENDMETHOD.