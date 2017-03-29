params ["_type","_dir","_vectorUp","_posASL",["_owner",objNull]];

private _fort = createVehicle [_type, [0,0,0], [], 0, "NONE"];
_fort setDir _dir;
_fort setVectorUp _vectorUp;
_fort setPosASL _posASL;

[_fort,_owner] remoteExec ["grad_fortifications_fnc_initFort",0,true];

private _onBuildComplete = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications"  >> _type >> "onBuildComplete"),"text",([(missionConfigFile >> "CfgGradFortifications" >> "onBuildComplete"),"text",""] call CBA_fnc_getConfigEntry)] call CBA_fnc_getConfigEntry;
[_owner,_fort] call compile _onBuildComplete;

_fort
