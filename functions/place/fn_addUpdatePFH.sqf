grad_fortifications_updatePFH = [{
    params ["_args", "_handle"];
    _args params ["_unit", "_fort"];

    if (isNull _fort) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};
    if (!alive _unit) exitWith {deleteVehicle _fort; [_handle] call CBA_fnc_removePerFrameHandler};

    [_unit, _fort] call grad_fortifications_fnc_setPosition;
    [_unit, _fort] call grad_fortifications_fnc_setDirection;

},0,_this] call CBA_fnc_addPerFrameHandler;


grad_fortifications_updatePFH