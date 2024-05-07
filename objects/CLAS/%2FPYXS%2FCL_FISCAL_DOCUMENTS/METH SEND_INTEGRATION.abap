  METHOD send_integration.
*    DATA lt_doc TYPE TABLE OF zpyxssped_nf_out.

    LOOP AT t_out INTO DATA(ls_doc).
*      CLEAR lt_doc[].
*      APPEND ls_doc TO lt_doc.
      DATA(json_out) = /ui2/cl_json=>serialize(
        EXPORTING
          data             = ls_doc
          compress         = abap_true
*        name             =
           pretty_name      = 'L'
*        type_descr       =
           assoc_arrays     = abap_false
*        ts_as_iso8601    =
*        expand_includes  =
           assoc_arrays_opt = abap_false
*        numc_as_string   =
*        name_mappings    =
*        conversion_exits =
*        format_output    =
*        hex_as_base64    =
*      RECEIVING
*        r_json           =
      ).

      json_out = /pyxs/json_conversion=>convert_json( json_out ).
      DATA: lr_cscn TYPE if_com_scenario_factory=>ty_query-cscn_id_range.

      " find CA by scenario
      lr_cscn = VALUE #( ( sign = 'I' option = 'EQ' low = 'ZPYXSSPED_COM_NF' ) ).
      DATA(lo_factory) = cl_com_arrangement_factory=>create_instance( ).
      lo_factory->query_ca(
        EXPORTING
          is_query           = VALUE #( cscn_id_range = lr_cscn )
        IMPORTING
          et_com_arrangement = DATA(lt_ca) ).

      IF lt_ca IS INITIAL.
        EXIT.
      ENDIF.

      " take the first one
      READ TABLE lt_ca INTO DATA(lo_ca) INDEX 1.

      " get destination based to Communication Arrangement
      TRY.
          DATA(lo_dest) = cl_http_destination_provider=>create_by_comm_arrangement(
              comm_scenario  = '/PYXS/SPED'
              service_id     = '/PYXS/FISCAL_REST'
              comm_system_id = lo_ca->get_comm_system_id( ) ).

          DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination( lo_dest ).

          " execute the request
          DATA(lo_request) = lo_http_client->get_http_request( ).
          lo_request->set_text(
            EXPORTING
              i_text   = json_out
*            i_offset = 0
*            i_length = -1
*          RECEIVING
*            r_value  =
          ).
          lo_request->set_header_field(
            EXPORTING
              i_name  = 'Avalara-Location-Code'
              i_value = |{ gv_cnpj }|
*          RECEIVING
*            r_value =
          ).
*        CATCH cx_web_message_error.
*        CATCH cx_web_message_error.
          DATA(lo_response) = lo_http_client->execute( if_web_http_client=>post ).
          DATA(lv_ret) = lo_response->get_status( ).
          IF lv_ret-code = '200'.
            DATA(lv_msg) = lo_response->get_text( ).
            IF lv_msg IS INITIAL.
              gv_proc = 'Processado com sucesso'.
            ELSE.
              gv_proc = lv_msg.
            ENDIF.
          ELSE.
            gv_proc = |Erro: { lv_ret-reason }|.
          ENDIF.

        CATCH cx_http_dest_provider_error.
          " handle exception here

        CATCH cx_web_http_client_error.
          " handle exception here
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.