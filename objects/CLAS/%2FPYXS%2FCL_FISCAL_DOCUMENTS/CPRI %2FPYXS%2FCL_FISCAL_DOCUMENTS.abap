  PRIVATE SECTION.

    CONSTANTS: gc_icms         TYPE c LENGTH 10 VALUE 'ICMS',
               gc_icms_st      TYPE c LENGTH 10 VALUE 'ST',
               gc_ipi          TYPE c LENGTH 10 VALUE 'IPI',
               gc_pis          TYPE c LENGTH 10 VALUE 'PIS',
               gc_pis_imp      TYPE c LENGTH 10 VALUE 'PIS_IMP',
               gc_cofins       TYPE c LENGTH 10 VALUE 'COFINS',
               gc_cofins_imp   TYPE c LENGTH 10 VALUE 'COFINS_IMP',
               gc_issqn        TYPE c LENGTH 10 VALUE 'ISSQN',
               gc_icms_difal   TYPE c LENGTH 10 VALUE 'ICMS-DIFAL',
               gc_icms_fcp     TYPE c LENGTH 10 VALUE 'ICMS-FCP',
               gc_icms_fcp_st  TYPE c LENGTH 10 VALUE 'ICMS-FCPST',
               gc_icms_fcp_rt  TYPE c LENGTH 10 VALUE 'ICMS-FCPRT',
               gc_zona_franca  TYPE c LENGTH 10 VALUE 'ZONAFRANCA',
               gc_icms_origem  TYPE c LENGTH 10 VALUE 'ICMS-ORIG',
               gc_icms_destino TYPE c LENGTH 10 VALUE 'ICMS-DEST',
               gc_icms_snac    TYPE c LENGTH 10 VALUE 'ICMS-SNAC',
               gc_irf          TYPE c LENGTH 10 VALUE 'IRF',
               gc_csll         TYPE c LENGTH 10 VALUE 'CSLL',
               gc_ir           TYPE c LENGTH 10 VALUE 'IR',
               gc_ii           TYPE c LENGTH 10 VALUE 'II',
               gc_inss         TYPE c LENGTH 10 VALUE 'INSS'.

    DATA: t_nfdocs         TYPE TABLE OF i_br_nfdocument,
          t_nfitem         TYPE TABLE OF ty_nfitem,
          t_nftax          TYPE TABLE OF i_br_nftax,
          t_nftax_itm      TYPE TABLE OF i_br_nftax,
          "lt_refmes TYPE TABLE OF I_BR_NFREFERENCEMESSAGE,
          t_imp_di         TYPE TABLE OF i_br_nfimportdocument,
          t_branch         TYPE TABLE OF /pyxs/nf_branch,
          "lt_ftx    TYPE TABLE OF YY1_GLAccount,
          "lt_imp_adi TYPE TABLE OF I_BR_NFADDITIONIMPORTDOC,
          "lt_pharma TYPE TABLE OF I_BR_NFPHARMACEUTICAL.
          t_active         TYPE TABLE OF i_br_nfeactive,
          t_active_ref     TYPE TABLE OF i_br_nfeactive,
          t_bkpf           TYPE TABLE OF ty_bkpf,
          t_bseg           TYPE TABLE OF ty_bseg,
          t_withtax        TYPE TABLE OF ty_withtax,
          t_region         TYPE TABLE OF i_regiontext,
          t_country        TYPE TABLE OF i_countrytext,
          t_partner        TYPE TABLE OF i_br_nfpartner,
          t_units          TYPE TABLE OF i_unitofmeasuretext,
          sel              TYPE ty_sel,
          data             TYPE d,
          hora             TYPE t,
          gv_faedt         TYPE d,
          gv_cod_serv      TYPE c LENGTH 16,
          gv_vlr_base_prev TYPE i_br_nftax-br_nfitembaseamount,
          gv_vlr_prev      TYPE i_br_nftax-br_nfitemtaxamount,
          gv_aliq_retencao TYPE i_br_nftax-br_nfitemtaxamount,
          gv_item          TYPE i,
          gv_cnpj          TYPE i_br_nfdocument-br_businessplacecnpj,
          gv_proc          TYPE string,
          t_out            TYPE TABLE OF ty_main.


    METHODS: read_nf_db,
      new_out,
      get_ibge_state
        IMPORTING
          p_bland             TYPE clike
        RETURNING
          VALUE(p_cod_estado) TYPE /pyxs/nf_branch-uf,
      normalize
        IMPORTING
                  p_str             TYPE clike
        RETURNING VALUE(normalized) TYPE string,
      send_integration.
