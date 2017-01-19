params ["_unit", "_fort"];

_currentDirection = _unit getVariable ["grad_fortifications_currentDirection",0];
_dir = (getDir _unit) + _currentDirection;
_fort setDir _dir;

_dir
