params ["_type","_dir","_vectorUp","_posASL"];

_fort = createVehicle [_type, [0,0,0], [], 0, "NONE"];
_fort setDir _dir;
_fort setVectorUp _vectorUp;
_fort setPosASL _posASL;

[_fort] remoteExec ["grad_fortifications_fnc_initFort",0,true];

_fort
