params ["_caller","_container"];

if (player != _caller) exitWith {};
[_container] call grad_fortifications_fnc_updateItemList;
