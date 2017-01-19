grad_fortifications_checkCollisionPFH = [{
    params ["_args", "_handle"];
    _args params ["_lines","_fort"];;

    if (isNull _fort) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    _linesWorld = [_lines,_fort] call grad_fortifications_fnc_linesToWorld;
    player setVariable ["grad_fortifications_isColliding",false];
    {
        _color = [0,1,0,1];
        if ([_x,_fort] call grad_fortifications_fnc_isColliding) then {
            _color = [1,0,0,1];
            player setVariable ["grad_fortifications_isColliding",true];
        };
        drawLine3D [_x select 0, _x select 1, _color];
    } forEach _linesWorld;
},0,_this] call CBA_fnc_addPerFrameHandler;

grad_fortifications_checkCollisionPFH
