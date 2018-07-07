private _action = [] call grad_fortifications_fnc_storageAction;

if (([(missionConfigFile >> "CfgGradFortifications" >> "canStoreInLandVehicles"),"number",1] call CBA_fnc_getConfigEntry) == 1) then {
    ["LandVehicle",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
if (([(missionConfigFile >> "CfgGradFortifications" >> "canStoreInShips"),"number",1] call CBA_fnc_getConfigEntry) == 1) then {
    ["Ship",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
if (([(missionConfigFile >> "CfgGradFortifications" >> "canStoreInHelicopters"),"number",1] call CBA_fnc_getConfigEntry) == 1) then {
    ["Helicopter",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
if (([(missionConfigFile >> "CfgGradFortifications" >> "canStoreInPlanes"),"number",1] call CBA_fnc_getConfigEntry) == 1) then {
    ["Plane",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
if (([(missionConfigFile >> "CfgGradFortifications" >> "canStoreInContainers"),"number",1] call CBA_fnc_getConfigEntry) == 1) then {
    ["ThingX",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
