grad_fortifications_mousewheelEH = (findDisplay 46) displayAddEventHandler ["MouseZChanged", {
    params ["_control","_wheelChange"];

    switch (true) do {
        case (player getVariable ["grad_fortifications_shiftDown",false]): {
            _currentDir = player getVariable ["grad_fortifications_currentDirection",0];
            _newDirection = _currentDir + _wheelChange*2;
            player setVariable ["grad_fortifications_currentDirection", _newDirection];
        };
        case (player getVariable ["grad_fortifications_ctrlDown",false]): {
            _currentHeight = player getVariable ["grad_fortifications_currentHeight",0];
            _newHeight = ((_currentHeight + _wheelChange/35) max -0.5) min 3;
            player setVariable ["grad_fortifications_currentHeight",_newHeight];
        };
        default {
            _currentDistance = player getVariable ["grad_fortifications_currentDistance",4],
            _size = player getVariable ["grad_fortifications_currentSize",1];
            _newDistance = ((_currentDistance + _wheelChange/5) max (((_size*2)^(1/2)) max 2)) min ((_size*6)^(1/2));
            player setVariable ["grad_fortifications_currentDistance",_newDistance];
        };
    };

    true
}];

grad_fortifications_mousebuttonEH = (findDisplay 46) displayAddEventHandler ["MouseButtonUp", {
    params ["_control","_button"];

    if !(_button in [0,1]) exitWith {};

    switch (true) do {
        case (_button == 0): {
            [] call grad_fortifications_fnc_placeFortification;
        };
        case (_button == 1): {
            [] call grad_fortifications_fnc_cancelPlacement;
        };
    };

    true
}];

grad_fortifications_fireOverride = player addAction ["", {true}, "", 0, false, true, "DefaultAction", "true"];
