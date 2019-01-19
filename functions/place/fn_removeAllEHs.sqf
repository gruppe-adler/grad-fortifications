(findDisplay 46) displayRemoveEventHandler ["MouseZChanged",grad_fortifications_mousewheelEH];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonUp",grad_fortifications_mousebuttonEH];
(findDisplay 46) displayRemoveEventHandler ["KeyDown",grad_fortifications_keydownEH];
(findDisplay 46) displayRemoveEventHandler ["KeyUp",grad_fortifications_keyupEH];

[grad_fortifications_updatePFH] call CBA_fnc_removePerFrameHandler;
[grad_fortifications_checkCollisionPFH] call CBA_fnc_removePerFrameHandler;

ACE_player removeAction grad_fortifications_fireOverride;
