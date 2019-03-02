grad_fortifications_canDemolishDefault = ([(missionConfigFile >> "CfgGradFortifications" >> "canDemolishDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
grad_fortifications_canPackUpDefault = ([(missionConfigFile >> "CfgGradFortifications" >> "canPackUpDefault"),"number",1] call CBA_fnc_getConfigEntry) == 1;
grad_fortifications_buildTimeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "buildTimeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_demolishTimeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "demolishTimeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_packUpTimeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "packUpTimeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_playerInventorySize = [(missionConfigFile >> "CfgGradFortifications" >> "playerInventorySize"),"number",70] call CBA_fnc_getConfigEntry;
grad_fortifications_boundingBoxSizeFactor = [(missionConfigFile >> "CfgGradFortifications" >> "boundingBoxSizeFactor"),"number",1] call CBA_fnc_getConfigEntry;
grad_fortifications_vehicleInventorySizeFactor = ([(missionConfigFile >> "CfgGradFortifications" >> "vehicleInventorySizeFactor"),"number",1] call CBA_fnc_getConfigEntry) max 0;
grad_fortifications_fortificationOwnerType = [(missionConfigFile >> "CfgGradFortifications" >> "fortificationOwner"),"text","BUILDER"] call CBA_fnc_getConfigEntry;
