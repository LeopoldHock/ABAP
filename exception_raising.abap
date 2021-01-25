*----------------------------------------------------------------------*
* Leopold Hock | 25.01.2021
* https://github.com/LeopoldHock/ | https://leopoldhock.de
* Different ways to raise T100-exceptions in ABAP NetWeaver 7.50.
*----------------------------------------------------------------------*

* 1) RAIE EXCEPTION ... MESSAGE
RAISE EXCEPTION TYPE zcx_exception e001(z_msg_class) WITH lv_var1.
* Drawbacks: None ¯\_(ツ)_/¯

* 2) RAISE EXCEPTION TYPE ... MESSAGE ...
RAISE EXCEPTION TYPE zcx_exception MESSAGE ID 'Z_MSG_CLASS' TYPE 'E' NUMBER 001 WITH lv_var1.
* Drawbacks: No jump-into-functionality and (!) cross reference for the message.

* 3) RAISE EXCEPTION TYPE ... EXPORTING ...
DATA(ls_textid) = VALUE scx_t100key( msgid = 'Z_MSG_CLASS' msgno = 001 attr1 = lv_var1 ).
RAISE EXCEPTION TYPE zcx_exception EXPORTING textid = ls_textid.
* Drawbacks: No jump-into-functionality and (!) cross reference for the message. Requires an extra line of code and an extra structure.
