  METHOD if_rap_query_provider~select.
    DATA lt_ret TYPE TABLE OF /pyxs/nf_service.
    DATA(top)     = io_request->get_paging( )->get_page_size( ).
    DATA(skip)    = io_request->get_paging( )->get_offset( ).
    DATA(requested_fields)  = io_request->get_requested_elements( ).
    DATA(sort_order)    = io_request->get_sort_elements( ).
    DATA(entity) = io_request->get_entity_id(  ).
    CASE entity.
      WHEN 'ZPYXSSPED_NF_SERVICE'.
        TRY.
            DATA(filter) = io_request->get_filter(  )->get_as_ranges(  ).
            sel-company = filter[ name = 'COMPANY' ]-range[ 1 ]-low.
            sel-branch = filter[ name = 'BRANCH' ]-range[ 1 ]-low.
            IF line_exists( filter[ name = 'CREATION' ] ).
              MOVE-CORRESPONDING filter[ name = 'CREATION' ]-range TO sel-creation.
            ENDIF.
            IF line_exists( filter[ name = 'CATEGORY' ] ).
              MOVE-CORRESPONDING filter[ name = 'CATEGORY' ]-range TO sel-category.
            ENDIF.
            IF line_exists( filter[ name = 'DOCUMENT' ] ).
              MOVE-CORRESPONDING filter[ name = 'DOCUMENT' ]-range TO sel-document.
            ENDIF.
            IF line_exists( filter[ name = 'DOCDATE' ] ).
              MOVE-CORRESPONDING filter[ name = 'DOCDATE' ]-range TO sel-docdate.
            ENDIF.
            IF line_exists( filter[ name = 'PSTDATE' ] ).
              MOVE-CORRESPONDING filter[ name = 'PSTDATE' ]-range TO sel-pstdate.
            ENDIF.
            IF line_exists( filter[ name = 'DSAIENT' ] ).
              MOVE-CORRESPONDING filter[ name = 'DSAIENT' ]-range TO sel-dsaient.
            ENDIF.
            IF line_exists( filter[ name = 'CHANGED' ] ).
              MOVE-CORRESPONDING filter[ name = 'CHANGED' ]-range TO sel-changed.
            ENDIF.
            me->main_process( ).
            APPEND  VALUE #( proc_res = |Processamento: { gv_proc } | ) TO lt_ret.
            io_response->set_data( lt_ret ).
            io_response->set_total_number_of_records( iv_total_number_of_records = 1 ).
          CATCH cx_rap_query_filter_no_range INTO DATA(lx_excpt).
            io_response->set_total_number_of_records( iv_total_number_of_records = 0 ).
        ENDTRY.
    ENDCASE.
  ENDMETHOD.