  METHOD new_out.
    DATA: lv_estorno TYPE c,
          ls_out     TYPE ty_main,
          lv_docnum  TYPE i_br_nfdocument-br_notafiscal,
          ls_retido  TYPE ty_impostosretidos,
          ls_itm_out TYPE ty_itens.
    DELETE t_nfdocs WHERE br_nfdocumenttype = '5'.
    IF t_nfdocs[] IS INITIAL.
      gv_proc = 'Nenhum documento processado'.
    ENDIF.
    LOOP AT t_nfdocs INTO DATA(p_nfdoc).
      CLEAR: lv_estorno, ls_out.
      READ TABLE t_active INTO DATA(p_nfe_active) WITH KEY br_notafiscal = p_nfdoc-br_notafiscal.
      IF sy-subrc IS NOT INITIAL.
        CLEAR p_nfe_active.
      ENDIF.
      READ TABLE t_active_ref INTO DATA(p_nfe_act_ref) WITH KEY br_notafiscal = p_nfdoc-br_notafiscal.
      IF sy-subrc IS NOT INITIAL.
        CLEAR p_nfe_act_ref.
      ENDIF.
      ls_out-codigoempresa = p_nfdoc-companycode.
      ls_out-codigocontribuinte = p_nfdoc-BusinessPlace.
      IF p_nfdoc-br_nfissuedby = '0'.
        ls_out-emitidacontribuinte = '1'.
      ELSE.
        ls_out-emitidacontribuinte = '0'.
      ENDIF.
      ls_out-numerodocumento = p_nfdoc-br_notafiscal.
      IF p_nfdoc-br_nfiscanceled = abap_true.
        IF ls_out-emitidacontribuinte = '1'.
          ls_out-datacancelamento = p_nfdoc-br_nfcancellationdate.
          " Sem motivo de cancelamento na ACTIVE
        ELSE.
          ls_out-codigoempresa = p_nfdoc-companycode.
          ls_out-codigocontribuinte = p_nfdoc-br_businessplacecnpj.


          ls_out-serie    = p_nfdoc-br_nfseries.
          ls_out-subserie     = p_nfdoc-br_nfsubseries.
          APPEND ls_out TO t_out.
          CONTINUE.
        ENDIF.
      ENDIF.
      CASE p_nfdoc-br_nfdirection.
        WHEN '1' OR '3'.
          ls_out-operacao = '0'.
        WHEN '2' OR '4'.
          ls_out-operacao = '1'.
      ENDCASE.
      ls_out-tipopagamento = p_nfdoc-br_paymentform.
      IF p_nfdoc-br_nfismunicipal IS NOT INITIAL.
        ls_out-modelo = 'SV'.
      ELSE.
        ls_out-modelo   = p_nfdoc-br_nfmodel.
      ENDIF.
      ls_out-situacao = p_nfdoc-br_nfsituationcode.
      IF ls_out-situacao IS INITIAL.
        ls_out-situacao = '0'.
      ENDIF.
      ls_out-serie    = p_nfdoc-br_nfseries.
      ls_out-subserie     = p_nfdoc-br_nfsubseries.
      IF p_nfdoc-br_isnfe IS NOT INITIAL.
        IF p_nfe_active IS NOT INITIAL.
          CONCATENATE p_nfe_active-region
                      p_nfe_active-br_nfeissueyear
                      p_nfe_active-br_nfeissuemonth
                      p_nfe_active-br_nfeaccesskeycnpjorcpf
                      p_nfe_active-br_nfemodel
                      p_nfe_active-br_nfeseries
                      p_nfe_active-br_nfenumber
                      p_nfe_active-br_nferandomnumber
                      p_nfe_active-br_nfecheckdigit
                 INTO ls_out-chavenfe.
        ENDIF.
      ENDIF.
      ls_out-dataemissao = p_nfdoc-br_nfissuedate.
      ls_out-dataentradasaida = p_nfdoc-br_nfpostingdate.
      ls_out-totais-valordocumento = p_nfdoc-br_nftotalamount.
      ls_out-totais-descontodespesaoutros-valortotaldesconto = abs( p_nfdoc-br_nfdiscountamount ).
      IF ls_out-modelo = 'SV'.
        ls_out-totais-valorservicos = p_nfdoc-br_nfnetamount.
      ELSE.
        ls_out-totais-valormercadorias = p_nfdoc-br_nfnetamount.
      ENDIF.
      IF ( p_nfdoc-br_nfmodel = '07' OR p_nfdoc-br_nfmodel = '08' OR p_nfdoc-br_nfmodel = '09' OR p_nfdoc-br_nfmodel = '10' OR
       p_nfdoc-br_nfmodel = '26' OR p_nfdoc-br_nfmodel = '27' OR p_nfdoc-br_nfmodel = '57' OR p_nfdoc-br_nfmodel = '63' OR p_nfdoc-br_nfmodel = '67' ).
        IF p_nfe_act_ref IS NOT INITIAL.
          CONCATENATE p_nfe_act_ref-region
                      p_nfe_act_ref-br_nfeissueyear
                      p_nfe_act_ref-br_nfeissuemonth
                      p_nfe_act_ref-br_nfeaccesskeycnpjorcpf
                      p_nfe_act_ref-br_nfemodel
                      p_nfe_act_ref-br_nfeseries
                      p_nfe_act_ref-br_nfenumber
                      p_nfe_act_ref-br_nferandomnumber
                      p_nfe_act_ref-br_nfecheckdigit
                 INTO ls_out-transporte-chavectereferencia.
        ENDIF.

        CASE p_nfdoc-br_ctedocumenttype.
          WHEN space.
            ls_out-transporte-tipocte = '0'.
          WHEN 'A'.
            ls_out-transporte-tipocte = '2'.
          WHEN 'S'.
            ls_out-transporte-tipocte = '3'.
          WHEN OTHERS.
            CLEAR ls_out-transporte-tipocte.
        ENDCASE.
      ENDIF.
      ls_out-transporte-tipofrete = p_nfdoc-freightpayer.
      LOOP AT t_nfitem INTO DATA(ls_item) WHERE nf-br_notafiscal = p_nfdoc-br_notafiscal.
        ls_out-totais-descontodespesaoutros-valorfrete += ls_item-nf-br_nffreightamountwithtaxes.
        ls_out-totais-descontodespesaoutros-valorseguro += ls_item-nf-br_nfinsuranceamountwithtaxes.
        ls_out-totais-descontodespesaoutros-valoroutrasdespesas += ls_item-nf-br_nfexpensesamountwithtaxes.
        IF ls_item-nf-br_nffreightnature IS NOT INITIAL.
          ls_out-transporte-naturezafrete = ls_item-nf-br_nffreightnature.
        ENDIF.
      ENDLOOP.
      LOOP AT t_nftax INTO DATA(ls_tax) WHERE br_notafiscal = p_nfdoc-br_notafiscal.
        CASE ls_tax-taxgroup.
          WHEN 'ICMS'.
            IF ls_tax-br_nfitembaseamount IS NOT INITIAL.
              ls_out-totais-icms-valorbaseicms += ls_tax-br_nfitembaseamount.
              ls_out-totais-icms-valoricms += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN 'ICST'.
            IF ls_tax-br_nfitembaseamount IS NOT INITIAL.
              ls_out-totais-icmsst-valorbaseicmsst += ls_tax-br_nfitembaseamount.
              ls_out-totais-icmsst-valoricmsst += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN 'IPI'.
            IF ls_tax-br_nfitembaseamount IS NOT INITIAL.
              ls_out-totais-ipi-valoripi       += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN 'PIS'.
            IF ls_tax-br_nfitemtaxamount IS NOT INITIAL.
              ls_out-totais-pis-valorpis       += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN  'WHPI' OR 'WAPI'.
            IF ls_tax-br_nfitemtaxamount IS NOT INITIAL.
              ls_out-totais-pis-valorpisstretido       += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN 'COFI'.
            IF ls_tax-br_nfitemtaxamount IS NOT INITIAL.
              ls_out-totais-cofins-valorcofins       += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN 'WHCO' OR 'WACO'.
            IF ls_tax-br_nfitemtaxamount IS NOT INITIAL.
              ls_out-totais-cofins-valorcofinsstretido       += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN 'INSS'.
            IF ls_tax-br_nfitemtaxamount IS NOT INITIAL.
              ls_out-totais-inss-valorinss       += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN 'ISSS' OR 'ISSP'.
            IF ls_tax-br_nfitemtaxamount IS NOT INITIAL.
              ls_out-totais-issqn-valorissqn       += ls_tax-br_nfitemtaxamount.
            ENDIF.
          WHEN 'IRRF' OR 'WHIR' OR 'WAIR'.
            IF ls_tax-br_nfitembaseamount IS NOT INITIAL.
              ls_out-totais-irrf-valorirrf       += ls_tax-br_nfitemtaxamount.
              ls_out-totais-irrf-valorbaseirrf       += ls_tax-br_nfitembaseamount.
              ls_out-totais-irrf-aliquotairrf       = ls_tax-br_nfitemtaxrate.
            ENDIF.
        ENDCASE.
      ENDLOOP.
      ls_out-transporte-placaveiculo = p_nfdoc-licenseplate.
      ls_out-transporte-viatransporte = p_nfdoc-br_ctetransportationmode.
      "ls_out-transporte-especieVolume = p_nfdoc-vol_unit.
      ls_out-transporte-quantidade = p_nfdoc-br_nfnumberofpackages.
      ls_out-transporte-pesobruto = p_nfdoc-headergrossweight.
      ls_out-transporte-pesoliquido = p_nfdoc-headernetweight.
      ls_out-transporte-estado = p_nfdoc-vehicleregion.
      IF ls_out-modelo = 'SV' OR ls_out-operacao = '1'.
        ls_out-periodoescrituracao = p_nfdoc-br_nfissuedate.
      ELSE.
        ls_out-periodoescrituracao = p_nfdoc-br_nfpostingdate.
      ENDIF.
      ls_out-indintermediario = p_nfdoc-br_nfeintermediatortransaction.
      READ TABLE t_partner INTO DATA(ls_parc_nf) WITH KEY br_notafiscal = p_nfdoc-br_notafiscal
                                                       br_nfpartner  = p_nfdoc-br_nfpartner.
      IF sy-subrc IS INITIAL.
        ls_out-parceiro-codigo = p_nfdoc-br_nfpartner.
        ls_out-parceiro-nome = ls_parc_nf-br_nfpartnername1.
        IF ls_parc_nf-br_nfpartnercnpj > 0.
          ls_out-parceiro-cnpj = ls_parc_nf-br_nfpartnercnpj.
        ELSE.
          ls_out-parceiro-cpf = ls_parc_nf-br_nfpartnercpf.
        ENDIF.
        IF ls_parc_nf-br_nfpartnerstatetaxnumber IS NOT INITIAL.
          ls_out-parceiro-inscricaoestadual = normalize(  ls_parc_nf-br_nfpartnerstatetaxnumber ).
        ENDIF.
        IF ls_parc_nf-br_nfpartnermunicipaltaxnumber IS NOT INITIAL.
          ls_out-parceiro-inscricaomunicipal = normalize(  ls_parc_nf-br_nfpartnermunicipaltaxnumber ).
        ENDIF.
        ls_out-parceiro-ativo = 1.
        ls_out-parceiro-endereco = ls_parc_nf-br_nfpartnerstreetname.
        ls_out-parceiro-bairro = ls_parc_nf-br_nfpartnerdistrictname.
        ls_out-parceiro-cep = ls_parc_nf-br_nfpartnerpostalcode.
        REPLACE ALL OCCURRENCES OF '-' IN ls_out-parceiro-cep WITH ''.
        ls_out-parceiro-telefone = ls_parc_nf-phonenumber.
      ENDIF.
      IF p_nfdoc-br_nfpartnerfunction = 'SP'.
        MOVE-CORRESPONDING ls_out-parceiro TO ls_out-transporte-transportadora.
      ELSE.
        READ TABLE t_partner INTO ls_parc_nf WITH KEY br_notafiscal = p_nfdoc-br_notafiscal
                                                       br_nfpartner  = p_nfdoc-br_nfpartner
                                                       br_nfpartnerfunction  = 'SP'.
        IF sy-subrc IS INITIAL.
          ls_out-parceiro-codigo = p_nfdoc-br_nfpartner.
          ls_out-parceiro-nome = ls_parc_nf-br_nfpartnername1.
          ls_out-parceiro-cnpj = ls_parc_nf-br_nfpartnercnpj.
          ls_out-parceiro-cpf = ls_parc_nf-br_nfpartnercpf.
          IF ls_parc_nf-br_nfpartnerstatetaxnumber IS NOT INITIAL.
            ls_out-parceiro-inscricaoestadual = normalize(  ls_parc_nf-br_nfpartnerstatetaxnumber ).
          ENDIF.
          IF ls_parc_nf-br_nfpartnermunicipaltaxnumber IS NOT INITIAL.
            ls_out-parceiro-inscricaomunicipal = normalize(  ls_parc_nf-br_nfpartnermunicipaltaxnumber ).
          ENDIF.
          ls_out-parceiro-ativo = 1.
          ls_out-parceiro-endereco = ls_parc_nf-br_nfpartnerstreetname.
          ls_out-parceiro-bairro = ls_parc_nf-br_nfpartnerdistrictname.
          ls_out-parceiro-cep = ls_parc_nf-br_nfpartnerpostalcode.
          ls_out-parceiro-telefone = ls_parc_nf-phonenumber.
        ENDIF.
      ENDIF.
      DATA(lv_seq) = 0.
      LOOP AT t_nfitem INTO DATA(ls_itm).
        lv_seq += 1.
        CLEAR ls_itm_out.
        DATA(p_nflin) = ls_itm-nf.
        IF lv_docnum = ls_itm-nf-br_notafiscal.
          lv_docnum = ls_itm-nf-br_notafiscal.
          READ TABLE t_bkpf INTO DATA(ls_bkpf) WITH KEY originalreferencedocument = ls_itm-nf-br_nfsourcedocumentnumber.
          IF sy-subrc IS INITIAL.
            READ TABLE t_bseg INTO DATA(ls_bseg) WITH KEY companycode = ls_bkpf-companycode
                                                     accountingdocument = ls_bkpf-accountingdocument
                                                     fiscalyear = ls_bkpf-fiscalyear.
            IF sy-subrc IS INITIAL.
              gv_faedt = ls_bseg-netduedate.
            ENDIF.
            ls_out-numerolancamentocontabil = ls_bkpf-accountingdocument.
          ENDIF.
        ENDIF.
        ls_itm_out-numerosequencia = lv_seq.
        ls_itm_out-codigoreferenciaintegracao = ls_itm-nf-br_notafiscalitem.
        IF ls_itm-nf-material IS NOT INITIAL.
          ls_itm_out-item-codigo = ls_itm-nf-material.
        ELSEIF ls_out-modelo = 'SV'.                                   "BSBU-2710
          IF ls_itm-nf-activitynumber IS INITIAL.
            ls_itm_out-item-codigo = 'SERV'.
          ELSE.
            ls_itm_out-item-codigo = ls_itm-nf-activitynumber.
          ENDIF.
        ENDIF.
        ls_itm_out-item-descricao = ls_itm-nf-materialname.
        IF ( ls_itm-nf-material IS INITIAL AND ls_itm-nf-activitynumber IS NOT INITIAL ) OR
            ls_itm_out-item-codigo = 'SERV'.
          ls_itm_out-item-tipoitem = '09'.
        ELSEIF ls_itm-nf-material IS NOT INITIAL.
          CASE ls_itm-referenceproducttype.
            WHEN 'HAWA'.
              ls_itm_out-item-tipoitem = '00'.
            WHEN 'ROH'.
              ls_itm_out-item-tipoitem = '01'.
            WHEN 'VERP' OR 'LEIH'.
              ls_itm_out-item-tipoitem = '02'.
            WHEN 'PROC' OR 'HALB'.
              ls_itm_out-item-tipoitem = '03'.
            WHEN 'FERT'.
              IF ls_itm-iscoproduct IS INITIAL.
                ls_itm_out-item-tipoitem = '04'.
              ELSE.
                ls_itm_out-item-tipoitem = '05'.
              ENDIF.
            WHEN 'HIBE'.
              ls_itm_out-item-tipoitem = '06'.
            WHEN 'NLAG'.
              ls_itm_out-item-tipoitem = '07'.
            WHEN 'DIEN' OR 'LEIS'.
              ls_itm_out-item-tipoitem = '09'.
            WHEN OTHERS.
              ls_itm_out-item-tipoitem = '99'.
          ENDCASE.
        ENDIF.
        ls_itm_out-item-codigobarra = ls_itm-nf-internationalarticlenumber.
        ls_itm_out-item-classificacaofiscal-codigo = normalize( p_str = ls_itm-nf-ncmcode ).
        DATA(lv_lc116) = ls_itm-nf-br_lc116servicecode.
        REPLACE ALL OCCURRENCES OF REGEX '([^\d])' IN lv_lc116 WITH ''.
        ls_itm_out-item-codigolistaservico = lv_lc116.
        IF strlen( p_nflin-br_cfopcode ) >= 4.
          ls_itm_out-cfop = p_nflin-br_cfopcode(4).
          ls_itm_out-cfopcomplemento = p_nflin-br_cfopcode+5.
        ENDIF.
        ls_itm_out-naturezaoperacao-codigo = p_nflin-br_cfopcode.
        ls_itm_out-naturezaoperacao-descricao = p_nflin-br_cfopcode.
        ls_itm_out-unidademedida-codigo = ls_itm-unitofmeasureisocode.
        ls_itm_out-unidademedida-descricao = ls_itm-unitofmeasure_e.
        ls_itm_out-item-unidademedida = ls_itm_out-unidademedida.
        ls_itm_out-quantidade = p_nflin-quantityinbaseunit.
        ls_itm_out-valorUnidade = p_nflin-BR_NFPriceAmountWithTaxes.
        ls_itm_out-valortotal = p_nflin-br_nfvalueamountwithtaxes.
        ls_itm_out-valordescontocomercial = abs( p_nflin-br_nfdiscountamountwithtaxes ).
        ls_itm_out-valorfrete = p_nflin-br_nffreightamountwithtaxes.
        ls_itm_out-valorseguro = p_nflin-br_nfinsuranceamountwithtaxes.
        ls_itm_out-valoroutrasdespesas = p_nflin-br_nfexpensesamountwithtaxes.
        ls_itm_out-codigocontacontabilanalitica = p_nflin-GLAccount.
        ls_itm_out-movimentacaofisica = p_nflin-br_nfisphysicalmvtofmaterial.
        ls_itm_out-valorcontabil = ( ls_itm_out-valortotal + ls_itm_out-valorfrete + ls_itm_out-valorseguro + ls_itm_out-valoroutrasdespesas ) - ls_itm_out-valordescontocomercial.

        DATA: lv_base     TYPE i_br_nftax-br_nfitembaseamount,
              lv_base_oth TYPE i_br_nftax-br_nfitembaseamount,
              lv_base_exc TYPE i_br_nftax-br_nfitembaseamount,
              lv_rate     TYPE i_br_nftax-br_nfitemtaxrate,
              lv_taxval   TYPE i_br_nftax-br_nfitemtaxamount,
              lv_srate    TYPE i_br_nftax-br_nfitemtaxrate.

        LOOP AT t_nftax_itm INTO DATA(ls_tax_itm) WHERE br_notafiscal = p_nflin-br_notafiscal
                                                AND br_notafiscalitem = p_nflin-br_notafiscalitem.
          CLEAR: lv_base,
                 lv_base_exc,
                 lv_base_oth,
                 lv_rate,
                 lv_taxval,
                 lv_srate.
          lv_base     = ls_tax_itm-br_nfitembaseamount.
          lv_base_exc = ls_tax_itm-br_nfitemexcludedbaseamount.
          lv_base_oth = ls_tax_itm-br_nfitemotherbaseamount.
          lv_rate     = ls_tax_itm-br_nfitemtaxrate.
          lv_taxval   = ls_tax_itm-br_nfitemtaxamount.
          CASE ls_tax_itm-taxgroup.
            WHEN gc_icms.
              ls_itm_out-imposto-icms-valorBaseICMS = lv_base.
              ls_itm_out-imposto-icms-valorBaseIsentoICMS = lv_base_exc.
              ls_itm_out-imposto-icms-valorBaseOutrosICMS = lv_base_oth.
              ls_itm_out-imposto-icms-valorBaseTributadoICMS   = lv_base.

              IF lv_base IS NOT INITIAL OR p_nflin-br_cfopcode(4) = '1604'.
                ls_itm_out-imposto-icms-aliquotaICMS = lv_rate.
                ls_itm_out-imposto-icms-valorICMS  = lv_taxval.
              ENDIF.

              ls_itm_out-imposto-icms-situacaotributariaicmstaba = p_nflin-br_materialorigin.
              ls_itm_out-imposto-icms-situacaotributariaicmstabb = p_nflin-br_icmstaxsituation.

              IF p_nflin-br_icmstaxsituation = '20' OR p_nflin-br_icmstaxsituation = '70'.
                ls_itm_out-imposto-icms-aliquotaReducaoICMS       = lv_rate.
                ls_itm_out-imposto-icms-valorReduzidoICMS        = ls_tax_itm-br_nfitemexcludedbaseamount.
              ENDIF.

            WHEN gc_icms_st.
              ls_itm_out-imposto-icmsst-valorBaseICMSST = lv_base.

              IF lv_base IS NOT INITIAL.
                ls_itm_out-imposto-icmsst-aliquotaICMSST   = lv_rate.
                ls_itm_out-imposto-icmsst-valorICMSST    = lv_taxval.
              ENDIF.
              ls_itm_out-valorcontabil += lv_taxval.

              IF lv_base_oth IS NOT INITIAL.
                ls_itm_out-imposto-icmsst-valorICMSSTNaoTributado = lv_taxval.
              ENDIF.
              "BSBU-2160

              IF lv_srate IS NOT INITIAL.
                ls_itm_out-imposto-icmsst-aliquotaMarkup = lv_srate.
              ENDIF.

            WHEN gc_ipi.
              ls_itm_out-imposto-ipi-baseCalculoIPI        = lv_base.
              ls_itm_out-imposto-ipi-valorBaseIsentoIPI = lv_base_exc.
              ls_itm_out-imposto-ipi-valorBaseOutrosIPI = lv_base_oth.
              ls_itm_out-imposto-ipi-valorBaseTributadoIPI   = lv_base.

              IF lv_base IS NOT INITIAL.
                ls_itm_out-imposto-ipi-aliquotaIPI = lv_rate.
                ls_itm_out-imposto-ipi-valorIPI  = lv_taxval.
              ENDIF.
              ls_itm_out-valorcontabil += lv_taxval.

              IF lv_base_oth IS NOT INITIAL.
                ls_itm_out-imposto-ipi-valorNaoTributadoIPI   = lv_taxval.
                ls_itm_out-imposto-ipi-valorNaoTributadoIPI = ls_itm_out-imposto-ipi-valorNaoTributadoIPI + lv_taxval.
              ENDIF.

            WHEN gc_pis.
              ls_itm_out-imposto-pis-situacaoTributariaPIS = p_nflin-br_pistaxsituation.
              ls_itm_out-imposto-pis-baseCalculoPIS = lv_base.
              ls_itm_out-imposto-pis-aliquotaPIS     = lv_rate.
              ls_itm_out-imposto-pis-valorPIS      = lv_taxval.

