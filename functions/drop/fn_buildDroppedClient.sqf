params ["_unit","_fortType"];

if (player != _unit) exitWith {};

[_fortType,"DROPPED"] call grad_fortifications_fnc_startPlacement;
