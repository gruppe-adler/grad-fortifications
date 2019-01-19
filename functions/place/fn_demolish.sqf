params ["_fort","_unit"];

if (isNull _fort) exitWith {};

_type = typeOf _fort;
_size = [_type] call grad_fortifications_fnc_getObjectSize;

_objDemolitionTimeAuto = 10*(_size);
_objDemolitionTime = [(missionConfigFile >> "CfgGradFortifications" >> "Fortifications" >> _type >> "demolitionTime"),"number",_objDemolitionTimeAuto] call CBA_fnc_getConfigEntry;
_ownerFactor = if ([_fort,_unit] call grad_fortifications_fnc_isOwner) then {0.5} else {1};
_demolitionTime = _ownerFactor * _objDemolitionTime * (_unit getVariable ["grad_fortifications_demolishTimeFactor",grad_fortifications_demolishTimeFactor]);

[_unit,(configFile >> "ACE_Repair" >> "Actions" >> "FullRepair")] call grad_fortifications_fnc_doAnimation;
_onComplete = {
    _args = _this select 0;
    _args params ["_fort","_unit"];
    [_unit] call grad_fortifications_fnc_stopAnimation;
    deleteVehicle _fort;
};
_onCancel = {
    _args = _this select 0;
    _args params ["_fort","_unit"];
    [_unit] call grad_fortifications_fnc_stopAnimation;
};
[_demolitionTime, [_fort,_unit], _onComplete, _onCancel, "Demolishing..."] call ace_common_fnc_progressBar;
