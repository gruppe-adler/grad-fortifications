#include "..\..\dialog\menu\defines.hpp"

disableSerialization;
createDialog "grad_fortifications";
_dialog = findDisplay grad_fortifications_DIALOG;
_modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;

[_dialog,_listCtrl] call grad_fortifications_fnc_updateItemList;
[_modelCtrl] call grad_fortifications_fnc_rotateModel;
