CLASS /pyxs/cl_accounting_documents DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_rap_query_provider.
    TYPES:
      BEGIN OF ty_companhia,
        CodigoCIA TYPE string,
      END OF ty_companhia,

      BEGIN OF ty_Parceiro,
        Companhia TYPE ty_Companhia,
        Codigo    TYPE string,
      END OF ty_Parceiro,


      BEGIN OF ty_EstabFiscal,
        Companhia TYPE ty_Companhia,
        Codigo    TYPE string,
      END OF ty_EstabFiscal,


      BEGIN OF ty_ParticipanteAcionario,
        Companhia   TYPE ty_Companhia,
        EstabFiscal TYPE ty_EstabFiscal,
        Codigo      TYPE string,
      END OF ty_ParticipanteAcionario,

      BEGIN OF ty_CodigoAglutinacao,
        Companhia TYPE ty_Companhia,
        Codigo    TYPE string,
      END OF ty_CodigoAglutinacao,


      BEGIN OF ty_EstabelecimentoFiscal,
        Companhia TYPE ty_Companhia,
        Codigo    TYPE string,
      END OF ty_EstabelecimentoFiscal,

      BEGIN OF ty_HistoricoPadrao,
        Companhia             TYPE ty_Companhia,
        EstabelecimentoFiscal TYPE ty_EstabelecimentoFiscal,
        Codigo                TYPE string,
      END OF ty_HistoricoPadrao,


      BEGIN OF ty_CentroCusto,
        Companhia TYPE ty_Companhia,
        Codigo    TYPE string,
      END OF ty_CentroCusto,


      BEGIN OF ty_GrupoContabil,
        Companhia TYPE ty_Companhia,
        Codigo    TYPE string,
      END OF ty_GrupoContabil,



      BEGIN OF ty_PlanoConta,
        Companhia     TYPE ty_Companhia,
        GrupoContabil TYPE ty_GrupoContabil,
        Codigo        TYPE string,
      END OF ty_PlanoConta,



      BEGIN OF ty_main,
        Companhia                      TYPE ty_Companhia,
        EstabelecimentoFiscal          TYPE ty_EstabelecimentoFiscal,
        PlanoConta                     TYPE ty_PlanoConta,
        CentroCusto                    TYPE ty_CentroCusto,
        HistoricoPadrao                TYPE ty_HistoricoPadrao,
        CodigoAglutinacao              TYPE ty_CodigoAglutinacao,
        ParticipanteAcionario          TYPE ty_ParticipanteAcionario,
        DataLancamento                 TYPE d,
        DataLancamentoExtemporaneo     TYPE d,
        CodigoLancamento               TYPE string,
        TipoLancamento                 TYPE string,
        CodigoDivisaoContabil          TYPE string,
        Sequencia                      TYPE p LENGTH 15 DECIMALS 2,
        Valor                          TYPE p LENGTH 15 DECIMALS 2,
        Natureza                       TYPE string,
        CodigoArquivo                  TYPE string,
        Descricao                      TYPE string,
        ValorAuxiliar                  TYPE p LENGTH 15 DECIMALS 2,
        IndicadorDebitoCreditoAuxiliar TYPE string,
        UtilizacaoLancamento           TYPE p LENGTH 15 DECIMALS 2,
        Parceiro                       TYPE ty_Parceiro,
        TipoLancamentoERP              TYPE string,
      END OF ty_main,

      BEGIN OF ty_sel,
        companyCode        TYPE i_journalentry-CompanyCode,
        PostingDate        TYPE RANGE OF i_journalEntry-PostingDate,
        AccountingDocument TYPE RANGE OF i_journalEntry-AccountingDocument,
        FiscalYear         TYPE RANGE OF i_JournalEntry-FiscalYear,
        DocumentType       TYPE RANGE OF i_JournalEntry-AccountingDocumentType,
        Account            TYPE RANGE OF i_journalEntryItem-GLAccount,
        finish             TYPE i_journalEntry-AccountingDocumentType,
        opened             TYPE abap_boolean,
      END OF ty_Sel,
      BEGIN OF ty_data,
        hdr TYPE i_journalentry,
        itm TYPE I_OperationalAcctgDocItem,
        cpn TYPE I_CompanyCode,
      END OF ty_data.
    METHODS: main_process.