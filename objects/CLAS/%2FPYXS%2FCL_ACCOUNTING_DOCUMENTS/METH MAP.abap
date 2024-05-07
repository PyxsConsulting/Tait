  METHOD map.
    DATA: ls_lanc_cont TYPE ty_main.
    LOOP AT t_data INTO DATA(ls_document).
      ls_lanc_cont-companhia-codigocia = ls_document-itm-CompanyCode.
      ls_lanc_cont-estabelecimentofiscal-companhia-codigocia = ls_document-itm-CompanyCode.
      IF ls_document-itm-BusinessPlace IS NOT INITIAL.
        ls_lanc_cont-estabelecimentofiscal-codigo = ls_document-itm-BusinessPlace.
      ELSE.
        ls_lanc_cont-estabelecimentofiscal-codigo = '0001'.
      ENDIF.
      ls_lanc_cont-estabelecimentofiscal-companhia = ls_lanc_cont-companhia.
      ls_lanc_cont-planoconta-companhia = ls_lanc_cont-companhia.
      ls_lanc_cont-planoconta-codigo = ls_document-itm-GLAccount.
      ls_lanc_cont-planoconta-grupocontabil-companhia = ls_lanc_cont-companhia.
      ls_lanc_cont-planoconta-grupocontabil-codigo = ls_document-cpn-ChartOfAccounts.

      IF ls_document-itm-CostCenter IS NOT INITIAL.
        ls_lanc_cont-centrocusto-companhia = ls_lanc_cont-companhia.
        ls_lanc_cont-centrocusto-codigo = ls_document-itm-CostCenter.
      ENDIF.
      IF ls_document-itm-Customer IS NOT INITIAL.
        ls_lanc_cont-parceiro-companhia = ls_lanc_cont-companhia.
        ls_lanc_cont-parceiro-codigo = ls_document-itm-Customer.
      ELSEIF   ls_document-itm-Supplier IS NOT INITIAL.
        ls_lanc_cont-parceiro-companhia = ls_lanc_cont-companhia.
        ls_lanc_cont-parceiro-codigo = ls_document-itm-Supplier.
      ENDIF.
      ls_lanc_cont-codigolancamento = ls_document-itm-AccountingDocument.
      ls_lanc_cont-datalancamento =     ls_document-itm-PostingDate.
      IF sel-finish = ls_document-hdr-AccountingDocumentType.
        ls_lanc_cont-tipolancamento = 'E'.
      ELSE.
        ls_lanc_cont-tipolancamento = 'N'.
      ENDIF.
      ls_lanc_cont-sequencia = ls_document-itm-AccountingDocumentItem.
      IF ls_document-itm-DebitCreditCode = 'H'.
      ls_lanc_cont-natureza = 'C'.
      ELSE.
      ls_lanc_cont-natureza = 'C'.
      ENDIF.
      ls_lanc_cont-descricao = ls_document-itm-DocumentItemText.
      ls_lanc_cont-codigodivisaocontabil = ls_document-itm-BusinessArea.
      ls_lanc_cont-tipolancamentoerp = ls_document-hdr-AccountingDocumentType.
      APPEND ls_lanc_Cont TO t_out.
    ENDLOOP.
  ENDMETHOD.