  METHOD convert_json.
    DATA: lv_json TYPE string.
          lv_json = json.
    IF lv_json IS NOT INITIAL.
      REPLACE ALL OCCURRENCES OF:
        gc_adm_fundos_clubes          IN lv_json WITH gc_adm_fundos_clubes_tc,
        gc_aliq_cofins                IN lv_json WITH gc_aliq_cofins_tc,
        gc_aliq_frete                 IN lv_json WITH gc_aliq_frete_tc,
        gc_aliq_icms                  IN lv_json WITH gc_aliq_icms_tc,
        gc_aliq_icms                  IN lv_json WITH gc_aliq_icms_tc,
        gc_aliq_icms_subst            IN lv_json WITH gc_aliq_icms_subst_tc,
        gc_aliq_ipi                   IN lv_json WITH gc_aliq_ipi_tc,
        gc_aliq_ir_fonte              IN lv_json WITH gc_aliq_ir_fonte_tc,
        gc_aliq_issqn                 IN lv_json WITH gc_aliq_issqn_tc,
        gc_aliq_pis                   IN lv_json WITH gc_aliq_pis_tc,
        gc_aliq_red_icms              IN lv_json WITH gc_aliq_red_icms_tc,
        gc_ano_competencia            IN lv_json WITH gc_ano_competencia_tc,
        gc_ano_declaracao             IN lv_json WITH gc_ano_declaracao_tc,
        gc_ano_mes_comp               IN lv_json WITH gc_ano_mes_comp_tc,
        gc_apur_ipi_periodo           IN lv_json WITH gc_apur_ipi_periodo_tc,
        gc_apur_irpj_csll             IN lv_json WITH gc_apur_irpj_csll_tc,
        gc_apur_irpj_csll_trim        IN lv_json WITH gc_apur_irpj_csll_trim_tc,
        gc_areas_livrecomercio        IN lv_json WITH gc_areas_livrecomercio_tc,
        gc_at_fixo_ind_item           IN lv_json WITH gc_at_fixo_ind_item_tc,
        gc_at_fixo_vlr_icms           IN lv_json WITH gc_at_fixo_vlr_icms_tc,
        gc_at_fixo_vlr_icmsdif        IN lv_json WITH gc_at_fixo_vlr_icmsdif_tc,
        gc_at_fixo_vlr_icmsfrete      IN lv_json WITH gc_at_fixo_vlr_icmsfrete_tc,
        gc_at_fixo_vlr_icmsst         IN lv_json WITH gc_at_fixo_vlr_icmsst_tc,
        gc_ativ_rural                 IN lv_json WITH gc_ativ_rural_tc,
        gc_ativo                      IN lv_json WITH gc_ativo_tc,
        gc_ativo_fixo_ind_doc         IN lv_json WITH gc_ativo_fixo_ind_doc_tc,
        gc_ativos_exterior            IN lv_json WITH gc_ativos_exterior_tc,
        gc_ato_conc_drawback          IN lv_json WITH gc_ato_conc_drawback_tc,
        gc_aus_debito_abr             IN lv_json WITH gc_aus_debito_abr_tc,
        gc_aus_debito_ago             IN lv_json WITH gc_aus_debito_ago_tc,
        gc_aus_debito_dez             IN lv_json WITH gc_aus_debito_dez_tc,
        gc_aus_debito_fev             IN lv_json WITH gc_aus_debito_fev_tc,
        gc_aus_debito_jan             IN lv_json WITH gc_aus_debito_jan_tc,
        gc_aus_debito_jul             IN lv_json WITH gc_aus_debito_jul_tc,
        gc_aus_debito_jun             IN lv_json WITH gc_aus_debito_jun_tc,
        gc_aus_debito_mai             IN lv_json WITH gc_aus_debito_mai_tc,
        gc_aus_debito_mar             IN lv_json WITH gc_aus_debito_mar_tc,
        gc_aus_debito_nov             IN lv_json WITH gc_aus_debito_nov_tc,
        gc_aus_debito_out             IN lv_json WITH gc_aus_debito_out_tc,
        gc_aus_debito_set             IN lv_json WITH gc_aus_debito_set_tc,
        gc_bairro                     IN lv_json WITH gc_bairro_tc,
        gc_cap_inf_incl_digital       IN lv_json WITH gc_cap_inf_incl_digital_tc,
        gc_cargo                      IN lv_json WITH gc_cargo_tc,
        gc_categ_nf                   IN lv_json WITH gc_categ_nf_tc,
        gc_categ_nf                   IN lv_json WITH gc_categ_nf_tc,
        gc_cei                        IN lv_json WITH gc_cei_tc,
        gc_cep                        IN lv_json WITH gc_cep_tc,
        gc_certif_digital             IN lv_json WITH gc_certif_digital_tc,
        gc_cfop                       IN lv_json WITH gc_cfop_tc,
        gc_chave_cte                  IN lv_json WITH gc_chave_cte_tc,
        gc_chave_cte_ref              IN lv_json WITH gc_chave_cte_ref_tc,
        gc_chave_nfe                  IN lv_json WITH gc_chave_nfe_tc,
        gc_classe_imposto             IN lv_json WITH gc_classe_imposto_tc,
        gc_classes_imposto            IN lv_json WITH gc_classes_imposto_tc,
        gc_cnpj                       IN lv_json WITH gc_cnpj_tc,
        gc_cnpj_incorporacao          IN lv_json WITH gc_cnpj_incorporacao_tc,
        gc_cod_anp                    IN lv_json WITH gc_cod_anp_tc,
        gc_cod_ant_item               IN lv_json WITH gc_cod_ant_item_tc,
        gc_cod_assinante              IN lv_json WITH gc_cod_assinante_tc,
        gc_cod_barra                  IN lv_json WITH gc_cod_barra_tc,
        gc_cod_bc_cred                IN lv_json WITH gc_cod_bc_cred_tc,
        gc_cod_categoria              IN lv_json WITH gc_cod_categoria_tc,
        gc_cod_cei                    IN lv_json WITH gc_cod_cei_tc,
        gc_cod_cfop                   IN lv_json WITH gc_cod_cfop_tc,
        gc_cod_cia                    IN lv_json WITH gc_cod_cia_tc,
        gc_cod_cia_desc               IN lv_json WITH gc_cod_cia_desc_tc,
        gc_cod_cl_consumo             IN lv_json WITH gc_cod_cl_consumo_tc,
        gc_cod_classif_fiscal         IN lv_json WITH gc_cod_classif_fiscal_tc,
        gc_cod_classse_ipi            IN lv_json WITH gc_cod_classse_ipi_tc,
        gc_cod_cnae                   IN lv_json WITH gc_cod_cnae_tc,
        gc_cod_conta_contabil         IN lv_json WITH gc_cod_conta_contabil_tc,
        gc_cod_enq_ipi                IN lv_json WITH gc_cod_enq_ipi_tc,
        gc_cod_estab                  IN lv_json WITH gc_cod_estab_tc,
        gc_cod_estado                 IN lv_json WITH gc_cod_estado_tc,
        gc_cod_ex_tipi                IN lv_json WITH gc_cod_ex_tipi_tc,
        gc_cod_ibge                   IN lv_json WITH gc_cod_ibge_tc,
        gc_cod_inc_trib               IN lv_json WITH gc_cod_inc_trib_tc,
        gc_cod_item                   IN lv_json WITH gc_cod_item_tc,
        gc_cod_lista_serv             IN lv_json WITH gc_cod_lista_serv_tc,
        gc_cod_modelo                 IN lv_json WITH gc_cod_modelo_tc,
        gc_cod_municipio              IN lv_json WITH gc_cod_municipio_tc,
        gc_cod_nat_bc_cred_piscofins  IN lv_json WITH gc_cod_nat_bc_cred_piscof_tc,
        gc_cod_nat_juridica           IN lv_json WITH gc_cod_nat_juridica_tc,
        gc_cod_nat_oper               IN lv_json WITH gc_cod_nat_oper_tc,
        gc_cod_obra                   IN lv_json WITH gc_cod_obra_tc,
        gc_cod_obra_filial            IN lv_json WITH gc_cod_obra_filial_tc,
        gc_cod_pais                   IN lv_json WITH gc_cod_pais_tc,
        gc_cod_rec_ir                 IN lv_json WITH gc_cod_rec_ir_tc,
        gc_cod_rec_iss                IN lv_json WITH gc_cod_rec_iss_tc,
        gc_cod_ref_integracao         IN lv_json WITH gc_cod_ref_integracao_tc,
        gc_cod_selo_ipi               IN lv_json WITH gc_cod_selo_ipi_tc,
        gc_cod_serv_munic             IN lv_json WITH gc_cod_serv_munic_tc,
        gc_cod_siaf                   IN lv_json WITH gc_cod_siaf_tc,
        gc_cod_siscomex               IN lv_json WITH gc_cod_siscomex_tc,
        gc_cod_sit_cofins             IN lv_json WITH gc_cod_sit_cofins_tc,
        gc_cod_sit_icms_taba          IN lv_json WITH gc_cod_sit_icms_taba_tc,
        gc_cod_sit_icms_tabb          IN lv_json WITH gc_cod_sit_icms_tabb_tc,
        gc_cod_sit_ipi                IN lv_json WITH gc_cod_sit_ipi_tc,
        gc_cod_sit_pis                IN lv_json WITH gc_cod_sit_pis_tc,
        gc_cod_situacao               IN lv_json WITH gc_cod_situacao_tc,
        gc_cod_tp_estab               IN lv_json WITH gc_cod_tp_estab_tc,
        gc_cod_tp_serv                IN lv_json WITH gc_cod_tp_serv_tc,
        gc_codigo                     IN lv_json WITH gc_codigo_tc,
        gc_com_eletr_ti               IN lv_json WITH gc_com_eletr_ti_tc,
        gc_companhia                  IN lv_json WITH gc_companhia_tc,
        gc_compl_ct_rodoviario        IN lv_json WITH gc_compl_ct_rodoviario_tc,
        gc_compl_obj_isencao          IN lv_json WITH gc_compl_obj_isencao_tc,
        gc_complemento                IN lv_json WITH gc_complemento_tc,
        gc_compll57                   IN lv_json WITH gc_compll57_tc,
        gc_contabilizacoes            IN lv_json WITH gc_contabilizacoes_tc,
        gc_contas_bancarias           IN lv_json WITH gc_contas_bancarias_tc,
        gc_conv_unid_med              IN lv_json WITH gc_conv_unid_med_tc,
        gc_cpf                        IN lv_json WITH gc_cpf_tc,
        gc_crc                        IN lv_json WITH gc_crc_tc,
        gc_data_es_nf                 IN lv_json WITH gc_data_es_nf_tc,
        gc_ddd                        IN lv_json WITH gc_ddd_tc,
        gc_ddd_fax                    IN lv_json WITH gc_ddd_fax_tc,
        gc_decl_retificadora          IN lv_json WITH gc_decl_retificadora_tc,
        gc_desc_compl                 IN lv_json WITH gc_desc_compl_tc,
        gc_desc_livre_com             IN lv_json WITH gc_desc_livre_com_tc,
        gc_desc_serv_munic            IN lv_json WITH gc_desc_serv_munic_tc,
        gc_desc_zonafranca            IN lv_json WITH gc_desc_zonafranca_tc,
        gc_descricao                  IN lv_json WITH gc_descricao_tc,
        gc_desenquadramento           IN lv_json WITH gc_desenquadramento_tc,
        gc_dig_agencia                IN lv_json WITH gc_dig_agencia_tc,
        gc_dig_conta                  IN lv_json WITH gc_dig_conta_tc,
        gc_doac_camp_eleitorais       IN lv_json WITH gc_doac_camp_eleitorais_tc,
        gc_doc_fisc_item_import       IN lv_json WITH gc_doc_fisc_item_import_tc,
        gc_dt_admissao                IN lv_json WITH gc_dt_admissao_tc,
        gc_dt_alt_parceiro            IN lv_json WITH gc_dt_alt_parceiro_tc,
        gc_dt_arq_ato_const           IN lv_json WITH gc_dt_arq_ato_const_tc,
        gc_dt_arq_ato_conv            IN lv_json WITH gc_dt_arq_ato_conv_tc,
        gc_dt_cancelamento            IN lv_json WITH gc_dt_cancelamento_tc,
        gc_dt_demissao                IN lv_json WITH gc_dt_demissao_tc,
        gc_dt_desenq_simples          IN lv_json WITH gc_dt_desenq_simples_tc,
        gc_dt_desenquadramento        IN lv_json WITH gc_dt_desenquadramento_tc,
        gc_dt_emissao_nf              IN lv_json WITH gc_dt_emissao_nf_tc,
        gc_dt_evento                  IN lv_json WITH gc_dt_evento_tc,
        gc_dt_exec_serv               IN lv_json WITH gc_dt_exec_serv_tc,
        gc_dt_incl_simples            IN lv_json WITH gc_dt_incl_simples_tc,
        gc_dt_nascimento              IN lv_json WITH gc_dt_nascimento_tc,
        gc_email                      IN lv_json WITH gc_email_tc,
        gc_endereco                   IN lv_json WITH gc_endereco_tc,
        gc_escrit_proc_eletronico     IN lv_json WITH gc_escrit_proc_eletronico_tc,
        gc_especie_volume             IN lv_json WITH gc_especie_volume_tc,
        gc_estab_fiscal               IN lv_json WITH gc_estab_fiscal_tc,
        gc_estado                     IN lv_json WITH gc_estado_tc,
        gc_fator_conversao            IN lv_json WITH gc_fator_conversao_tc,
        gc_fax                        IN lv_json WITH gc_fax_tc,
        gc_fim_periodo                IN lv_json WITH gc_fim_periodo_tc,
        gc_finor_finam_funres         IN lv_json WITH gc_finor_finam_funres_tc,
        gc_forma_escrituracao         IN lv_json WITH gc_forma_escrituracao_tc,
        gc_forma_trib_lucro           IN lv_json WITH gc_forma_trib_lucro_tc,
        gc_forma_tributacao           IN lv_json WITH gc_forma_tributacao_tc,
        gc_funcao                     IN lv_json WITH gc_funcao_tc,
        gc_grp_tensao                 IN lv_json WITH gc_grp_tensao_tc,
        gc_grp_trib                   IN lv_json WITH gc_grp_trib_tc,
        gc_grp_tributacao             IN lv_json WITH gc_grp_tributacao_tc,
        gc_hist_alteracoes            IN lv_json WITH gc_hist_alteracoes_tc,
        gc_id_campo_dapi_mg           IN lv_json WITH gc_id_campo_dapi_mg_tc,
        gc_id_companhia               IN lv_json WITH gc_id_companhia_tc,
        gc_id_contrato                IN lv_json WITH gc_id_contrato_tc,
        gc_id_doc_fisc_parc           IN lv_json WITH gc_id_doc_fisc_parc_tc,
        gc_id_qualif_assin            IN lv_json WITH gc_id_qualif_assin_tc,
        gc_id_sig_estab               IN lv_json WITH gc_id_sig_estab_tc,
        gc_idcontrato                 IN lv_json WITH gc_idcontrato_tc,
        gc_idsignatario               IN lv_json WITH gc_idsignatario_tc,
        gc_ie_subst                   IN lv_json WITH gc_ie_subst_tc,
        gc_impostos_retidos           IN lv_json WITH gc_impostos_retidos_tc,
        gc_incl_simples               IN lv_json WITH gc_incl_simples_tc,
        gc_ind_apur_contrib_cred      IN lv_json WITH gc_ind_apur_contrib_cred_tc,
        gc_ind_calc_receita           IN lv_json WITH gc_ind_calc_receita_tc,
        gc_ind_centr                  IN lv_json WITH gc_ind_centr_tc,
        gc_ind_ciap                   IN lv_json WITH gc_ind_ciap_tc,
        gc_ind_contrib_icms           IN lv_json WITH gc_ind_contrib_icms_tc,
        gc_ind_contrib_ipi            IN lv_json WITH gc_ind_contrib_ipi_tc,
        gc_ind_incid_trib             IN lv_json WITH gc_ind_incid_trib_tc,
        gc_ind_inscr_est_dest         IN lv_json WITH gc_ind_inscr_est_dest_tc,
        gc_ind_matrizfilial           IN lv_json WITH gc_ind_matrizfilial_tc,
        gc_ind_metodo_aprop_cred      IN lv_json WITH gc_ind_metodo_aprop_cred_tc,
        gc_ind_natureza_frete         IN lv_json WITH gc_ind_natureza_frete_tc,
        gc_ind_oper_cons_final        IN lv_json WITH gc_ind_oper_cons_final_tc,
        gc_ind_oper_realizada         IN lv_json WITH gc_ind_oper_realizada_tc,
        gc_ind_ori_cred_piscofins     IN lv_json WITH gc_ind_ori_cred_piscofins_tc,
        gc_ind_reg1200                IN lv_json WITH gc_ind_reg1200_tc,
        gc_ind_reg1300                IN lv_json WITH gc_ind_reg1300_tc,
        gc_ind_reg1390                IN lv_json WITH gc_ind_reg1390_tc,
        gc_ind_reg1400                IN lv_json WITH gc_ind_reg1400_tc,
        gc_ind_reg1500                IN lv_json WITH gc_ind_reg1500_tc,
        gc_ind_reg1600                IN lv_json WITH gc_ind_reg1600_tc,
        gc_ind_reg1700                IN lv_json WITH gc_ind_reg1700_tc,
        gc_ind_reg1800                IN lv_json WITH gc_ind_reg1800_tc,
        gc_ind_regcum                 IN lv_json WITH gc_ind_regcum_tc,
        gc_ind_tp_contrib_apur        IN lv_json WITH gc_ind_tp_contrib_apur_tc,
        gc_ind_transf_prevista        IN lv_json WITH gc_ind_transf_prevista_tc,
        gc_ind_trib_icms              IN lv_json WITH gc_ind_trib_icms_tc,
        gc_ind_trib_ipi               IN lv_json WITH gc_ind_trib_ipi_tc,
        gc_ind_vinc                   IN lv_json WITH gc_ind_vinc_tc,
        gc_inf_complementares         IN lv_json WITH gc_inf_complementares_tc,
        gc_ini_periodo                IN lv_json WITH gc_ini_periodo_tc,
        gc_inov_tec_desenv_tec        IN lv_json WITH gc_inov_tec_desenv_tec_tc,
        gc_insc_est_subst             IN lv_json WITH gc_insc_est_subst_tc,
        gc_inscr_estaduais            IN lv_json WITH gc_inscr_estaduais_tc,
        gc_inscr_estadual             IN lv_json WITH gc_inscr_estadual_tc,
        gc_inscr_municipal            IN lv_json WITH gc_inscr_municipal_tc,
        gc_inscr_suframa              IN lv_json WITH gc_inscr_suframa_tc,
        gc_isencao_red_imposto        IN lv_json WITH gc_isencao_red_imposto_tc,
        gc_item                       IN lv_json WITH gc_item_tc,
        gc_itens                      IN lv_json WITH gc_itens_tc,
        gc_loc_exec_serv              IN lv_json WITH gc_loc_exec_serv_tc,
        gc_loc_recolhimento_iss       IN lv_json WITH gc_loc_recolhimento_iss_tc,
        gc_lucro_exportacao           IN lv_json WITH gc_lucro_exportacao_tc,
        gc_marca                      IN lv_json WITH gc_marca_tc,
        gc_marca_exportacao           IN lv_json WITH gc_marca_exportacao_tc,
        gc_mes_competencia            IN lv_json WITH gc_mes_competencia_tc,
        gc_mes_fato_gerador           IN lv_json WITH gc_mes_fato_gerador_tc,
        gc_mod_frete                  IN lv_json WITH gc_mod_frete_tc,
        gc_mod_nf_serv                IN lv_json WITH gc_mod_nf_serv_tc,
        gc_mot_cancelamento           IN lv_json WITH gc_mot_cancelamento_tc,
        gc_mov_item                   IN lv_json WITH gc_mov_item_tc,
        gc_mun_exec_serv              IN lv_json WITH gc_mun_exec_serv_tc,
        gc_municipio                  IN lv_json WITH gc_municipio_tc,
        gc_nat_bc_cred_piscofins      IN lv_json WITH gc_nat_bc_cred_piscofins_tc,
        gc_nat_oper                   IN lv_json WITH gc_nat_oper_tc,
        gc_nat_receita                IN lv_json WITH gc_nat_receita_tc,
        gc_nf_ct                      IN lv_json WITH gc_nf_ct_tc,
        gc_nf_emit_estab              IN lv_json WITH gc_nf_emit_estab_tc,
        gc_nire                       IN lv_json WITH gc_nire_tc,
        gc_nit                        IN lv_json WITH gc_nit_tc,
        gc_nome                       IN lv_json WITH gc_nome_tc,
        gc_nome_banco                 IN lv_json WITH gc_nome_banco_tc,
        gc_nome_fantasia              IN lv_json WITH gc_nome_fantasia_tc,
        gc_num_agencia                IN lv_json WITH gc_num_agencia_tc,
        gc_num_banco                  IN lv_json WITH gc_num_banco_tc,
        gc_num_conta                  IN lv_json WITH gc_num_conta_tc,
        gc_num_contrato               IN lv_json WITH gc_num_contrato_tc,
        gc_num_doc_importacao         IN lv_json WITH gc_num_doc_importacao_tc,
        gc_num_documento              IN lv_json WITH gc_num_documento_tc,
        gc_num_entrega_dctf           IN lv_json WITH gc_num_entrega_dctf_tc,
        gc_num_iden_trab              IN lv_json WITH gc_num_iden_trab_tc,
        gc_num_item                   IN lv_json WITH gc_num_item_tc,
        gc_num_parc_ciap              IN lv_json WITH gc_num_parc_ciap_tc,
        gc_num_seq_crc                IN lv_json WITH gc_num_seq_crc_tc,
        gc_num_serie                  IN lv_json WITH gc_num_serie_tc,
        gc_numero                     IN lv_json WITH gc_numero_tc,
        gc_obs_doc_lancto_fiscal      IN lv_json WITH gc_obs_doc_lancto_fiscal_tc,
        gc_oper_conversao             IN lv_json WITH gc_oper_conversao_tc,
        gc_oper_exterior              IN lv_json WITH gc_oper_exterior_tc,
        gc_opt_paes                   IN lv_json WITH gc_opt_paes_tc,
        gc_opt_refis                  IN lv_json WITH gc_opt_refis_tc,
        gc_opt_rtt                    IN lv_json WITH gc_opt_rtt_tc,
        gc_optante_simplesnacional    IN lv_json WITH gc_optante_simplesnacional_tc,
        gc_pag_ext_n_resid            IN lv_json WITH gc_pag_ext_n_resid_tc,
        gc_pag_rem_serv_juros         IN lv_json WITH gc_pag_rem_serv_juros_tc,
        gc_pais                       IN lv_json WITH gc_pais_tc,
        gc_param_dacon                IN lv_json WITH gc_param_dacon_tc,
        gc_param_dctf                 IN lv_json WITH gc_param_dctf_tc,
        gc_param_dipj                 IN lv_json WITH gc_param_dipj_tc,
        gc_parc_cliente               IN lv_json WITH gc_parc_cliente_tc,
        gc_parc_depositante           IN lv_json WITH gc_parc_depositante_tc,
        gc_parc_fornecedor            IN lv_json WITH gc_parc_fornecedor_tc,
        gc_parc_funcionario           IN lv_json WITH gc_parc_funcionario_tc,
        gc_parc_terceiro              IN lv_json WITH gc_parc_terceiro_tc,
        gc_parc_transportador         IN lv_json WITH gc_parc_transportador_tc,
        gc_parceiro                   IN lv_json WITH gc_parceiro_tc,
        gc_parceiros                  IN lv_json WITH gc_parceiros_tc,
        gc_parcelas                   IN lv_json WITH gc_parcelas_tc,
        gc_part_cons_empresa          IN lv_json WITH gc_part_cons_empresa_tc,
        gc_part_exterior              IN lv_json WITH gc_part_exterior_tc,
        gc_per_apur_ipi               IN lv_json WITH gc_per_apur_ipi_tc,
        gc_perc_base_isenta           IN lv_json WITH gc_perc_base_isenta_tc,
        gc_perc_base_outras           IN lv_json WITH gc_perc_base_outras_tc,
        gc_perfil                     IN lv_json WITH gc_perfil_tc,
        gc_periodo_escrit             IN lv_json WITH gc_periodo_escrit_tc,
        gc_peso_br_vol                IN lv_json WITH gc_peso_br_vol_tc,
        gc_peso_liq_vol               IN lv_json WITH gc_peso_liq_vol_tc,
        gc_pf_deb_scp_declarar        IN lv_json WITH gc_pf_deb_scp_declarar_tc,
        gc_pj_com_exportadora         IN lv_json WITH gc_pj_com_exportadora_tc,
        gc_pj_efet_exportacao         IN lv_json WITH gc_pj_efet_exportacao_tc,
        gc_pj_hab_repes_recap_padis   IN lv_json WITH gc_pj_hab_repes_recap_padis_tc,
        gc_pj_inat_ano_calend         IN lv_json WITH gc_pj_inat_ano_calend_tc,
        gc_pj_incorp_reg_especial     IN lv_json WITH gc_pj_incorp_reg_especial_tc,
        gc_pj_ini_mes_decl            IN lv_json WITH gc_pj_ini_mes_decl_tc,
        gc_pj_lev_bal_susp_mes        IN lv_json WITH gc_pj_lev_bal_susp_mes_tc,
        gc_pj_obrig_dctf_ano_anterior IN lv_json WITH gc_pj_obrig_dctf_ano_ant_tc,
        gc_pj_opt_reg_especial        IN lv_json WITH gc_pj_opt_reg_especial_tc,
        gc_pj_suj_aliq_csll_15p       IN lv_json WITH gc_pj_suj_aliq_csll_15p_tc,
        gc_placa_veiculo              IN lv_json WITH gc_placa_veiculo_tc,
        gc_polo_indust_manaus         IN lv_json WITH gc_polo_indust_manaus_tc,
        gc_qtd_depend_irfonte         IN lv_json WITH gc_qtd_depend_irfonte_tc,
        gc_qtd_item                   IN lv_json WITH gc_qtd_item_tc,
        gc_qtd_pautada_cofins         IN lv_json WITH gc_qtd_pautada_cofins_tc,
        gc_qtd_pautada_ipi            IN lv_json WITH gc_qtd_pautada_ipi_tc,
        gc_qtd_pautada_pis            IN lv_json WITH gc_qtd_pautada_pis_tc,
        gc_qtd_selo_ipi               IN lv_json WITH gc_qtd_selo_ipi_tc,
        gc_qualif_assinante           IN lv_json WITH gc_qualif_assinante_tc,
        gc_qualif_pj                  IN lv_json WITH gc_qualif_pj_tc,
        gc_ramal                      IN lv_json WITH gc_ramal_tc,
        gc_razao                      IN lv_json WITH gc_razao_tc,
        gc_reg_esp_st                 IN lv_json WITH gc_reg_esp_st_tc,
        gc_rend_receb_ext_n_resid     IN lv_json WITH gc_rend_receb_ext_n_resid_tc,
        gc_rend_serv_juros            IN lv_json WITH gc_rend_serv_juros_tc,
        gc_responsavel                IN lv_json WITH gc_responsavel_tc,
        gc_ressarcimentos_icms        IN lv_json WITH gc_ressarcimentos_icms_tc,
        gc_rg                         IN lv_json WITH gc_rg_tc,
        gc_royalties_pg               IN lv_json WITH gc_royalties_pg_tc,
        gc_royalties_rec              IN lv_json WITH gc_royalties_rec_tc,
        gc_sigla                      IN lv_json WITH gc_sigla_tc,
        gc_signatario                 IN lv_json WITH gc_signatario_tc,
        gc_signatarios                IN lv_json WITH gc_signatarios_tc,
        gc_sit_especial               IN lv_json WITH gc_sit_especial_tc,
        gc_sit_nota                   IN lv_json WITH gc_sit_nota_tc,
        gc_sit_trib_cofins            IN lv_json WITH gc_sit_trib_cofins_tc,
        gc_sit_trib_icms_taba         IN lv_json WITH gc_sit_trib_icms_taba_tc,
        gc_sit_trib_icms_tabb         IN lv_json WITH gc_sit_trib_icms_tabb_tc,
        gc_sit_trib_ipi               IN lv_json WITH gc_sit_trib_ipi_tc,
        gc_sit_trib_pis               IN lv_json WITH gc_sit_trib_pis_tc,
        gc_situacao                   IN lv_json WITH gc_situacao_tc,
        gc_status                     IN lv_json WITH gc_status_tc,
        gc_subserie                   IN lv_json WITH gc_subserie_tc,
        gc_telefone                   IN lv_json WITH gc_telefone_tc,
        gc_tipo                       IN lv_json WITH gc_tipo_tc,
        gc_tp_assinante               IN lv_json WITH gc_tp_assinante_tc,
        gc_tp_atividade               IN lv_json WITH gc_tp_atividade_tc,
        gc_tp_consumo                 IN lv_json WITH gc_tp_consumo_tc,
        gc_tp_demonstrativo           IN lv_json WITH gc_tp_demonstrativo_tc,
        gc_tp_doc_importacao          IN lv_json WITH gc_tp_doc_importacao_tc,
        gc_tp_entidade                IN lv_json WITH gc_tp_entidade_tc,
        gc_tp_estabelecimento         IN lv_json WITH gc_tp_estabelecimento_tc,
        gc_tp_fatura                  IN lv_json WITH gc_tp_fatura_tc,
        gc_tp_frete                   IN lv_json WITH gc_tp_frete_tc,
        gc_tp_item                    IN lv_json WITH '"OrigemItem"',
        gc_tp_ligacao                 IN lv_json WITH gc_tp_ligacao_tc,
        gc_tp_logradouro              IN lv_json WITH gc_tp_logradouro_tc,
        gc_tp_nota_servico            IN lv_json WITH gc_tp_nota_servico_tc,
        gc_tp_operacao                IN lv_json WITH gc_tp_operacao_tc,
        gc_tp_pagamento               IN lv_json WITH gc_tp_pagamento_tc,
        gc_transportadora             IN lv_json WITH gc_transportadora_tc,
        gc_trim_lucro_arbit           IN lv_json WITH gc_trim_lucro_arbit_tc,
        gc_uf                         IN lv_json WITH gc_uf_tc,
        gc_uf_caixa_postal            IN lv_json WITH gc_uf_caixa_postal_tc,
        gc_uf_crc_exped               IN lv_json WITH gc_uf_crc_exped_tc,
        gc_uf_veiculo                 IN lv_json WITH gc_uf_veiculo_tc,
        gc_un_med_dest                IN lv_json WITH gc_un_med_dest_tc,
        gc_un_med_orig                IN lv_json WITH gc_un_med_orig_tc,
        gc_unid_med_estoque           IN lv_json WITH gc_unid_med_estoque_tc,
        gc_unid_medida                IN lv_json WITH gc_unid_medida_tc,
        gc_var_monet_taxa_cambio      IN lv_json WITH gc_var_monet_taxa_cambio_tc,
        gc_versao                     IN lv_json WITH gc_versao_tc,
        gc_via_transp                 IN lv_json WITH gc_via_transp_tc,
        gc_vlr_base_cofins            IN lv_json WITH gc_vlr_base_cofins_tc,
        gc_vlr_base_icms              IN lv_json WITH gc_vlr_base_icms_tc,
        gc_vlr_base_icms              IN lv_json WITH gc_vlr_base_icms_tc,
        gc_vlr_base_icms_isento       IN lv_json WITH gc_vlr_base_icms_isento_tc,
        gc_vlr_base_icms_outros       IN lv_json WITH gc_vlr_base_icms_outros_tc,
        gc_vlr_base_icms_red          IN lv_json WITH gc_vlr_base_icms_red_tc,
        gc_vlr_base_icms_subst        IN lv_json WITH gc_vlr_base_icms_subst_tc,
        gc_vlr_base_icms_subst        IN lv_json WITH gc_vlr_base_icms_subst_tc,
        gc_vlr_base_icms_trib         IN lv_json WITH gc_vlr_base_icms_trib_tc,
        gc_vlr_base_ipi               IN lv_json WITH gc_vlr_base_ipi_tc,
        gc_vlr_base_ipi_isento        IN lv_json WITH gc_vlr_base_ipi_isento_tc,
        gc_vlr_base_ipi_outros        IN lv_json WITH gc_vlr_base_ipi_outros_tc,
        gc_vlr_base_ipi_trib          IN lv_json WITH gc_vlr_base_ipi_trib_tc,
        gc_vlr_base_ir_fonte          IN lv_json WITH gc_vlr_base_ir_fonte_tc,
        gc_vlr_base_issqn             IN lv_json WITH gc_vlr_base_issqn_tc,
        gc_vlr_base_pis               IN lv_json WITH gc_vlr_base_pis_tc,
        gc_vlr_base_ii                IN lv_json WITH gc_vlr_base_ii_tc,
        gc_vlr_ii                     IN lv_json WITH gc_vlr_ii_tc,
        gc_aliq_ii                    IN lv_json WITH gc_aliq_ii_tc,
        gc_vlr_cofins                 IN lv_json WITH gc_vlr_cofins_tc,
        gc_vlr_cofins                 IN lv_json WITH gc_vlr_cofins_tc,
        gc_vlr_cofins_subst           IN lv_json WITH gc_vlr_cofins_subst_tc,
        gc_vlr_contabil_item          IN lv_json WITH gc_vlr_contabil_item_tc,
        gc_vlr_desconto               IN lv_json WITH gc_vlr_desconto_tc,
        gc_vlr_despesas               IN lv_json WITH gc_vlr_despesas_tc,
        gc_vlr_despesas               IN lv_json WITH gc_vlr_despesas_tc,
        gc_vlr_doc_fiscal             IN lv_json WITH gc_vlr_doc_fiscal_tc,
        gc_vlr_fcp                    IN lv_json WITH gc_vlr_fcp_tc,
        gc_vlr_frete                  IN lv_json WITH gc_vlr_frete_tc,
        gc_vlr_frete                  IN lv_json WITH gc_vlr_frete_tc,
        gc_vlr_icms                   IN lv_json WITH gc_vlr_icms_tc,
        gc_vlr_icms                   IN lv_json WITH gc_vlr_icms_tc,
        gc_vlr_icms_red               IN lv_json WITH gc_vlr_icms_red_tc,
        gc_vlr_icms_subst             IN lv_json WITH gc_vlr_icms_subst_tc,
        gc_vlr_icms_subst             IN lv_json WITH gc_vlr_icms_subst_tc,
        gc_vlr_icms_uf_dest           IN lv_json WITH gc_vlr_icms_uf_dest_tc,
        gc_vlr_icms_uf_remet          IN lv_json WITH gc_vlr_icms_uf_remet_tc,
        gc_vlr_ipi                    IN lv_json WITH gc_vlr_ipi_tc,
        gc_vlr_ipi                    IN lv_json WITH gc_vlr_ipi_tc,
        gc_vlr_ir_fonte               IN lv_json WITH gc_vlr_ir_fonte_tc,
        gc_vlr_iss_qn                 IN lv_json WITH gc_vlr_iss_qn_tc,
        gc_vlr_iss_retido             IN lv_json WITH gc_vlr_iss_retido_tc,
        gc_vlr_issqn                  IN lv_json WITH gc_vlr_issqn_tc,
        gc_vlr_item                   IN lv_json WITH gc_vlr_item_tc,
        gc_vlr_merc                   IN lv_json WITH gc_vlr_merc_tc,
        gc_vlr_pautado_cofins         IN lv_json WITH gc_vlr_pautado_cofins_tc,
        gc_vlr_pautado_ipi            IN lv_json WITH gc_vlr_pautado_ipi_tc,
        gc_vlr_pautado_pis            IN lv_json WITH gc_vlr_pautado_pis_tc,
        gc_vlr_pis                    IN lv_json WITH gc_vlr_pis_tc,
        gc_vlr_pis                    IN lv_json WITH gc_vlr_pis_tc,
        gc_vlr_pis_subst              IN lv_json WITH gc_vlr_pis_subst_tc,
        gc_vlr_previdencia            IN lv_json WITH gc_vlr_previdencia_tc,
        gc_vlr_seguro                 IN lv_json WITH gc_vlr_seguro_tc,
        gc_vlr_seguro                 IN lv_json WITH gc_vlr_seguro_tc,
        gc_vlr_servicos               IN lv_json WITH gc_vlr_servicos_tc,
        gc_vlr_tot_rec_vendas         IN lv_json WITH gc_vlr_tot_rec_vendas_tc,
        gc_vlr_unidade                IN lv_json WITH gc_vlr_unidade_tc,
        gc_vol_transp                 IN lv_json WITH gc_vol_transp_tc,
        gc_zonas_proc_exportacao      IN lv_json WITH gc_zonas_proc_exportacao_tc,
        gc_imposto_retido             IN lv_json WITH gc_imposto_retido_tc,
        gc_imposto                    IN lv_json WITH gc_imposto_tc,
        gc_data_pagto                 IN lv_json WITH gc_data_pagto_tc,
        gc_cod_receita                IN lv_json WITH gc_cod_receita_tc,
        gc_vlr_base_retencao          IN lv_json WITH gc_vlr_base_tc,
        gc_aliq_retencao              IN lv_json WITH gc_aliq_retencao_tc,
        gc_vlr_retido                 IN lv_json WITH gc_vlr_retido_tc,
        gc_vlr_base_prev              IN lv_json WITH gc_vlr_base_prev_tc,
        gc_orig_item                  IN lv_json WITH '"TipoItem"',
        gc_ind_frt_red                IN lv_json WITH gc_ind_frt_red_tc,
        gc_cod_mun_orig               IN lv_json WITH gc_cod_mun_orig_tc,
        gc_cod_mun_dest               IN lv_json WITH gc_cod_mun_dest_tc,
        gc_placa_veic                 IN lv_json WITH gc_placa_veic_tc,
        gc_vl_liq_frt                 IN lv_json WITH gc_vl_liq_frt_tc,
        gc_vl_desp                    IN lv_json WITH gc_vl_desp_tc,
        gc_vl_frt                     IN lv_json WITH gc_vl_frt_tc,
        gc_cod_mod                    IN lv_json WITH gc_cod_mod_tc,
        gc_serie                      IN lv_json WITH gc_serie_tc,
        gc_numdoc                     IN lv_json WITH gc_numdoc_tc,
        gc_data_emis                  IN lv_json WITH gc_data_emis_tc,
        gc_volume                     IN lv_json WITH gc_volume_tc,
        gc_ind_oper                   IN lv_json WITH gc_ind_oper_tc,
        gc_indcprb                    IN lv_json WITH gc_indcprb_tc,
        gc_cest                       IN lv_json WITH gc_cest_tc,
        gc_idcontr                    IN lv_json WITH gc_idcontr_tc,
        gc_class_serv_prest           IN lv_json WITH gc_class_serv_prest_tc,
        gc_obras                      IN lv_json WITH gc_obras_tc,
        gc_ind_prestacao_servico      IN lv_json WITH gc_ind_prestacao_servico_tc,
        gc_id_parceiro_obra           IN lv_json WITH gc_id_parceiro_obra_tc,
        gc_idestabelecimfiscalobra    IN lv_json WITH gc_idestabelecimfiscalobra_tc,
        gc_ind_tipo_carg              IN lv_json WITH gc_ind_oper_tc, "BSBU-468
        gc_locl_rec_iss_mun           IN lv_json WITH gc_locl_rec_iss_mun_tc, "BSBU-695
        gc_mun_exec_srv_mun           IN lv_json WITH gc_mun_exec_srv_mun_tc, "BSBU-695
        gc_cod_lanc_contabil          IN lv_json WITH gc_cod_lanc_contabil_tc, "BSBU-784
        gc_inf_complementar           IN lv_json WITH gc_inf_complementar_tc, "BSBU-1153
        gc_info_compl                 IN lv_json WITH gc_info_compl_tc, "BSBU-1153
        gc_descr_codigo               IN lv_json WITH gc_descricao_tc, "BSBU-1153
        gc_descr_message              IN lv_json WITH gc_descricao_tc, "BSBU-1153
        gc_docto_refer                IN lv_json WITH gc_docto_refer_tc, "BSBU-1365
        gc_cod_mod_refer              IN lv_json WITH gc_cod_mod_refer_tc, "BSBU-1365
        gc_num_serie_refer            IN lv_json WITH gc_num_serie_refer_tc, "BSBU-1365
        gc_num_sub_refer              IN lv_json WITH gc_num_sub_refer_tc, "BSBU-1365
        gc_num_doc_refer              IN lv_json WITH gc_num_doc_refer_tc, "BSBU-1365
        gc_dt_emissao_refer           IN lv_json WITH gc_dt_emissao_refer_tc, "BSBU-1365
        gc_tp_operacao_refer          IN lv_json WITH gc_tp_operacao_refer_tc, "BSBU-1365
        gc_emitente_tit               IN lv_json WITH gc_emitente_tit_tc, "BSBU-1365
        gc_processo_refer             IN lv_json WITH gc_processo_refer_tc, "BSBU-1365
        gc_num_processo               IN lv_json WITH gc_num_processo_tc, "BSBU-1365
        gc_origem_processo            IN lv_json WITH gc_origem_processo_tc, "BSBU-1365
        gc_obs_doc_lancto_fiscal      IN lv_json WITH gc_obs_doc_lancto_fiscal_tc, "BSBU-1366
        gc_obser_lanc_fiscal          IN lv_json WITH gc_obser_lanc_fiscal_tc, "BSBU-1366
        gc_codigo                     IN lv_json WITH gc_codigo_tc, "BSBU-1366
        gc_descricao                  IN lv_json WITH gc_descricao_tc, "BSBU-1366
        gc_codigo_observ              IN lv_json WITH gc_codigo_observ_tc, "BSBU-1366
        gc_observ_detalhe             IN lv_json WITH gc_observ_detalhe_tc, "BSBU-1366
        gc_reflexo                    IN lv_json WITH gc_reflexo_tc, "BSBU-1366
        gc_tp_apur                    IN lv_json WITH gc_tp_apur_tc, "BSBU-1366
        gc_responsabilidade           IN lv_json WITH gc_responsabilidade_tc, "BSBU-1366
        gc_influencia_rep             IN lv_json WITH gc_influencia_rep_tc, "BSBU-1366
        gc_origem_trib                IN lv_json WITH gc_origem_trib_tc, "BSBU-1366
        gc_observ_icms                IN lv_json WITH gc_observ_icms_tc, "BSBU-1366
        gc_codigo_benef               IN lv_json WITH gc_codigo_benef_tc, "BSBU-1366
        gc_data_de                    IN lv_json WITH gc_data_de_tc, "BSBU-1366
        gc_data_ate                   IN lv_json WITH gc_data_ate_tc, "BSBU-1366
        gc_versao                     IN lv_json WITH gc_versao_tc, "BSBU-1366
        gc_base_icms                  IN lv_json WITH gc_base_icms_tc, "BSBU-1366
        gc_aliquota_icms              IN lv_json WITH gc_aliquota_icms_tc, "BSBU-1366
        gc_valor_icms                 IN lv_json WITH gc_valor_icms_tc, "BSBU-1366
        gc_outros_valores             IN lv_json WITH gc_outros_valores_tc, "BSBU-1366
        gc_aliq_icms_fcp              IN lv_json WITH gc_aliq_icms_fcp_tc,        "BSBU-1659
        gc_vlr_icms_fcp               IN lv_json WITH gc_vlr_icms_fcp_tc,         "BSBU-1659
        gc_vlr_base_icms_difal        IN lv_json WITH gc_vlr_base_icms_difal_tc,  "BSBU-1659
        gc_aliq_icms_difal            IN lv_json WITH gc_aliq_icms_difal_tc,      "BSBU-1659
        gc_vlr_icms_difal             IN lv_json WITH gc_vlr_icms_difal_tc,       "BSBU-1659
        gc_vlr_base_icms_fcp_st       IN lv_json WITH gc_vlr_base_icms_fcp_st_tc, "BSBU-1659
        gc_aliq_icms_fcp_st           IN lv_json WITH gc_aliq_icms_fcp_st_tc,     "BSBU-1659
        gc_vlr_icms_fcp_st            IN lv_json WITH gc_vlr_icms_fcp_st_tc,      "BSBU-1659
        gc_vlr_base_icms_fcp_rt       IN lv_json WITH gc_vlr_base_icms_fcp_rt_tc, "BSBU-1659
        gc_aliq_icms_fcp_rt           IN lv_json WITH gc_aliq_icms_fcp_rt_tc,     "BSBU-1659
        gc_vlr_icms_fcp_rt            IN lv_json WITH gc_vlr_icms_fcp_rt_tc,      "BSBU-1659
        gc_vlr_desc_zonafranca        IN lv_json WITH gc_vlr_desc_zonafranca_tc,  "BSBU-1659
        gc_vlr_icms_origem            IN lv_json WITH gc_vlr_icms_origem_tc,      "BSBU-1659
        gc_aliq_icms_dest             IN lv_json WITH gc_aliq_icms_dest_tc,       "BSBU-1659
        gc_vlr_icms_dest              IN lv_json WITH gc_vlr_icms_dest_tc,        "BSBU-1659
        gc_data_pagto_realizado       IN lv_json WITH gc_data_pagto_realizado_tc, "BSBU-2268
        gc_vlr_subcontr               IN lv_json WITH gc_vlr_subcontr_tc,         "BSBU-2367
        gc_vlr_juizo                  IN lv_json WITH gc_vlr_juizo_tc,            "BSBU-2367
        gc_vlr_adicional              IN lv_json WITH gc_vlr_adicional_tc,        "BSBU-2367
        gc_vlr_adic_juizo             IN lv_json WITH gc_vlr_adic_juizo_tc,       "BSBU-2367
        gc_vlr_aposentado_15          IN lv_json WITH gc_vlr_aposentado_15_tc,    "BSBU-2367
        gc_vlr_aposentado_20          IN lv_json WITH gc_vlr_aposentado_20_tc,    "BSBU-2367
        gc_vlr_aposentado_25          IN lv_json WITH gc_vlr_aposentado_25_tc,    "BSBU-2367
        gc_vlr_prev_devida            IN lv_json WITH gc_vlr_prev_devida_tc,      "BSBU-2367
        gc_vlr_prev                   IN lv_json WITH gc_vlr_prev_tc,
        gc_perc_prodepe               IN lv_json WITH gc_perc_prodepe_tc,         "BSBU-2670
        gc_vlr_fcp_st                 IN lv_json WITH gc_vlr_fcp_st_tc,           "BSBU-2670
        gc_vlr_fcp_ret                IN lv_json WITH gc_vlr_fcp_ret_tc,          "BSBU-2670
        gc_vlr_ipi_devol              IN lv_json WITH gc_vlr_ipi_devol_tc,        "BSBU-2670
        gc_cfop_compl                 IN lv_json WITH gc_cfop_compl_tc,           "BSBU-2670
        gc_cat_doc_fisc               IN lv_json WITH gc_cat_doc_fisc_tc,         "BSBU-2670
        gc_tipo_cte                   IN lv_json WITH gc_tipo_cte_tc,             "BSBU-2664
        gc_chave_nfe_ref              IN lv_json WITH gc_chave_nfe_ref_tc,        "BSBU-2908

        gc_medicamentos               IN lv_json WITH gc_medicamentos_tc,         "BSBU-3146
        gc_nlote                      IN lv_json WITH gc_nlote_tc,                "BSBU-3146
        gc_qlote                      IN lv_json WITH gc_qlote_tc,                "BSBU-3146
        gc_dtfab                      IN lv_json WITH gc_dtfab_tc,                "BSBU-3146
        gc_dtexp                      IN lv_json WITH gc_dtexp_tc,                "BSBU-3146
        gc_tp_calc_icms               IN lv_json WITH gc_tp_calc_icms_tc,         "BSBU-3146
        gc_tp_prod                    IN lv_json WITH gc_tp_prod_tc,              "BSBU-3146
        gc_valor                      IN lv_json WITH gc_valor_tc,                "BSBU-3146

        gc_ind_ref_icms_st            IN lv_json WITH gc_ind_ref_icms_st_tc,      "BSBU-3786

        gc_parceiro_fabr              IN lv_json WITH gc_parceiro_fabr_tc,        "BSBU-3970
        gc_parceiro_exp               IN lv_json WITH gc_parceiro_exp_tc,         "BSBU-3970
        gc_item_imp                   IN lv_json WITH gc_item_imp_tc,             "BSBU-3970
        gc_num_di                     IN lv_json WITH gc_num_di_tc,               "BSBU-3970
        gc_data_di                    IN lv_json WITH gc_data_di_tc,              "BSBU-3970
        gc_uf_desemb                  IN lv_json WITH gc_uf_desemb_tc,            "BSBU-3970
        gc_data_desem                 IN lv_json WITH gc_data_desem_tc,           "BSBU-3970
        gc_local_desem                IN lv_json WITH gc_local_desem_tc,          "BSBU-3970
        gc_ato_drawback               IN lv_json WITH gc_ato_drawback_tc,         "BSBU-3970
        gc_num_adicao                 IN lv_json WITH gc_num_adicao_tc,           "BSBU-3970
        gc_item_adicao                IN lv_json WITH gc_item_adicao_tc,          "BSBU-3970
        gc_via_transp                 IN lv_json WITH gc_via_transp_tc,           "BSBU-3970
        gc_vlr_adic_frete             IN lv_json WITH gc_vlr_adic_frete_tc,       "BSBU-3970
        gc_tp_interm                  IN lv_json WITH gc_tp_interm_tc,            "BSBU-3970
        gc_cnpj_interm                IN lv_json WITH gc_cnpj_interm_tc,          "BSBU-3970

        gc_vlr_base_icms_snac         IN lv_json WITH gc_vlr_base_icms_snac_tc,   "BSBU-3950
        gc_aliq_icms_snac             IN lv_json WITH gc_aliq_icms_snac_tc,       "BSBU-3950
        gc_vlr_icms_snac              IN lv_json WITH gc_vlr_icms_snac_tc,        "BSBU-3950
        gc_cfop_emitente              IN lv_json WITH gc_cfop_emitente_tc,        "BSBU-3950

        gc_class_contr_ipi            IN lv_json WITH gc_class_contr_ipi_tc,                      "BSBU-4086
        gc_data_ini                   IN lv_json WITH gc_data_ini_tc,                             "BSBU-4086
        gc_data_fim                   IN lv_json WITH gc_data_fim_tc,                             "BSBU-4086
        gc_fin_emissao                IN lv_json WITH gc_fin_emissao_tc,                          "BSBU-4086
        gc_quant_conv                 IN lv_json WITH gc_quant_conv_tc,                           "BSBU-4086
        gc_cod_mod_arrec              IN lv_json WITH gc_cod_mod_arrec_tc,                        "BSBU-4086
        gc_num_doc_arrec              IN lv_json WITH gc_num_doc_arrec_tc,                        "BSBU-4086
        gc_ressarcimentos_icms        IN lv_json WITH gc_ressarcimentos_icms_tc,                  "BSBU-4086
        gc_parc_ult_entrada           IN lv_json WITH gc_parc_ult_entrada_tc,                     "BSBU-4086
        gc_parc_icms_st_ret           IN lv_json WITH gc_parc_icms_st_ret_tc,                     "BSBU-4086
        gc_cod_mod_ult_entr           IN lv_json WITH gc_cod_mod_ult_entr_tc,                     "BSBU-4086
        gc_num_doc_ult_entr           IN lv_json WITH gc_num_doc_ult_entr_tc,                     "BSBU-4086
        gc_serie_doc_ult_entr         IN lv_json WITH gc_serie_doc_ult_entr_tc,                   "BSBU-4086
        gc_data_ult_entr              IN lv_json WITH gc_data_ult_entr_tc,                        "BSBU-4086
        gc_qtde_ult_entr              IN lv_json WITH gc_qtde_ult_entr_tc,                        "BSBU-4086
        gc_vlr_unit_ult_entr          IN lv_json WITH gc_vlr_unit_ult_entr_tc,                    "BSBU-4086
        gc_vlr_base_icmsst_pago       IN lv_json WITH gc_vlr_base_icmsst_pago_tc,                 "BSBU-4086
        gc_chave_nfe_ult_entr         IN lv_json WITH gc_chave_nfe_ult_entr_tc,                   "BSBU-4086
        gc_num_item_ult_entr          IN lv_json WITH gc_num_item_ult_entr_tc,                    "BSBU-4086
        gc_vlr_base_icmsst_entr       IN lv_json WITH gc_vlr_base_icmsst_entr_tc,                 "BSBU-4086
        gc_aliq_icms_ult_entr         IN lv_json WITH gc_aliq_icms_ult_entr_tc,                   "BSBU-4086
        gc_vlr_lim_base_ult_entr      IN lv_json WITH gc_vlr_lim_base_ult_entr_tc,                "BSBU-4086
        gc_vlr_unit_icmsst_ult_entr   IN lv_json WITH gc_vlr_unit_icmsst_ult_entr_tc,             "BSBU-4086
        gc_aliq_icmsst_ult_entr       IN lv_json WITH gc_aliq_icmsst_ult_entr_tc,                 "BSBU-4086
        gc_vlr_unit_ressarc           IN lv_json WITH gc_vlr_unit_ressarc_tc,                     "BSBU-4086
        gc_cod_resp_retencao          IN lv_json WITH gc_cod_resp_retencao_tc,                    "BSBU-4086
        gc_cod_motivo_ressarc         IN lv_json WITH gc_cod_motivo_ressarc_tc,                   "BSBU-4086
        gc_chave_nfe_icmsst_retido    IN lv_json WITH gc_chave_nfe_icmsst_retido_tc,              "BSBU-4086
        gc_num_doc_icmsst_ret         IN lv_json WITH gc_num_doc_icmsst_ret_tc,                   "BSBU-4086
        gc_serie_doc_icmsst_ret       IN lv_json WITH gc_serie_doc_icmsst_ret_tc,                 "BSBU-4086
        gc_num_item_icmsst_ret        IN lv_json WITH gc_num_item_icmsst_ret_tc,                  "BSBU-4086
        gc_vlr_unit_fcpst             IN lv_json WITH gc_vlr_unit_fcpst_tc,                       "BSBU-4086
        gc_cod_mot_rest_compl_icms    IN lv_json WITH gc_cod_mot_rest_compl_icms_tc,              "BSBU-4086
        gc_vlr_med_unit_base_icmsst_es IN lv_json WITH gc_vlr_unit_base_icmsst_est_tc,            "BSBU-4086
        gc_vlr_med_unit_icmsst_est    IN lv_json WITH gc_vlr_med_unit_icmsst_est_tc,              "BSBU-4086
        gc_vlr_med_unit_fcpst_est     IN lv_json WITH gc_vlr_med_unit_fcpst_est_tc,               "BSBU-4086
        gc_vlr_unit_icmsst_compl      IN lv_json WITH gc_vlr_unit_icmsst_compl_tc,                "BSBU-4086
        gc_vlr_unit_fcpst_compl       IN lv_json WITH gc_vlr_unit_fcpst_compl_tc,                 "BSBU-4086
        gc_codigo_fci                 IN lv_json WITH gc_codigo_fci_tc,                           "BSBU-4404
        gc_vlr_ipi_ntrib              IN lv_json WITH gc_vlr_ipi_ntrib_tc,                        "BSBU-4842
        gc_vlr_icms_sub_ntrib         IN lv_json WITH gc_vlr_icms_sub_ntrib_tc,                   "BSBU-4842

        gc_vlr_pis_ii                 IN lv_json WITH gc_vlr_pis_ii_tc,                           "BSBU-4949
        gc_vlr_cofins_ii              IN lv_json WITH gc_vlr_cofins_ii_tc,                        "BSBU-4949
        gc_ind_nat_frt                IN lv_json WITH gc_ind_nat_frt_tc,                          "BSBU-5107
        gc_lista_trib_prod            IN lv_json WITH gc_lista_trib_prod_tc,                      "BSBU-5635

        gc_aliq_markup                IN lv_json WITH gc_aliq_markup_tc,                          "BSBU-5762

        gc_vlr_icms_deson             IN lv_json WITH gc_vlr_icms_deson_tc,                       "BSBU-6340
        gc_motivo_deson               IN lv_json WITH gc_motivo_deson_tc,                         "BSBU-6340

        gc_cod_mod_doc_icms_subs_ret  IN lv_json WITH gc_cod_mod_doc_icms_sbs_ret_tc,             "BSBU-6453
        gc_data_doc_icms_subs_ret     IN lv_json WITH gc_data_doc_icms_subs_ret_tc,               "BSBU-6453
        gc_vlr_med_unit_icms_est      IN lv_json WITH gc_vlr_med_unit_icms_est_tc,                "BSBU-6453
        gc_qtde_item_conv             IN lv_json WITH gc_qtde_item_conv_tc,                       "BSBU-6453
        gc_unid_med_conv              IN lv_json WITH gc_unid_med_conv_tc,                        "BSBU-6453
        gc_vlr_unid_conv              IN lv_json WITH gc_vlr_unid_conv_tc,                        "BSBU-6453
        gc_vlr_unit_icms_conv         IN lv_json WITH gc_vlr_unit_icms_conv_tc,                   "BSBU-6453
        gc_vlr_unit_base_icms_conv    IN lv_json WITH gc_vlr_unit_base_icms_conv_tc,              "BSBU-6453
        gc_vlr_unit_icmsst_conv       IN lv_json WITH gc_vlr_unit_icmsst_conv_tc,                 "BSBU-6453
        gc_vlr_unit_fcpst_conv        IN lv_json WITH gc_vlr_unit_fcpst_conv_tc,                  "BSBU-6453

        gc_ncm                        IN lv_json WITH gc_ncm_tc, "EXT-1866
        gc_grupo_ncm                  IN lv_json WITH gc_grupo_ncm_tc, "EXT-1866
        gc_cod_cest                   IN lv_json WITH gc_cod_cest_tc, "EXT-1866
        gc_descr_cest                 IN lv_json WITH gc_descr_cest_tc, "EXT-1866
        gc_grupo                      IN lv_json WITH gc_grupo_tc, "EXT-1866
        gc_descr_grupo                IN lv_json WITH gc_descr_grupo_tc, "EXT-1866

        gc_vlr_mat_terc               IN lv_json WITH gc_vlr_mat_terc_tc, "EXT-1848
        gc_vlr_deducao                IN lv_json WITH gc_vlr_deducao_tc, "EXT-1848

        gc_ind_intermed               IN lv_json WITH gc_ind_intermed_tc, "EXT-2510

        gc_cod_inform_adic            IN lv_json WITH gc_cod_inform_adic_tc, "EXT-5013

        gc_vlr_base_desp_inss         IN lv_json WITH gc_vlr_base_desp_inss_tco, "EXT-3527
        gc_aliq_desp_inss             IN lv_json WITH gc_aliq_desp_inss_tco, "EXT-3527
        gc_vlr_desp_inss              IN lv_json WITH gc_vlr_desp_inss_tco, "EXT-3527

        '"ind_nif"'                    IN lv_json WITH '"IndicadorNIF"', "EXT-6102
        gc_nif                        IN lv_json WITH gc_nif_tc, "EXT-6102

        gc_vlr_base_iss_retido        IN lv_json WITH gc_vlr_base_iss_retido_tc, "EXT-6808
        gc_aliq_iss_retido            IN lv_json WITH gc_aliq_iss_retido_tc, "EXT-6808

        gc_arrec_refer                IN lv_json WITH gc_arrec_refer_tc, "EXT-9540
        gc_num_docto_arrec            IN lv_json WITH gc_num_docto_arrec_tc, "EXT-9540
        gc_cod_modelo_arrec           IN lv_json WITH gc_cod_modelo_arrec_tc, "EXT-9540
        gc_cod_autent                 IN lv_json WITH gc_cod_autent_tc, "EXT-9540
        gc_vlr_doc_arrec              IN lv_json WITH gc_vlr_doc_arrec_tc, "EXT-9540
        gc_data_venc                  IN lv_json WITH gc_data_venc_tc, "EXT-9540

        gc_var_cod_receita            IN lv_json WITH gc_var_cod_receita_tc, "EXT-11093
        gc_nat_rend                   IN lv_json WITH gc_nat_rend_tc, "EXT-11093
        gc_cod_nat_rend               IN lv_json WITH gc_cod_nat_rend_tc, "EXT-11093
        gc_observacao                 IN lv_json WITH gc_observacao_tc, "EXT-11093
        gc_ind_origem_rend            IN lv_json WITH gc_ind_origem_rend_tc, "EXT-11093
        gc_cnpj_origem_rend           IN lv_json WITH gc_cnpj_origem_rend_tc, "EXT-11093

        gc_num_parc                   IN lv_json WITH gc_num_parc_tc, "EXT-11959
        gc_data_venc                  IN lv_json WITH gc_data_venc_tc, "EXT-11959
        gc_vlr_parc                   IN lv_json WITH gc_vlr_parc_tc, "EXT-11959
        gc_data_pagto                 IN lv_json WITH gc_data_pagto_tc, "EXT-11959
        gc_vlr_juros                  IN lv_json WITH gc_vlr_juros_tc, "EXT-11959
        gc_vlr_multa                  IN lv_json WITH gc_vlr_multa_tc, "EXT-11959
        gc_vlr_pago                   IN lv_json WITH gc_vlr_pago_tc. "EXT-11959

    ENDIF.

    ret = lv_json.
    CLEAR: lv_json.
  ENDMETHOD.