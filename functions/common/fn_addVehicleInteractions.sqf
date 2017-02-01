_moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;

_condition = {
    !(locked (_this select 0) in [2,3]) &&
    vehicle player == player &&
    !(player getVariable ["grad_fortifications_isPlacing", false]) &&
    {([(missionConfigFile >> "CfgGradFortifications" >> "Vehicles" >> typeOf (_this select 0) >> "isStorage"),"number",1] call CBA_fnc_getConfigEntry) == 1} &&
    {
        (count (((_this select 0) getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0) ||
        (count (((_this select 1) getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0)
    }
};
_onActivate = {
    [grad_fortifications_fnc_loadVehicleDialog,[_this select 0, _this select 1]] call CBA_fnc_execNextFrame;
};
_action = ["grad_fortifications_containerBuildAction", "Fortifications", _moduleRoot + "\data\sandbags.paa",_onActivate,_condition] call ace_interact_menu_fnc_createAction;
["LandVehicle",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
["Ship",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
["Helicopter",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
["Plane",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