*              IF p_nflin-br_pistaxsituation = '05' OR p_nflin-br_pistaxsituation = '75'.
*                p_doc_fiscal-vlr_pis_subst = p_doc_fiscal-vlr_pis_subst + lv_taxval.
*                CLEAR p_doc_fiscal-vlr_pis.
*              ENDIF.
*
*              IF p_nflin-br_cfopcode IS NOT INITIAL AND p_nflin-br_cfopcode(1) = '3'.
*                ls_itm_out-imposto-pis-vlr_pis_ii   = lv_taxval.
*              ENDIF.

*            WHEN gc_pis_imp.
*              IF p_nflin-br_cfopcode IS NOT INITIAL AND p_nflin-br_cfopcode(1) = '3'.
*                p_doc_item-vlr_pis_ii   = lv_taxval.
*              ENDIF.

            WHEN gc_cofins.
              ls_itm_out-imposto-cofins-situacaotributariacofins = p_nflin-br_cofinstaxsituation.
              ls_itm_out-imposto-cofins-baseCalculoCOFINS = lv_base.
              ls_itm_out-imposto-cofins-aliquotaCOFINS     = lv_rate.
              ls_itm_out-imposto-cofins-valorCOFINS      = lv_taxval.

*              IF p_nflin-br_cfopcode IS NOT INITIAL AND p_nflin-br_cfopcode(1) = '3'.
*                p_doc_item-vlr_cofins_ii   = lv_taxval.
*              ENDIF.

