#include "..\..\dialog\menu\defines.hpp"
#include "..\..\dialog\vehicle\defines.hpp"

params ["_canTakeStore"];

_dialog = findDisplay grad_fortifications_DIALOG;
_takeButton = _dialog displayCtrl grad_fortifications_vehicle_TAKEBUTTON;
_storeButton = _dialog displayCtrl grad_fortifications_vehicle_STOREBUTTON;
_listCtrl = _dialog displayCtrl grad_fortifications_ITEMLIST;
_vehicleListCtrl = _dialog displayCtrl grad_fortifications_vehicle_ITEMLIST;

_selectedContainer = player getVariable ["grad_fortifications_ui_lastSelectedContainer", player];

_takeButtonEnable = switch (true) do {
    case (_selectedContainer == player): {false};
    case (!_canTakeStore): {false};
    case (lnbSize _vehicleListCtrl select 0 == 0): {false};
    default {true};
};

_storeButtonEnable = switch (true) do {
    case (_selectedContainer != player): {false};
    case (!_canTakeStore): {false};
    case (lnbSize _listCtrl select 0 == 0): {false};
    default {true};
};

_takeButton ctrlEnable _takeButtonEnable;
_storeButton ctrlEnable _storeButtonEnable;
