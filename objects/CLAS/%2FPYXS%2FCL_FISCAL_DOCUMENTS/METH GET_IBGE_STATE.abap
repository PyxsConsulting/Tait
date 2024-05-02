  METHOD get_ibge_state.
    CONSTANTS:
      gc_ro_uf   TYPE c LENGTH 2 VALUE 'RO',
      gc_ro_ibge TYPE c LENGTH 2 VALUE '11',
      gc_ac_uf   TYPE c LENGTH 2 VALUE 'AC',
      gc_ac_ibge TYPE c LENGTH 2 VALUE '12',
      gc_am_uf   TYPE c LENGTH 2 VALUE 'AM',
      gc_am_ibge TYPE c LENGTH 2 VALUE '13',
      gc_rr_uf   TYPE c LENGTH 2 VALUE 'RR',
      gc_rr_ibge TYPE c LENGTH 2 VALUE '14',
      gc_pa_uf   TYPE c LENGTH 2 VALUE 'PA',
      gc_pa_ibge TYPE c LENGTH 2 VALUE '15',
      gc_ap_uf   TYPE c LENGTH 2 VALUE 'AP',
      gc_ap_ibge TYPE c LENGTH 2 VALUE '16',
      gc_to_uf   TYPE c LENGTH 2 VALUE 'TO',
      gc_to_ibge TYPE c LENGTH 2 VALUE '17',
      gc_ma_uf   TYPE c LENGTH 2 VALUE 'MA',
      gc_ma_ibge TYPE c LENGTH 2 VALUE '21',
      gc_pi_uf   TYPE c LENGTH 2 VALUE 'PI',
      gc_pi_ibge TYPE c LENGTH 2 VALUE '22',
      gc_ce_uf   TYPE c LENGTH 2 VALUE 'CE',
      gc_ce_ibge TYPE c LENGTH 2 VALUE '23',
      gc_rn_uf   TYPE c LENGTH 2 VALUE 'RN',
      gc_rn_ibge TYPE c LENGTH 2 VALUE '24',
      gc_pb_uf   TYPE c LENGTH 2 VALUE 'PB',
      gc_pb_ibge TYPE c LENGTH 2 VALUE '25',
      gc_pe_uf   TYPE c LENGTH 2 VALUE 'PE',
      gc_pe_ibge TYPE c LENGTH 2 VALUE '26',
      gc_al_uf   TYPE c LENGTH 2 VALUE 'AL',
      gc_al_ibge TYPE c LENGTH 2 VALUE '27',
      gc_se_uf   TYPE c LENGTH 2 VALUE 'SE',
      gc_se_ibge TYPE c LENGTH 2 VALUE '28',
      gc_ba_uf   TYPE c LENGTH 2 VALUE 'BA',
      gc_ba_ibge TYPE c LENGTH 2 VALUE '29',
      gc_mg_uf   TYPE c LENGTH 2 VALUE 'MG',
      gc_mg_ibge TYPE c LENGTH 2 VALUE '31',
      gc_es_uf   TYPE c LENGTH 2 VALUE 'ES',
      gc_es_ibge TYPE c LENGTH 2 VALUE '32',
      gc_rj_uf   TYPE c LENGTH 2 VALUE 'RJ',
      gc_rj_ibge TYPE c LENGTH 2 VALUE '33',
      gc_sp_uf   TYPE c LENGTH 2 VALUE 'SP',
      gc_sp_ibge TYPE c LENGTH 2 VALUE '35',
      gc_pr_uf   TYPE c LENGTH 2 VALUE 'PR',
      gc_pr_ibge TYPE c LENGTH 2 VALUE '41',
      gc_sc_uf   TYPE c LENGTH 2 VALUE 'SC',
      gc_sc_ibge TYPE c LENGTH 2 VALUE '42',
      gc_rs_uf   TYPE c LENGTH 2 VALUE 'RS',
      gc_rs_ibge TYPE c LENGTH 2 VALUE '43',
      gc_ms_uf   TYPE c LENGTH 2 VALUE 'MS',
      gc_ms_ibge TYPE c LENGTH 2 VALUE '50',
      gc_mt_uf   TYPE c LENGTH 2 VALUE 'MT',
      gc_mt_ibge TYPE c LENGTH 2 VALUE '51',
      gc_go_uf   TYPE c LENGTH 2 VALUE 'GO',
      gc_go_ibge TYPE c LENGTH 2 VALUE '52',
      gc_df_uf   TYPE c LENGTH 2 VALUE 'DF',
      gc_df_ibge TYPE c LENGTH 2 VALUE '53'.

    CASE p_bland.
        "Região Norte
      WHEN gc_ro_uf.
        p_cod_estado = gc_ro_ibge.
      WHEN gc_ac_uf.
        p_cod_estado = gc_ac_ibge.
      WHEN gc_am_uf.
        p_cod_estado = gc_am_ibge.
      WHEN gc_rr_uf.
        p_cod_estado = gc_rr_ibge.
      WHEN gc_pa_uf.
        p_cod_estado = gc_pa_ibge.
      WHEN gc_ap_uf.
        p_cod_estado = gc_ap_ibge.
      WHEN gc_to_uf.
        p_cod_estado = gc_to_ibge.

        "Região Nordeste
      WHEN gc_ma_uf.
        p_cod_estado = gc_ma_ibge.
      WHEN gc_pi_uf.
        p_cod_estado = gc_pi_ibge.
      WHEN gc_ce_uf.
        p_cod_estado = gc_ce_ibge.
      WHEN gc_rn_uf.
        p_cod_estado = gc_rn_ibge.
      WHEN gc_pb_uf.
        p_cod_estado = gc_pb_ibge.
      WHEN gc_pe_uf.
        p_cod_estado = gc_pe_ibge.
      WHEN gc_al_uf.
        p_cod_estado = gc_al_ibge.
      WHEN gc_se_uf.
        p_cod_estado = gc_se_ibge.
      WHEN gc_ba_uf.
        p_cod_estado = gc_ba_ibge.

        "Região Sudeste
      WHEN gc_mg_uf.
        p_cod_estado = gc_mg_ibge.
      WHEN gc_es_uf.
        p_cod_estado = gc_es_ibge.
      WHEN gc_rj_uf.
        p_cod_estado = gc_rj_ibge.
      WHEN gc_sp_uf.
        p_cod_estado = gc_sp_ibge.

        "Região Sul
      WHEN gc_pr_uf.
        p_cod_estado = gc_pr_ibge.
      WHEN gc_sc_uf.
        p_cod_estado = gc_sc_ibge.
      WHEN gc_rs_uf.
        p_cod_estado = gc_rs_ibge.

        "Região Centro-Oeste
      WHEN gc_ms_uf.
        p_cod_estado = gc_ms_ibge.
      WHEN gc_mt_uf.
        p_cod_estado = gc_mt_ibge.
      WHEN gc_go_uf.
        p_cod_estado = gc_go_ibge.
      WHEN gc_df_uf.
        p_cod_estado = gc_df_ibge.

      WHEN OTHERS.
        CLEAR: p_cod_estado.
    ENDCASE.
  ENDMETHOD.