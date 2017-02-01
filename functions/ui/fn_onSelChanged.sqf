#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_control","_curSel"];
private ["_selectedContainer","_targetContainer"];

if (_curSel < 0) exitWith {};

_dialog = findDisplay grad_fortifications_DIALOG;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
_vehicleListCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLIST;

_type = _control lnbData [_curSel,0];
[_control,_type] call grad_fortifications_fnc_updateModel;

if (_control == _listCtrl) then {
    _selectedContainer = player;
    _targetContainer = player getVariable ["grad_fortifications_currentContainer",player];
} else {
    _selectedContainer = player getVariable ["grad_fortifications_currentContainer",player];
    _selectedContainer setVariable ["grad_fortifications_ui_lastSelectedItem", _curSel];
    _targetContainer = player;
};

//save last category selection
player setVariable ["grad_fortifications_ui_lastSelectedContainer", _selectedContainer];
player setVariable ["grad_fortifications_ui_lastSelectedItem", _curSel];

if (!isNull _vehicleListCtrl) then {
    _type = if (player == _selectedContainer) then {_listCtrl lnbData [_curSel,0]} else {_vehicleListCtrl lnbData [_curSel,0]};
    _canTakeStore = [_targetContainer,_type] call grad_fortifications_fnc_canTake;

    [_canTakeStore] call grad_fortifications_fnc_updateButtons;
    [_selectedContainer,_canTakeStore] call grad_fortifications_fnc_updateListTitles;

    if (_selectedContainer == player) then {_vehicleListCtrl lnbSetCurSelRow -1} else {_listCtrl lnbSetCurSelRow -1};
};
