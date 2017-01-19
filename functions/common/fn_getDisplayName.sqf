params ["_type"];

_displayName = [configfile >> "CfgVehicles" >> _type >> "displayName","text","UNKNOWN ITEM"] call CBA_fnc_getConfigEntry;

_displayName
