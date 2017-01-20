params ["_type",["_mode","NORMAL"]];

if (_type == "") exitWith {};

_fort = [_type] call grad_fortifications_fnc_spawnFortification;
_size = [_type] call grad_fortifications_fnc_getObjectSize;

player setVariable ["grad_fortifications_currentType", _type];
player setVariable ["grad_fortifications_currentFort", _fort];
player setVariable ["grad_fortifications_currentMode", _mode];
player setVariable ["grad_fortifications_currentSize", _size];
player setVariable ["grad_fortifications_currentDistance", (((_size*2.5)^(1/2)) max 2)];
player setVariable ["grad_fortifications_currentDirection", 0];
player setVariable ["grad_fortifications_currentHeight",0];

_boundingLines = [_fort] call grad_fortifications_fnc_getBoundingLines;
_visualLines = [_fort] call grad_fortifications_fnc_getVisualLines;
_groundLines = [_fort] call grad_fortifications_fnc_getGroundLines;
[_visualLines,_boundingLines,_groundLines,_fort] call grad_fortifications_fnc_checkCollisionPFH;

/*hideObjectGlobal _fort;*/

[player,_fort] call grad_fortifications_fnc_addUpdatePFH;
[] call grad_fortifications_fnc_addMouseEHs;
[] call grad_fortifications_fnc_addKeyEHs;

["Place", "Cancel"] call ace_interaction_fnc_showMouseHint;
