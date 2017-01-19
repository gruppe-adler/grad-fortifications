params ["_unit", "_fort"];

_currentDistance = _unit getVariable ["grad_fortifications_currentDistance",4];
_pos = _unit getRelPos [_currentDistance,0];
_fort setPos _pos;

_pos
