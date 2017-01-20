params ["_unit", "_fort"];

_currentDistance = _unit getVariable ["grad_fortifications_currentDistance",3];
_pos = _unit getRelPos [_currentDistance,0];
_pos set [2, (_unit getVariable ["grad_fortifications_currentHeight",0]) + (getPosATL _unit select 2)];

_fort setPos _pos;

_pos
