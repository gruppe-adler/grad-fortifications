if (hasInterface) then {
    player setVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate];

    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    _action = ["grad_fortifications_mainBuildAction", "Fortifications", _moduleRoot + "\data\sandbags.paa", {[] call grad_fortifications_fnc_loadFortDialog}, {vehicle player == player && count ((player getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0 && !(player getVariable ["grad_fortifications_isPlacing", false])}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
