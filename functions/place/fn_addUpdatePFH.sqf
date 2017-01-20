grad_fortifications_updatePFH = [{
    params ["_args", "_handle"];
    _args params ["_unit", "_fort", "_surfaceNormal"];

    if (isNull _fort || !alive _unit || currentWeapon _unit != "") exitWith {[] call grad_fortifications_fnc_cancelPlacement};

    [_unit, _fort] call grad_fortifications_fnc_setPosition;
    [_unit, _fort] call grad_fortifications_fnc_setDirection;
    [_unit, _fort, _surfaceNormal] call grad_fortifications_fnc_setUp;

},0,_this] call CBA_fnc_addPerFrameHandler;


grad_fortifications_updatePFH
