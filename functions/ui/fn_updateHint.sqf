#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\hint\defines.hpp"

if (!hasInterface) exitWith {};

params ["_mode"];

disableSerialization;
_hint   = uiNamespace getVariable "grad_fortifications_hint";

if (isNull _hint) exitWith {};

_l4BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE4;
_l4Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE4;
_l4Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE4;


switch (_mode) do {
    case ("COLLIDING"): {
        _l4BG ctrlSetBackgroundColor [1,0,0,0.65];
        _l4Txt ctrlSetText "COLLIDING!";
        _l4Pic ctrlSetText "";
    };

    case ("FLOATING"): {
        _l4BG ctrlSetBackgroundColor [1,1,0,0.65];
        _l4Txt ctrlSetText "NOT ON GROUND!";
        _l4Pic ctrlSetText "";
    };

    case ("CANPLACE"): {
        _l4BG ctrlSetBackgroundColor [0,1,0,0.65];
        _l4Txt ctrlSetText "CAN PLACE";
        _l4Pic ctrlSetText "";
    };
};
