CLASS /pyxs/integration DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS: send_integration
      IMPORTING
        comm_scenario  TYPE clike
        service_id     TYPE clike
        cnpj           TYPE clike OPTIONAL
        data           TYPE data

      RETURNING
        VALUE(message) TYPE string.