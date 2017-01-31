#include "..\..\dialog\menu\defines.hpp"

params ["_mode"];

disableSerialization;
_dialog = findDisplay grad_fortifications_DIALOG;
_modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;

_curSelID = lnbCurSelRow _listCtrl;
_type = _listCtrl lnbData [_curSelID,0];

_container = player getVariable ["grad_fortifications_currentContainer", objNull];
if (_mode == "DROPPED" && player != _container) then {
    [_container,_type] call grad_fortifications_fnc_removeFort;
};

[_type,_mode] call grad_fortifications_fnc_startPlacement;
