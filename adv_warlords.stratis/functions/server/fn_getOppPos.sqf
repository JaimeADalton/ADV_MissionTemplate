/*
 * Author: Belbo
 *
 * Returns a position in opposite direction for two positions/objects/markers on a circle with the radius ( (outer position) distance (inner position) ).
 *
 * Arguments:
 * 0: outer position, can be position, object or marker - <ARRAY>, <OBJECT>, <STRING>
 * 1: inner position, can be position, object or marker - <ARRAY>, <OBJECT>, <STRING>
 * 2: Does return value have to be a safe position? (optional) - <BOOL>
 *
 * Return Value:
 * Position - <ARRAY>
 *
 * Example:
 * [player,"targetMarker",false] call adv_fnc_getOppPos;
 *
 * Public: No
 */

params [
	["_posA", [], [[], "", objNull]]
	,["_posB", [], [[], "", objNull]]
	,["_safe", false, [true]]
];

private _posA1 = [_posA] call adv_fnc_getPos;
private _posB1 = [_posB] call adv_fnc_getPos;

private _dist = _posA1 distance _posB1;
private _dir = [_posA1, _posB1] call BIS_fnc_dirTo;

private _dirPos = [_posB1, _dist, _dir] call BIS_fnc_relPos;
private _safePos = [_dirPos,1,10,10,1,1,0,[],[_dirPos,_dirPos]] call BIS_fnc_findSafePos;

private _return = call {
	if (_safe) exitWith {
		[_safePos select 0, _safePos select 1, _dirPos select 2];
	};
	_dirPos;
};

_return;