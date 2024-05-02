CLASS /pyxs/json_conversion DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  CLASS-METHODS:
    convert_json
      IMPORTING
        json TYPE string
      returning
        value(ret) TYPE string.