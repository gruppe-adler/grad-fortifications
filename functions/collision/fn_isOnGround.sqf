#define CF_ONLY_WATER       1
#define CF_NEAREST_CONTACT  2
#define CF_ONLY_STATIC      4
#define CF_ONLY_DYNAMIC     8
#define CF_FIRST_CONTACT    16
#define CF_ALL_OBJECTS      32

params ["_lines",["_ignoreObj",objNull]];

_isOnGround = true;
for [{_i=0}, {_i<4}, {_i=_i+1}] do {

    _x = _lines select _i;
    _intersectingObjects = lineIntersectsSurfaces [AGLToASL (_x select 0), AGLToASL (_x select 1), _ignoreObj];
    if (count _intersectingObjects == 0) exitWith {_isOnGround = false};
};

{
    if (terrainIntersect [_x select 0, _x select 1]) exitWith {_isOnGround = true};
} forEach _lines;

_isOnGround
