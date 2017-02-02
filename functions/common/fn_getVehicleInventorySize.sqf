params ["_unit"];

_size = [(missionConfigFile >> "CfgGradFortifications" >> "Vehicles" >> typeOf _unit >> "vehicleInventorySize"),"number",-1] call CBA_fnc_getConfigEntry;
if (_size < 0) then {
    _size = grad_fortifications_vehicleInventorySizeFactor * 15 * ([(configFile >> "CfgVehicles" >> typeOf _unit >> "ace_cargo_space"),"number",0] call CBA_fnc_getConfigEntry);
};

_size
