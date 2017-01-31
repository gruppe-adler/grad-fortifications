/*  Updates itemlist based on chosen category
*
*/

#define PREFIX grad
#define COMPONENT fortifications
#include "\x\cba\addons\main\script_macros_mission.hpp"

#include "..\..\dialog\menu\defines.hpp"
params [["_container",player]];
disableSerialization;

if (player getVariable ["grad_fortifications_currentContainer", player] != _container) exitWith {};

_dialog = findDisplay grad_fortifications_DIALOG;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
if (isNull _listCtrl) exitWith {};

if !([_container getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]] call CBA_fnc_isHash) exitWith {ERROR("Container does not have myFortsHash.")};

_myFortsHash = _container getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate];;

lnbClear _listCtrl;
_listIndex = 0;
_updateList = {
    _displayName = [_key] call grad_fortifications_fnc_getDisplayName;

    if (_value > 0) then {
        _listCtrl lnbAddRow [str _value, _displayName];
        _listCtrl lnbSetData [[_listIndex,0], _key];
        _listIndex = _listIndex + 1;
    };
};
[_myFortsHash, _updateList] call CBA_fnc_hashEachPair;

_itemCount = lnbSize _listCtrl select 0;
if (_itemCount == 0) exitWith {closeDialog grad_fortifications_DIALOG};

_lastSelected = player getVariable ["grad_fortifications_ui_lastSelectedItem",0];
if (_itemCount > _lastSelected) then {
    _listCtrl lnbSetCurSelRow _lastSelected
} else {
    _listCtrl lnbSetCurSelRow 0;
};
