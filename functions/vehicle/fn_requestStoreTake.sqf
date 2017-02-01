#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_mode"];

_dialog = findDisplay grad_fortifications_DIALOG;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
_vehicleListCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLIST;

_selectedContainer = player getVariable ["grad_fortifications_ui_lastSelectedContainer", player];
_currentContainer = player getVariable ["grad_fortifications_currentContainer", player];
_type = if (_selectedContainer == player) then {
    _curSel = lnbCurSelRow _listCtrl;
    _listCtrl lnbData [_curSel,0]
} else {
    _curSel = lnbCurSelRow _vehicleListCtrl;
    _vehicleListCtrl lnbData [_curSel,0]
};

if (_type == "") exitWith {};

switch (_mode) do {
    case ("TAKE"): {
        [player,_currentContainer,_type,"TAKE"] remoteExec ["grad_fortifications_fnc_respondStoreTake",2,false];
    };
    case ("STORE"): {
        [player,_type] call grad_fortifications_fnc_removeFort;
        [player,_currentContainer,_type,"STORE"] remoteExec ["grad_fortifications_fnc_respondStoreTake",2,false];
    };
};