*            WHEN gc_cofins_imp.
*              IF p_nflin-br_cfopcode IS NOT INITIAL AND p_nflin-br_cfopcode(1) = '3'.
*                p_doc_item-vlr_cofins_ii   = lv_taxval.
*              ENDIF.

            WHEN gc_issqn.
              IF ls_tax_itm-br_nfitemhaswithholdingtax IS NOT INITIAL.
                ls_itm_out-imposto-issqn-valorISSRetido = lv_taxval.
                ls_itm_out-imposto-issqn-valorBaseISSRetido = lv_base.
                ls_itm_out-imposto-issqn-aliquotaISSRetido     = lv_rate.
              ELSE.
                ls_itm_out-imposto-issqn-baseCalculoISSQN = lv_base.
                ls_itm_out-imposto-issqn-aliquotaISSQN     = lv_rate.
                ls_itm_out-imposto-issqn-valorISSQN      = lv_taxval.
              ENDIF.

            WHEN gc_icms_difal.
              ls_itm_out-imposto-icms-difal-valorBaseICMSDIFAL = lv_base.
              ls_itm_out-imposto-icms-difal-aliquotaICMSDIFAL     = lv_rate.
              ls_itm_out-imposto-icms-difal-valorICMSDIFAL      = lv_taxval.

            WHEN gc_icms_fcp.
              IF lv_base IS NOT INITIAL.
                ls_itm_out-imposto-icmsst-percentualFCPST     = lv_rate.
                ls_itm_out-imposto-icmsst-valorFCPST      = lv_taxval.
              ENDIF.

              ls_itm_out-valorcontabil += lv_taxval.
