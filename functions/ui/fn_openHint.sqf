#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\hint\defines.hpp"

params ["_open",["_surfaceNormal",true]];
if (!hasInterface) exitWith {};

if (_open) then {
    titleRsc ["grad_fortifications_hint", "PLAIN", 1, true];
};

disableSerialization;
_hint   = uiNamespace getVariable "grad_fortifications_hint";

if (isNull _hint) exitWith {};

_l1BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE1;
_l1Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE1;
_l1Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE1;
_l2BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE2;
_l2Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE2;
_l2Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE2;
_l3BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE3;
_l3Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE3;
_l3Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE3;
_l4BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE4;
_l4Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE4;
_l4Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE4;
_l5BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE5;
_l5Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE5;
_l5Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE5;

_xScale = X_SCALE;
if (_open) then {
    _moduleRoot = [] call grad_fortifications_fnc_getModuleRoot;

    _l1Txt ctrlSetText "ROTATE";
    _l1Pic ctrlSetText (_moduleRoot + "\data\shiftkey.paa");
    _l2Txt ctrlSetText "LOWER/RAISE";
    _l2Pic ctrlSetText (_moduleRoot + "\data\ctrlkey.paa");
    _l3Txt ctrlSetText "SPEED UP";
    _l3Pic ctrlSetText (_moduleRoot + "\data\altkey.paa");
    _l4Pic ctrlSetText (_moduleRoot + "\data\tabkey.paa");

    {
        _lineNumber = _forEachIndex;
        {
            _curPos = ctrlPosition _x;
            _x ctrlSetPosition [(_curPos select 0) - (0.28 * _xScale), grad_fortifications_hint_Y+_lineNumber*(grad_fortifications_spacing_Y+grad_fortifications_hint_H)];
            _x ctrlCommit 0.5;
            false
        } count _x;
    } forEach [[_l1BG,_l1Txt,_l1Pic],[_l2BG,_l2Txt,_l2Pic],[_l3BG,_l3Txt,_l3Pic],[_l4BG,_l4Txt,_l4Pic],[_l5BG,_l5Txt,_l5Pic]];

} else {
    {
        _lineNumber = _forEachIndex;
        {
            _curPos = ctrlPosition _x;
            _x ctrlSetPosition [(_curPos select 0) + (0.28 * _xScale), grad_fortifications_hint_Y+_lineNumber*(grad_fortifications_spacing_Y+grad_fortifications_hint_H)];
            _x ctrlCommit 0.5;
            false
        } count _x;
    } forEach [[_l1BG,_l1Txt,_l1Pic],[_l2BG,_l2Txt,_l2Pic],[_l3BG,_l3Txt,_l3Pic],[_l4BG,_l4Txt,_l4Pic],[_l5BG,_l5Txt,_l5Pic]];

    [{
        titleRsc ["grad_fortifications_empty", "PLAIN"];
    },[],1] call CBA_fnc_waitAndExecute;
};
