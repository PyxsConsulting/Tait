class-pool .
*"* class pool for class /PYXS/CL_ACCOUNTING_DOCUMENTS

*"* local type definitions
include /PYXS/CL_ACCOUNTING_DOCUMENTS=ccdef.

*"* class /PYXS/CL_ACCOUNTING_DOCUMENTS definition
*"* public declarations
  include /PYXS/CL_ACCOUNTING_DOCUMENTS=cu.
*"* protected declarations
  include /PYXS/CL_ACCOUNTING_DOCUMENTS=co.
*"* private declarations
  include /PYXS/CL_ACCOUNTING_DOCUMENTS=ci.
endclass. "/PYXS/CL_ACCOUNTING_DOCUMENTS definition

*"* macro definitions
include /PYXS/CL_ACCOUNTING_DOCUMENTS=ccmac.
*"* local class implementation
include /PYXS/CL_ACCOUNTING_DOCUMENTS=ccimp.

*"* test class
include /PYXS/CL_ACCOUNTING_DOCUMENTS=ccau.

class /PYXS/CL_ACCOUNTING_DOCUMENTS implementation.
*"* method's implementations
  include methods.
endclass. "/PYXS/CL_ACCOUNTING_DOCUMENTS implementation
