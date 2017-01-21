grad_fortifications_canDemolishDefault = ([(missionConfigFile >> "CfgGradFortifications" >> "canDemolishDefault"),"number",0] call CBA_fnc_getConfigEntry) == 1;
grad_fortifications_demolishTimeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "demolishTimeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_inventorySize = [(missionConfigFile >> "CfgGradFortifications" >> "inventorySize"),"number",999999] call CBA_fnc_getConfigEntry;

if (hasInterface) then {
    player setVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate];
    player setVariable ["grad_fortifications_inventoryCargo",0, true];

    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    _action = ["grad_fortifications_mainBuildAction", "Fortifications", _moduleRoot + "\data\sandbags.paa", {[] call grad_fortifications_fnc_loadFortDialog}, {vehicle player == player && count ((player getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0 && !(player getVariable ["grad_fortifications_isPlacing", false])}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
