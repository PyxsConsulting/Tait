class-pool .
*"* class pool for class /PYXS/INTEGRATION

*"* local type definitions
include /PYXS/INTEGRATION=============ccdef.

*"* class /PYXS/INTEGRATION definition
*"* public declarations
  include /PYXS/INTEGRATION=============cu.
*"* protected declarations
  include /PYXS/INTEGRATION=============co.
*"* private declarations
  include /PYXS/INTEGRATION=============ci.
endclass. "/PYXS/INTEGRATION definition

*"* macro definitions
include /PYXS/INTEGRATION=============ccmac.
*"* local class implementation
include /PYXS/INTEGRATION=============ccimp.

*"* test class
include /PYXS/INTEGRATION=============ccau.

class /PYXS/INTEGRATION implementation.
*"* method's implementations
  include methods.
endclass. "/PYXS/INTEGRATION implementation
