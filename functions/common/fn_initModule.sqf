grad_fortifications_canDemolishDefault = ([(missionConfigFile >> "CfgGradFortifications" >> "canDemolishDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
grad_fortifications_canPackUpDefault = ([(missionConfigFile >> "CfgGradFortifications" >> "canPackUpDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
grad_fortifications_buildTimeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "buildTimeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_demolishTimeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "demolishTimeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_packUpTimeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "packUpTimeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_playerInventorySize = [(missionConfigFile >> "CfgGradFortifications" >> "playerInventorySize"),"number",70] call CBA_fnc_getConfigEntry;
grad_fortifications_boundingBoxSizeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "boundingBoxSizeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_vehicleInventorySizeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "vehicleInventorySizeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_fortificationOwnerType = [(missionConfigFile >> "CfgGradFortifications" >> "fortificationOwner"),"text","BUILDER"] call CBA_fnc_getConfigEntry;

if (hasInterface) then {
    if (isNil {player getVariable "grad_fortifications_myFortsHash"}) then {player setVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]};
    if (isNil {player getVariable "grad_fortifications_inventorySize"}) then {player setVariable ["grad_fortifications_inventorySize",grad_fortifications_playerInventorySize]};
    if (isNil {player getVariable "grad_fortifications_inventoryCargo"}) then {player setVariable ["grad_fortifications_inventoryCargo",0, true]};

    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;
    [] call grad_fortifications_fnc_addVehicleInteractions;
    _action = ["grad_fortifications_mainBuildAction", "Fortifications", _moduleRoot + "\data\sandbags.paa", {[grad_fortifications_fnc_loadFortDialog,[_this select 0, _this select 1]] call CBA_fnc_execNextFrame}, {vehicle player == player && count ((player getVariable ["grad_fortifications_myFortsHash",[[],0] call CBA_fnc_hashCreate]) select 1) > 0 && !(player getVariable ["grad_fortifications_isPlacing", false])}] call ace_interact_menu_fnc_createAction;
    ["CAManBase",1,["ACE_SelfActions","ACE_Equipment"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
