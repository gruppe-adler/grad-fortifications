params ["_type",["_mode","NORMAL"],["_builder",ACE_player]];

if (_type == "") exitWith {};
if (ACE_player != _builder) exitWith {};

private _boundingBoxSize = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "boundingBoxSize"),"number",1] call CBA_fnc_getConfigEntry;
private _canFloat = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "canFloat"),"number",0] call CBA_fnc_getConfigEntry) == 1;
private _canCollide = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "canCollide"),"number",0] call CBA_fnc_getConfigEntry) == 1;
private _canPlaceOnRoad = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "canPlaceOnRoad"),"number",1] call CBA_fnc_getConfigEntry) == 1;
private _surfaceNormal = ([(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "surfaceNormal"),"number",1] call CBA_fnc_getConfigEntry) == 1;
private _onPlaceStart = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "onPlaceStart"),"text",([(missionConfigFile >> "CfgGradFortifications" >> "onPlaceStart"),"text",""] call CBA_fnc_getConfigEntry)] call CBA_fnc_getConfigEntry;

private _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;

private _fort = _type createVehicleLocal [0,0,0];
private _size = [_type] call grad_fortifications_fnc_getObjectSize;
_fort allowDamage false;
_fort enableSimulation false;
_fort disableCollisionWith ACE_player;

[ACE_player,_type,_fort] call compile _onPlaceStart;

if (missionNamespace getVariable ["grad_fortifications_collisionDebugMode",false]) then {
    _fort hideObject true;
};

ACE_player setVariable ["grad_fortifications_isPlacing", true];
ACE_player setVariable ["grad_fortifications_currentType", _type];
ACE_player setVariable ["grad_fortifications_currentFort", _fort];
ACE_player setVariable ["grad_fortifications_currentMode", _mode];
ACE_player setVariable ["grad_fortifications_currentSize", _size];
ACE_player setVariable ["grad_fortifications_currentDistance", (((_size*2.5)^(1/2)) max 2)];
ACE_player setVariable ["grad_fortifications_currentDirection", 0];
ACE_player setVariable ["grad_fortifications_currentHeight",-0.1];
ACE_player setVariable ["grad_fortifications_surfaceNormal",_surfaceNormal];

ACE_player call ace_common_fnc_fixLoweredRifleAnimation;
[ACE_player] call ace_weaponselect_fnc_putWeaponAway;
ACE_player forceWalk true;

[true,_surfaceNormal] call grad_fortifications_fnc_openHint;

private _boundingLines = [_fort,_boundingBoxSize] call grad_fortifications_fnc_getBoundingLines;
private _visualLines = [_fort] call grad_fortifications_fnc_getVisualLines;
private _groundLines = [_fort] call grad_fortifications_fnc_getGroundLines;
[_visualLines,_boundingLines,_groundLines,_fort,_canFloat,_canCollide,_canPlaceOnRoad,_moduleRoot,_surfaceNormal] call grad_fortifications_fnc_checkCollisionPFH;


[ACE_player,_fort,_surfaceNormal] call grad_fortifications_fnc_addUpdatePFH;
[] call grad_fortifications_fnc_addMouseEHs;
[] call grad_fortifications_fnc_addKeyEHs;

["Place", "Cancel", "Manipulate"] call ace_interaction_fnc_showMouseHint;
