#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_mode"];

disableSerialization;
private _dialog = findDisplay grad_fortifications_DIALOG;
private _modelCtrl = _dialog displayCtrl grad_fortifications_3DMODEL;
private _listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
private _vehicleListCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLIST;
private _builder = ACE_player;


private _container = _builder getVariable ["grad_fortifications_currentContainer", objNull];
if (isNil "_mode") then {
    if (_builder getVariable ["grad_fortifications_ui_lastSelectedContainer", _builder] == _builder) then {
        _mode = "NORMAL";
    } else {
        _mode = "DROPPED";
    };
};

_type = if (!isNull _vehicleListCtrl && (_builder getVariable ["grad_fortifications_ui_lastSelectedContainer", _builder] != _builder)) then {
    _curSelID = lnbCurSelRow _vehicleListCtrl;
    _vehicleListCtrl lnbData [_curSelID,0]
} else {
    _curSelID = lnbCurSelRow _listCtrl;
    _listCtrl lnbData [_curSelID,0]
};

if (_mode == "DROPPED" && _builder != _container) then {
    [_builder,_container,_type,"BUILD"] remoteExec ["grad_fortifications_fnc_respondStoreTake",2,false];
} else {
    [_type,_mode,_builder,_container] call grad_fortifications_fnc_startPlacement;
};
