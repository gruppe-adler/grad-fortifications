params ["_unit","_type",["_amount",1],["_showMessage",false]];

_inventoryCargo = _unit getVariable ["grad_fortifications_inventoryCargo",0];
_inventorySpace = (_unit getVariable ["grad_fortifications_inventorySize",[_unit] call grad_fortifications_fnc_getVehicleInventorySize]) - _inventoryCargo;
_size = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "size"),"number",[_type] call grad_fortifications_fnc_getObjectSize] call CBA_fnc_getConfigEntry;

_canTake = if ((_size*_amount) > _inventorySpace) then {false} else {true};

if (_showMessage && !_canTake) then {
    systemChat format ["Not enough space in inventory: (%1/%2) - required: %3", round _inventoryCargo,_inventorySpace,round _size];
};

_canTake
