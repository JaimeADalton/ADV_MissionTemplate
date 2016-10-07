/*
adv_fnc_getOppPos:

Returns a position in opposite direction for two positions/objects/markers on a circle with the radius ( (outer position) distance (inner position) ).

_this select 0 = outer position - marker, object or position.
_this select 1 = inner position - marker, object or position.
_this select 2 = Does return value have to be a safe position? (optional - Boolean).

Return value: Position
*/

params [
	["_posA", [], [[], "", objNull]]
	,["_posB", [], [[], "", objNull]]
	,["_safe", false, [true]]
];

private _posA1 = call {
	if (_posA isEqualType "") exitWith {getMarkerPos _posA};
	if (_posA isEqualType objNull) exitWith {getPosATL _posA};
	if (_posA isEqualType []) exitWith {_posA};
	nil;
};

private _posB1 = call {
	if (_posB isEqualType "") exitWith {getMarkerPos _posB};
	if (_posB isEqualType objNull) exitWith {getPosATL _posB};
	if (_posB isEqualType []) exitWith {_posB};
	nil;
};

private _dist = _posA1 distance _posB1;
private _dir = [_posA1, _posB1] call BIS_fnc_dirTo;

private _dirPos = [_posB1, _dist, _dir] call BIS_fnc_relPos;
private _safePos = [_dirPos,1,10,10,1,1,0] call BIS_fnc_findSafePos;

private _return = call {
	if (_safe) exitWith {
		[_safePos select 0, _safePos select 1, _dirPos select 2];
	};
	_dirPos;
};

_return;