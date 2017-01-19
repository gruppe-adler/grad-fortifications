grad_fortifications_mousewheelEH = (findDisplay 46) displayAddEventHandler ["MouseZChanged", {
    params ["_control","_wheelChange"];

    switch (true) do {
        case (player getVariable ["grad_fortifications_shiftDown",false]): {
            _currentDir = player getVariable ["grad_fortifications_currentDirection",0];
            _newDirection = _currentDir + _wheelChange*2;
            player setVariable ["grad_fortifications_currentDirection", _newDirection];
        };
        case (player getVariable ["grad_fortifications_ctrlDown",false]): {

        };
        case (player getVariable ["grad_fortifications_altDown",false]): {

        };
        default {
            _currentDistance = player getVariable ["grad_fortifications_currentDistance",4],
            _newDistance = ((_currentDistance + _wheelChange/3) max 2) min 10;
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
