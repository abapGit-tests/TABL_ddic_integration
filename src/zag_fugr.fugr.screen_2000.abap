PROCESS BEFORE OUTPUT.
 MODULE LISTE_INITIALISIEREN.
 LOOP AT EXTRACT WITH CONTROL
  TCTRL_ZAG_TABL_DB CURSOR NEXTLINE.
   MODULE LISTE_SHOW_LISTE.
 ENDLOOP.
*
PROCESS AFTER INPUT.
 MODULE LISTE_EXIT_COMMAND AT EXIT-COMMAND.
 MODULE LISTE_BEFORE_LOOP.
 LOOP AT EXTRACT.
   MODULE LISTE_INIT_WORKAREA.
   CHAIN.
    FIELD ZAG_TABL_DB-PARAM_KEY .
    FIELD ZAG_TABL_DB-PARAM_VALUE .
    MODULE SET_UPDATE_FLAG ON CHAIN-REQUEST.
   ENDCHAIN.
   FIELD VIM_MARKED MODULE LISTE_MARK_CHECKBOX.
   CHAIN.
    FIELD ZAG_TABL_DB-PARAM_KEY .
    MODULE LISTE_UPDATE_LISTE.
   ENDCHAIN.
 ENDLOOP.
 MODULE LISTE_AFTER_LOOP.
