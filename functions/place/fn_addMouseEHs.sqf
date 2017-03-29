grad_fortifications_mousewheelEH = (findDisplay 46) displayAddEventHandler ["MouseZChanged", {
    params ["_control","_wheelChange"];

    _accelFactor = if (player getVariable ["grad_fortifications_altDown",false]) then {3} else {1};

    switch (true) do {
        case (player getVariable ["grad_fortifications_shiftDown",false]): {
            _currentDir = player getVariable ["grad_fortifications_currentDirection",0];
            _newDirection = _currentDir + _wheelChange*_accelFactor;
            player setVariable ["grad_fortifications_currentDirection", _newDirection];
        };

        case (player getVariable ["grad_fortifications_ctrlDown",false]): {
            _currentHeight = player getVariable ["grad_fortifications_currentHeight",0];
            _newHeight = ((_currentHeight + (_wheelChange/45)*_accelFactor) max -0.8) min 3;
            player setVariable ["grad_fortifications_currentHeight",_newHeight];
        };

        default {
            _currentDistance = player getVariable ["grad_fortifications_currentDistance",4],
            _size = player getVariable ["grad_fortifications_currentSize",1];
            _newDistance = ((_currentDistance + (_wheelChange/20)*_accelFactor) max (((_size*2)^(1/2)) max 2)) min ((_size*6)^(1/2));
            player setVariable ["grad_fortifications_currentDistance",_newDistance];
        };
    };

    false
}];

grad_fortifications_mousebuttonEH = (findDisplay 46) displayAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];

    if !(_button in [0,1]) exitWith {};

    if (_button == 0) then {
        [] call grad_fortifications_fnc_placeFortification;
    };

    if (_button == 1) then {
        [] call grad_fortifications_fnc_cancelPlacement;
    };

    false
}];

grad_fortifications_fireOverride = player addAction ["", {true}, "", 0, false, true, "DefaultAction", "true"];