*
*            WHEN gc_icms_fcp_st.
*              p_doc_item-vlr_base_icms_fcp_st = lv_base.
*
*              IF lv_base IS NOT INITIAL.
*                p_doc_item-aliq_icms_fcp_st     = lv_rate.
*                p_doc_item-vlr_icms_fcp_st      = lv_taxval.
*              ENDIF.
*
*              p_doc_fiscal-vlr_fcp_st = p_doc_fiscal-vlr_fcp_st + lv_taxval.
*
*              p_doc_item-vlr_contabil_item  = p_doc_item-vlr_contabil_item + lv_taxval.
*
*            WHEN gc_icms_fcp_rt.
*              p_doc_item-vlr_base_icms_fcp_rt = lv_base.
*
*              IF lv_base IS NOT INITIAL.
*                p_doc_item-aliq_icms_fcp_rt     = lv_rate.
*                p_doc_item-vlr_icms_fcp_rt      = lv_taxval.
*              ENDIF.
*
*              p_doc_fiscal-vlr_fcp_ret = p_doc_fiscal-vlr_fcp_ret + lv_taxval.
*
*            WHEN gc_zona_franca.
*              p_doc_item-vlr_desc_zonafranca = abs( lv_taxval ).
*              p_doc_fiscal-desc_zonafranca   = p_doc_fiscal-desc_zonafranca + abs( lv_taxval ).
**       p_doc_fiscal-desc_livre_com    = p_doc_fiscal-desc_livre_com + lv_taxval.
*
*              p_doc_item-vlr_icms_deson      = p_doc_item-vlr_desc_zonafranca.
*              "p_doc_item-motivo_deson        = gv_motivo_deson.
*
*            WHEN gc_icms_origem.
*              p_doc_item-vlr_icms_origem     = lv_taxval.
*              p_doc_fiscal-vlr_icms_uf_remet = p_doc_fiscal-vlr_icms_uf_remet + lv_taxval.
*
*            WHEN gc_icms_destino.
*              p_doc_item-aliq_icms_dest      = lv_rate.
*              p_doc_item-vlr_icms_dest       = lv_taxval.
*              p_doc_fiscal-vlr_icms_uf_dest  = p_doc_fiscal-vlr_icms_uf_dest + lv_taxval.
*
*            WHEN gc_icms_snac.
*              IF lv_base IS NOT INITIAL.
*                p_doc_item-vlr_base_icms_snac = lv_base.
*                p_doc_item-aliq_icms_snac     = lv_rate.
*                p_doc_item-vlr_icms_snac      = lv_taxval.
*              ENDIF.
*
*            WHEN gc_irf.
*              p_doc_item-vlr_iss_retido = lv_taxval.
*
*            WHEN gc_csll.
*
*            WHEN gc_ir.
*              p_doc_fiscal-aliq_ir_fonte     = lv_rate.
*              p_doc_fiscal-vlr_base_ir_fonte = lv_base.

            WHEN gc_ii.
              ls_itm_out-imposto-ii-baseCalculoII   = lv_base.

              IF lv_base IS NOT INITIAL.
                ls_itm_out-imposto-ii-aliquotaII            = lv_rate.
                ls_itm_out-imposto-ii-valorII             = lv_taxval.
              ENDIF.
              ls_itm_out-valorcontabil += lv_taxval.
            WHEN 'INSS'.
              ls_itm_out-imposto-inss-baseCalculoINSS = lv_base.
              ls_itm_out-imposto-inss-valorINSS = lv_taxval.
              ls_itm_out-imposto-inss-aliquotaINSS = lv_rate.

            WHEN OTHERS.
          ENDCASE.

        ENDLOOP.
        APPEND ls_itm_out TO ls_out-itens.
      ENDLOOP.
      LOOP AT t_withtax INTO DATA(ls_with) WHERE companycode = ls_bkpf-companycode
                                             AND accountingdocument = ls_bkpf-accountingdocument
                                             AND fiscalyear = ls_bkpf-fiscalyear.

