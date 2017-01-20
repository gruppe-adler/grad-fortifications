#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\hint\defines.hpp"

if (!hasInterface) exitWith {};

params ["_mode","_moduleRoot"];

disableSerialization;
_hint   = uiNamespace getVariable "grad_fortifications_hint";

if (isNull _hint) exitWith {};

_l4BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE4;
_l4Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE4;
_l4Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE4;


switch (_mode) do {
    case ("COLLIDING"): {
        _l4BG ctrlSetBackgroundColor [0.8,0,0,0.65];
        _l4Txt ctrlSetText "COLLIDING!";
        _l4Pic ctrlSetText (_moduleRoot + "\data\error.paa");
    };

    case ("FLOATING"): {
        _l4BG ctrlSetBackgroundColor [0.65,0.65,0,0.65];
        _l4Txt ctrlSetText "NOT ON GROUND!";
        _l4Pic ctrlSetText (_moduleRoot + "\data\warning.paa");
    };

    case ("CANPLACE"): {
        _l4BG ctrlSetBackgroundColor [0,0.7,0,0.65];
        _l4Txt ctrlSetText "CAN PLACE";
        _l4Pic ctrlSetText (_moduleRoot + "\data\checkmark.paa");
    };
};
