params ["_fort","_unit"];

if (isNull _fort) exitWith {};

private _type = typeOf _fort;
private _size = [_type] call grad_fortifications_fnc_getObjectSize;

private _objPackUpTimeAuto = 15*(_size);
private _objPackUpTime = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "packUpTime"),"number",_objPackUpTimeAuto] call CBA_fnc_getConfigEntry;
private _packUpTime = _objPackUpTime * (_unit getVariable ["grad_fortifications_packUpTimeFactor",grad_fortifications_packUpTimeFactor]);


[_unit,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call grad_fortifications_fnc_doAnimation;
private _onComplete = {
    _args = _this select 0;
    _args params ["_fort","_unit","_type"];
    [_unit] call grad_fortifications_fnc_stopAnimation;

    _pos = getPos _fort;
    deleteVehicle _fort;
    [_unit,_type] call grad_fortifications_fnc_addFort;
};
private _onCancel = {
    _args = _this select 0;
    _args params ["_fort","_unit"];
    [_unit] call grad_fortifications_fnc_stopAnimation;
};
[_packUpTime, [_fort,_unit,_type], _onComplete, _onCancel, "Packing up..."] call ace_common_fnc_progressBar;