*            6 = IRPJ
*            9 = CPMF
*            10 = CIDE
*            11 = RET
*            12 = CSRF
*            13 = COSIRF
*            14 = CPSSS
*            15 = PIS/PASEP
*            16 = RET/PAGAMENTO UNIFICADO DE TRIBUTOS
*            17 = PCC
*
        CASE ls_with-withholdingtaxtype.
          WHEN 'CA' OR 'CP'.
*             1 = COFINS
            ls_retido-tipoimposto = '1'.
          WHEN 'SA' OR 'SP'.
*            2 = CSLL
            ls_retido-tipoimposto = '2'.
          WHEN 'IC' OR 'ID' OR 'IR' OR 'RF' OR 'RP'.
*            3 = IRRF
            ls_retido-tipoimposto = '3'.
          WHEN 'IW'.
*            5 = ISSQN
            ls_retido-tipoimposto = '5'.
          WHEN 'PA' OR 'PP'.
*            8 = PIS
            ls_retido-tipoimposto = '8'.
          WHEN 'IJ' OR 'IM' OR 'IN' OR 'NS'.
*            18 = INSS
            ls_retido-tipoimposto = '18'.
          WHEN 'GP'.
*            16 = RET/PAGAMENTO UNIFICADO DE TRIBUTOS
            ls_retido-tipoimposto = '16'.
        ENDCASE.
        ls_retido-datavencimento = gv_faedt.
        ls_retido-datapagamento = ls_with-clearingdate.
        ls_retido-valorbaseretencao = ls_with-whldgtaxbaseamtincocodecrcy.
        ls_retido-valorretido = ls_with-whldgtaxamtincocodecrcy.
        APPEND ls_retido TO ls_out-impostosretidos.
      ENDLOOP.
      APPEND ls_out TO t_out.
    ENDLOOP.
  ENDMETHOD.