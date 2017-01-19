params ["_crate","_type"];

if (isNil "_crate") exitWith {};
if (isNull _crate) exitWith {};

_crate setVariable ["grad_fortifications_dropCrate_type", _type];

_displayName = [_type] call grad_fortifications_fnc_getDisplayName;
_pickUpName = format ["Pick up (%1)", _displayName];
_buildName = format ["Build (%1)", _displayName];

_action = ["grad_fortifications_pickupAction", _pickUpName, "", {[_this select 1,(_this select 0) getVariable ["grad_fortifications_dropCrate_type",""],1] call grad_fortifications_fnc_addFort; deleteVehicle (_this select 0)}, {true}] call ace_interact_menu_fnc_createAction;
[_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["grad_fortifications_buildAction", _buildName, "", {[(_this select 0) getVariable ["grad_fortifications_dropCrate_type",""],"DROPPED"] call grad_fortifications_fnc_startPlacement; deleteVehicle (_this select 0)}, {true}] call ace_interact_menu_fnc_createAction;
[_crate, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
