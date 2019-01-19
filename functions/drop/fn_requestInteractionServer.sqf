params ["_crate","_unit","_mode"];

_fortType = _crate getVariable ["grad_fortifications_dropCrate_type",""];

if (_mode == "TAKE") then {
    if ([_unit,_fortType,1,true] call grad_fortifications_fnc_canTake) then {
        [_crate,_unit,_mode] remoteExec ["grad_fortifications_fnc_respondInteractionClient",2,false];
    } else {
        playSound "AddItemFailed";
    };
} else {
    [_crate,_unit,_mode] remoteExec ["grad_fortifications_fnc_respondInteractionClient",2,false];
};
