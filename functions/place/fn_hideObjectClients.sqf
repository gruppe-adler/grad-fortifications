params ["_builder","_fort","_hide"];

if (player == _builder) exitWith {};
_fort hideObject _hide;
