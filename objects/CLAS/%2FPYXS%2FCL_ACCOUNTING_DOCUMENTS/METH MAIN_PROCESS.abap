  METHOD main_process.
    read_db(  ).
    map(  ).
    /PYXS/integration=>send_integration(
      EXPORTING
        comm_scenario = '/PYXS/SPED'
        service_id    = '/PYXS/ACCOUNT_REST'
*        cnpj          =
        data          = t_out
*      RECEIVING
*        message       =
    ).
  ENDMETHOD.