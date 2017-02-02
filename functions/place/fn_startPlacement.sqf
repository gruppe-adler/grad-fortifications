params ["_type",["_mode","NORMAL"],["_builder",player]];

if (_type == "") exitWith {};
if (player != _builder) exitWith {};

_boundingBoxSize = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "boundingBoxSize"),"number",1] call CBA_fnc_getConfigEntry;
_canFloat = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "canFloat"),"number",0] call CBA_fnc_getConfigEntry) == 1;
_canCollide = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "canCollide"),"number",0] call CBA_fnc_getConfigEntry) == 1;
_surfaceNormal = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "surfaceNormal"),"number",1] call CBA_fnc_getConfigEntry) == 1;

_moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;

_fort = _type createVehicleLocal [0,0,0];
_size = [_type] call grad_fortifications_fnc_getObjectSize;
_fort allowDamage false;
_fort enableSimulation false;
_fort disableCollisionWith player;

if (missionNamespace getVariable ["grad_fortifications_collisionDebugMode",false]) then {
    _fort hideObject true;
};

player setVariable ["grad_fortifications_isPlacing", true];
player setVariable ["grad_fortifications_currentType", _type];
player setVariable ["grad_fortifications_currentFort", _fort];
player setVariable ["grad_fortifications_currentMode", _mode];
player setVariable ["grad_fortifications_currentSize", _size];
player setVariable ["grad_fortifications_currentDistance", (((_size*2.5)^(1/2)) max 2)];
player setVariable ["grad_fortifications_currentDirection", 0];
player setVariable ["grad_fortifications_currentHeight",-0.1];
player setVariable ["grad_fortifications_surfaceNormal",_surfaceNormal];

player call ace_common_fnc_fixLoweredRifleAnimation;
player action ["SwitchWeapon", player, player, 99];
player forceWalk true;

[true,_surfaceNormal] call grad_fortifications_fnc_openHint;

_boundingLines = [_fort,_boundingBoxSize] call grad_fortifications_fnc_getBoundingLines;
_visualLines = [_fort] call grad_fortifications_fnc_getVisualLines;
_groundLines = [_fort] call grad_fortifications_fnc_getGroundLines;
[_visualLines,_boundingLines,_groundLines,_fort,_canFloat,_canCollide,_moduleRoot,_surfaceNormal] call grad_fortifications_fnc_checkCollisionPFH;


[player,_fort,_surfaceNormal] call grad_fortifications_fnc_addUpdatePFH;
[] call grad_fortifications_fnc_addMouseEHs;
[] call grad_fortifications_fnc_addKeyEHs;

["Place", "Cancel", "Manipulate"] call ace_interaction_fnc_showMouseHint;
