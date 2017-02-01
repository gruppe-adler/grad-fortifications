#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_selectedContainer","_canTakeStore"];

disableSerialization;
_dialog = findDisplay grad_fortifications_DIALOG;
_vehicleTitleCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLISTTITLEVEHICLE;
_myTitleCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLISTTITLE;

_interactedContainer = player getVariable ["grad_fortifications_currentContainer", objNull];
_displayName = toUpper ([configFile >> "CfgVehicles" >> (typeOf _interactedContainer) >> "displayName", "text", ""] call CBA_fnc_getConfigEntry);

if (player == _selectedContainer) then {
    _myTitleCtrl ctrlSetText (toUpper profileName);
    _vehicleTitleCtrl ctrlSetText (if (_canTakeStore) then {_displayName} else {_displayName + " (NO SPACE)"});
} else {
    _vehicleTitleCtrl ctrlSetText _displayName;
    _myTitleCtrl ctrlSetText (if (_canTakeStore) then {toUpper profileName} else {toUpper profileName + " (NO SPACE)"});
};
