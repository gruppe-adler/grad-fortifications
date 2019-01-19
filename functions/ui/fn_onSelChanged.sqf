#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_control","_curSel"];
private ["_selectedContainer","_targetContainer"];

if (_curSel < 0) exitWith {};

private _builder = ACE_player;
private _dialog = findDisplay grad_fortifications_DIALOG;
private _listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
private _vehicleListCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLIST;

private _type = _control lnbData [_curSel,0];
[_control,_type] call grad_fortifications_fnc_updateModel;

if (_control == _listCtrl) then {
    _selectedContainer = _builder;
    _targetContainer = _builder getVariable ["grad_fortifications_currentContainer",_builder];
} else {
    _selectedContainer = _builder getVariable ["grad_fortifications_currentContainer",_builder];
    _selectedContainer setVariable ["grad_fortifications_ui_lastSelectedItem", _curSel];
    _targetContainer = _builder;
};

//save last category selection
_builder setVariable ["grad_fortifications_ui_lastSelectedContainer", _selectedContainer];
_builder setVariable ["grad_fortifications_ui_lastSelectedItem", _curSel];

if (!isNull _vehicleListCtrl) then {
    _type = if (_builder == _selectedContainer) then {_listCtrl lnbData [_curSel,0]} else {_vehicleListCtrl lnbData [_curSel,0]};
    _canTakeStore = [_targetContainer,_type] call grad_fortifications_fnc_canTake;

    [_canTakeStore,_builder] call grad_fortifications_fnc_updateButtons;
    [_selectedContainer,_canTakeStore] call grad_fortifications_fnc_updateListTitles;

    if (_selectedContainer == _builder) then {_vehicleListCtrl lnbSetCurSelRow -1} else {_listCtrl lnbSetCurSelRow -1};
};
