#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_mode"];

private _dialog = findDisplay grad_fortifications_DIALOG;
private _listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
private _vehicleListCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLIST;

private _builder = ACE_player;

private _selectedContainer = _builder getVariable ["grad_fortifications_ui_lastSelectedContainer", _builder];
private _currentContainer = _builder getVariable ["grad_fortifications_currentContainer", _builder];
private _type = if (_selectedContainer == _builder) then {
    _curSel = lnbCurSelRow _listCtrl;
    _listCtrl lnbData [_curSel,0]
} else {
    _curSel = lnbCurSelRow _vehicleListCtrl;
    _vehicleListCtrl lnbData [_curSel,0]
};

if (_type == "") exitWith {};

switch (_mode) do {
    case ("TAKE"): {
        [_builder,_currentContainer,_type,"TAKE"] remoteExec ["grad_fortifications_fnc_respondStoreTake",2,false];
    };
    case ("STORE"): {
        [_builder,_type] call grad_fortifications_fnc_removeFort;
        [_builder,_currentContainer,_type,"STORE"] remoteExec ["grad_fortifications_fnc_respondStoreTake",2,false];
    };
};
