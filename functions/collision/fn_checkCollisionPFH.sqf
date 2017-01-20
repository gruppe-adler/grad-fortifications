grad_fortifications_checkCollisionPFH = [{
    params ["_args", "_handle"];
    _args params ["_visualLines","_boundingLines","_groundLines","_fort"];

    if (isNull _fort) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    _visualLinesWorld = [_visualLines,_fort] call grad_fortifications_fnc_linesToWorld;
    _boundingLinesWorld = [_boundingLines,_fort] call grad_fortifications_fnc_linesToWorld;
    _groundLinesWorld = [_groundLines,_fort] call grad_fortifications_fnc_linesToWorld;

    _isOnGround = [_groundLinesWorld,_fort] call grad_fortifications_fnc_isOnGround;

    player setVariable ["grad_fortifications_isColliding",false];
    player setVariable ["grad_fortifications_isOnGround",_isOnGround];
    {
        _color = [0,1,0,1];
        if ([_x,_fort] call grad_fortifications_fnc_isColliding) then {
            _color = [1,0,0,1];
            player setVariable ["grad_fortifications_isColliding",true];
        };

        if (!_isOnGround) then {
            _color = [1,1,0,1];
        };

        _visualLine = _visualLinesWorld select _forEachIndex;
        drawLine3D [_visualLine select 0, _visualLine select 1, _color];
    } forEach _boundingLinesWorld;
},0,_this] call CBA_fnc_addPerFrameHandler;

grad_fortifications_checkCollisionPFH
