  METHOD main_process.
    " Notas Campos não mapeados:
    " Motivo de cancelamento (p_doc_fiscal)
    " Fax (endereço do local de negócio)
    " NIRE (local de negócio)
    " CNAE (local de negócio)
    " vol_unit (header)
    " dcompet (header)
    " modnfsv (header)
    " SUFRAMA (parceiro)
    " optante_simplesnacional (parceiro)
    " email (parceiro)
    " ls_mbew-mtuse (item)
    " p_doc_item-nat_oper-descricao
    " Estrutura IMPORT j_1bnfimport_adi/j_1bnfimport_di
    " Motivo desoneração (item)
    data = cl_abap_context_info=>get_system_date( ).
    hora = cl_abap_context_info=>get_system_time( ).

    read_nf_db(  ).
    new_out(  ).
    send_integration( ).
  ENDMETHOD.