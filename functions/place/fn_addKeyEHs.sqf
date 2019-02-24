grad_fortifications_keydownEH = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    params ["_control","_DIK"];

    private _builder = ACE_player;

    switch (true) do {
        case (_DIK in [42,54]): {
            _builder setVariable ["grad_fortifications_shiftDown",true];
        };
        case (_DIK in [29,157]): {
            _builder setVariable ["grad_fortifications_ctrlDown",true];
        };
        case (_DIK in [56,184]): {
            _builder setVariable ["grad_fortifications_altDown",true];
        };
    };

    _return = if (_DIK in [42,54,29,157,56,184,15]) then {
        true
    } else {
        false
    };

    _return
}];

grad_fortifications_keyupEH = (findDisplay 46) displayAddEventHandler ["KeyUp", {
    params ["_control","_DIK"];

    private _builder = ACE_player;

    switch (true) do {
        case (_DIK in [42,54]): {
            _builder setVariable ["grad_fortifications_shiftDown",false];
        };
        case (_DIK in [29,157]): {
            _builder setVariable ["grad_fortifications_ctrlDown",false];
        };
        case (_DIK in [56,184]): {
            _builder setVariable ["grad_fortifications_altDown",false];
        };
        case (_DIK == 15): {
            if !(_builder getVariable ["grad_fortifications_surfaceNormalForced",false]) then {
                _builder setVariable ["grad_fortifications_surfaceNormal",!(_builder getVariable ["grad_fortifications_surfaceNormal",true])];
            };
        };
    };

    _return = if (_DIK in [42,54,29,157,56,184,15]) then {
        true
    } else {
        false
    };

    _return
}];
