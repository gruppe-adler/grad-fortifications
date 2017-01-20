#define CF_ONLY_WATER       1
#define CF_NEAREST_CONTACT  2
#define CF_ONLY_STATIC      4
#define CF_ONLY_DYNAMIC     8
#define CF_FIRST_CONTACT    16
#define CF_ALL_OBJECTS      32

params ["_line",["_ignoreObj",objNull]];

_startPos = AGLToASL (_line select 0);
_endPos = AGLToASL (_line select 1);

_intersectingObjects = lineIntersectsObjs [_startPos, _endPos, objNull, _ignoreObj, false, CF_ALL_OBJECTS + CF_FIRST_CONTACT];
_isColliding = (count _intersectingObjects) > 0;

_isColliding


/*  Other methods:
*   _intersectingObjects = lineIntersectsSurfaces [_startPos, _endPos, _ignoreObj];     //always collides with floor
*   _intersectingObjects = lineIntersectsWith [_startPos, _endPos];                     //seems to be less accurate than lineIntersectsObjs
*/
