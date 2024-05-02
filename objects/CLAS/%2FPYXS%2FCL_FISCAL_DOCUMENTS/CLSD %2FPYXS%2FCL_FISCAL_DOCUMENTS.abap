class-pool .
*"* class pool for class /PYXS/CL_FISCAL_DOCUMENTS

*"* local type definitions
include /PYXS/CL_FISCAL_DOCUMENTS=====ccdef.

*"* class /PYXS/CL_FISCAL_DOCUMENTS definition
*"* public declarations
  include /PYXS/CL_FISCAL_DOCUMENTS=====cu.
*"* protected declarations
  include /PYXS/CL_FISCAL_DOCUMENTS=====co.
*"* private declarations
  include /PYXS/CL_FISCAL_DOCUMENTS=====ci.
endclass. "/PYXS/CL_FISCAL_DOCUMENTS definition

*"* macro definitions
include /PYXS/CL_FISCAL_DOCUMENTS=====ccmac.
*"* local class implementation
include /PYXS/CL_FISCAL_DOCUMENTS=====ccimp.

*"* test class
include /PYXS/CL_FISCAL_DOCUMENTS=====ccau.

class /PYXS/CL_FISCAL_DOCUMENTS implementation.
*"* method's implementations
  include methods.
endclass. "/PYXS/CL_FISCAL_DOCUMENTS implementation
