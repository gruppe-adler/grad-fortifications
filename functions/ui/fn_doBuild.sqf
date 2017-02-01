#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_mode"];

disableSerialization;
_dialog = findDisplay grad_fortifications_DIALOG;
_modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
_vehicleListCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLIST;

_container = player getVariable ["grad_fortifications_currentContainer", objNull];
if (isNil "_mode") then {
    if (player getVariable ["grad_fortifications_ui_lastSelectedContainer", player] == player) then {
        _mode = "NORMAL";
    } else {
        _mode = "DROPPED";
    };
};

_type = if (!isNull _vehicleListCtrl && (player getVariable ["grad_fortifications_ui_lastSelectedContainer", player] != player)) then {
    _curSelID = lnbCurSelRow _vehicleListCtrl;
    _vehicleListCtrl lnbData [_curSelID,0]
} else {
    _curSelID = lnbCurSelRow _listCtrl;
    _listCtrl lnbData [_curSelID,0]
};

if (_mode == "DROPPED" && player != _container) then {
    [player,_container,_type,"BUILD"] remoteExec ["grad_fortifications_fnc_respondStoreTake",2,false];
} else {
    [_type,_mode] call grad_fortifications_fnc_startPlacement;
};
