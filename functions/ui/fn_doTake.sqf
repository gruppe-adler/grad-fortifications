#include "..\..\dialog\menu\defines.hpp"

disableSerialization;
_dialog = findDisplay grad_fortifications_DIALOG;
_modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;

_curSelID = lnbCurSelRow _listCtrl;
_type = _listCtrl lnbData [_curSelID,0];
_container = player getVariable ["grad_fortifications_currentContainer", objNull];

[_container,_type] call grad_fortifications_fnc_removeFort;
[player,_type] call grad_fortifications_fnc_addFort;
[_container] call grad_fortifications_fnc_updateItemList;
