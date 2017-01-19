grad_fortifications_keydownEH = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    params ["_control","_DIK"];
    switch (true) do {
        case (_DIK in [42,54]): {
            player setVariable ["grad_fortifications_shiftDown",true];
        };
        case (_DIK in [29,157]): {
            player setVariable ["grad_fortifications_ctrlDown",true];
        };
        case (_DIK in [56,184]): {
            player setVariable ["grad_fortifications_altDown",true];
        };
    };

    false
}];

grad_fortifications_keyupEH = (findDisplay 46) displayAddEventHandler ["KeyUp", {
    params ["_control","_DIK"];
    switch (true) do {
        case (_DIK in [42,54]): {
            player setVariable ["grad_fortifications_shiftDown",false];
        };
        case (_DIK in [29,157]): {
            player setVariable ["grad_fortifications_ctrlDown",false];
        };
        case (_DIK in [56,184]): {
            player setVariable ["grad_fortifications_altDown",false];
        };
    };

    false
}];
