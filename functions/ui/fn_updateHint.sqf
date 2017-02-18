#include "..\..\dialog\ui_toolkit.hpp"
#include "..\..\dialog\hint\defines.hpp"

if (!hasInterface) exitWith {};

params ["_mode","_moduleRoot","_surfaceNormal"];

disableSerialization;
_hint   = uiNamespace getVariable "grad_fortifications_hint";

if (isNull _hint) exitWith {};

_l4BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE4;
_l4Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE4;
_l4Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE4;
_l5BG   = _hint displayCtrl grad_fortifications_hint_BG_LINE5;
_l5Txt  = _hint displayCtrl grad_fortifications_hint_TXT_LINE5;
_l5Pic  = _hint displayCtrl grad_fortifications_hint_PIC_LINE5;

switch (true) do {
    case (!_surfaceNormal): {
        _l4Txt ctrlSetText "SURFACENORMAL DISABLED";
        _l4BG ctrlSetBackgroundColor [0.4,0.4,0.4,0.75];
    };
    case (player getVariable ["grad_fortifications_surfaceNormal",true]): {
        _l4Txt ctrlSetText "SURFACENORMAL ON";
        _l4BG ctrlSetBackgroundColor [0,0.7,0,0.65];
    };
    case (!(player getVariable ["grad_fortifications_surfaceNormal",true])): {
        _l4Txt ctrlSetText "SURFACENORMAL OFF";
        _l4BG ctrlSetBackgroundColor [0.65,0.65,0,0.65];
    };
};

switch (_mode) do {
    case ("COLLIDING"): {
        _l5BG ctrlSetBackgroundColor [0.8,0,0,0.65];
        _l5Txt ctrlSetText "COLLIDING!";
        _l5Pic ctrlSetText (_moduleRoot + "\data\error.paa");
    };

    case ("FLOATING"): {
        _l5BG ctrlSetBackgroundColor [0.65,0.65,0,0.65];
        _l5Txt ctrlSetText "NOT ON GROUND!";
        _l5Pic ctrlSetText (_moduleRoot + "\data\warning.paa");
    };

    case ("ONROAD"): {
        _l5BG ctrlSetBackgroundColor [0.65,0.65,0,0.65];
        _l5Txt ctrlSetText "CAN'T PLACE ON ROAD!";
        _l5Pic ctrlSetText (_moduleRoot + "\data\warning.paa");
    };

    case ("CANPLACE"): {
        _l5BG ctrlSetBackgroundColor [0,0.7,0,0.65];
        _l5Txt ctrlSetText "CAN PLACE";
        _l5Pic ctrlSetText (_moduleRoot + "\data\checkmark.paa");
    };
};
