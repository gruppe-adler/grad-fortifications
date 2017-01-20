params ["_lines",["_ignoreObj",objNull]];

_isOnGround = true;
for [{_i=0}, {_i<4}, {_i=_i+1}] do {

    _x = _lines select _i;
    _intersectingObjects = lineIntersectsSurfaces [AGLToASL (_x select 0), AGLToASL (_x select 1), _ignoreObj];
    if (count _intersectingObjects == 0 && !(terrainIntersect [_x select 0, _x select 1])) exitWith {_isOnGround = false};
};

_isOnGround
