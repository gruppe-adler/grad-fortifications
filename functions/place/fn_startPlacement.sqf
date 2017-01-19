params ["_type",["_mode","NORMAL"]];

if (_type == "") exitWith {};

_fort = [_type] call grad_fortifications_fnc_spawnFortification;

player setVariable ["grad_fortifications_currentType", _type];
player setVariable ["grad_fortifications_currentFort", _fort];
player setVariable ["grad_fortifications_currentMode", _mode];
player setVariable ["grad_fortifications_currentSize", [_type] call grad_fortifications_fnc_getObjectSize];
player setVariable ["grad_fortifications_currentDistance", 4];
player setVariable ["grad_fortifications_currentDirection", 0];

_lines = [_fort] call grad_fortifications_fnc_getBoundingLines;
[_lines,_fort] call grad_fortifications_fnc_checkCollisionPFH;

[player,_fort] call grad_fortifications_fnc_addUpdatePFH;
[] call grad_fortifications_fnc_addMouseEHs;
[] call grad_fortifications_fnc_addKeyEHs;

["Place", "Cancel"] call ace_interaction_fnc_showMouseHint;
