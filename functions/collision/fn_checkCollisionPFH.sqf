grad_fortifications_checkCollisionPFH = [{
    params ["_args", "_handle"];
    _args params ["_visualLines","_boundingLines","_groundLines","_fort","_canFloat","_canCollide"];

    if (isNull _fort) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    _visualLinesWorld = [_visualLines,_fort] call grad_fortifications_fnc_linesToWorld;
    _boundingLinesWorld = [_boundingLines,_fort] call grad_fortifications_fnc_linesToWorld;
    _groundLinesWorld = [_groundLines,_fort] call grad_fortifications_fnc_linesToWorld;

    _isOnGround = if (_canFloat) then {true} else {[_groundLinesWorld,_fort] call grad_fortifications_fnc_isOnGround};

    player setVariable ["grad_fortifications_isColliding",false];
    player setVariable ["grad_fortifications_isOnGround",_isOnGround];
    {
        _isColliding = if (_canCollide) then {false} else {[_x,_fort] call grad_fortifications_fnc_isColliding};

        _color = [0,1,0,1];
        if (_isColliding) then {
            _color = [1,0,0,1];
            player setVariable ["grad_fortifications_isColliding",true];
            ["COLLIDING"] call grad_fortifications_fnc_updateHint;
        };

        if (!_isOnGround) then {
            _color = [1,1,0,1];
            ["FLOATING"] call grad_fortifications_fnc_updateHint;
        };

        if (!_isColliding && _isOnGround) then {
            ["CANPLACE"] call grad_fortifications_fnc_updateHint;
        };

        if (missionNamespace getVariable ["grad_fortifications_collisionDebugMode",false]) then {
            drawLine3D [_x select 0, _x select 1, _color];
        } else {
            _visualLine = _visualLinesWorld select _forEachIndex;
            drawLine3D [_visualLine select 0, _visualLine select 1, _color];
        };
    } forEach _boundingLinesWorld;

    if (missionNamespace getVariable ["grad_fortifications_collisionDebugMode",false]) then {
        _color = if (!_isOnGround) then {[1,1,0,1]} else {[0,1,0,1]};
        {
            drawLine3D [_x select 0,_x select 1,_color];
        } forEach _groundLinesWorld;
    };
},0,_this] call CBA_fnc_addPerFrameHandler;

grad_fortifications_checkCollisionPFH
