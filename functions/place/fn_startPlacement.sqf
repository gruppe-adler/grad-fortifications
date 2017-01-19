params ["_type"];

_fort = [_type] call grad_fortifications_fnc_spawnFortification;

player setVariable ["grad_fortifications_currentFort", _fort];
player setVariable ["grad_fortifications_currentDistance", 4];
player setVariable ["grad_fortifications_currentDirection", 0];

[player,_fort] call grad_fortifications_fnc_addUpdatePFH;
[] call grad_fortifications_fnc_addMouseEHs;
[] call grad_fortifications_fnc_addKeyEHs;

["Place", "Cancel"] call ace_interaction_fnc_showMouseHint;
