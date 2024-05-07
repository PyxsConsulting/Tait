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
            sel-companyCode = filter[ name = 'COMPANY' ]-range[ 1 ]-low.


            io_response->set_data( lt_ret ).
            io_response->set_total_number_of_records( iv_total_number_of_records = 1 ).
          CATCH cx_rap_query_filter_no_range INTO DATA(lx_excpt).
            io_response->set_total_number_of_records( iv_total_number_of_records = 0 ).
        ENDTRY.
    ENDCASE.
  ENDMETHOD.