﻿ /*
 * Author: Belbo
 *
 * Defines a zone around an object, marker or position in the given radius that allows no grenade throws within for the target (ie. player).
 *
 * Arguments:
 * 0: target - <OBJECT>
 * 1: position, can be: position, object, marker - <ARRAY>, <OBJECT>, <STRING>
 * 2: radius around position to be safe (optional) - <NUMBER>
 *
 * Return Value:
 * fired evh handle - <HANDLE>
 *
 * Example:
 * _handle = [player, "respawn_west", 100] call adv_fnc_safeZone;
 *
 * Public: No
 */

params [
	["_target", player, [objNull]],
	["_object", objNull, [objNull,"",[]]],
	["_radius", 100,[0]]
];

adv_safezone_scriptfnc = {
	params [
		["_target", player, [objNull]],
		["_object", [0,0,0], [[]]],
		["_radius", 100, [0]],
		["_grenade", objNull, [objNull]],
		["_grenadeType", "", [""]],
		["_isAce", false, [true]]
	];
	if ( ((getPosWorld _target) distance2D _object) < _radius ) then {
		if (!_isAce) then {
			deleteVehicle _grenade;
		} else {
			_grenade setPos [0,0,0];
		};
		_target addMagazine [_grenadeType,1];
		systemChat "Safezone caught the grenade. Don't throw grenades here.";
	};
	nil
};

adv_safezone_targetPos = switch (typeName _object) do {
	case "STRING": { getMarkerPos _object };
	case "OBJECT": { getPosWorld _object };
	case "ARRAY": { _object };
	default {nil};
};

adv_safezone_radius = _radius;

_handle = _target addEventhandler [
	"fired",
	{
		if (_this select 1 == "THROW") then {
			[_this select 0,adv_safezone_targetPos,adv_safezone_radius,_this select 6,_this select 5,false] call adv_safezone_scriptfnc;
		};
	}
];

_handle_ace = ["ace_throwableThrown", {
	params ["_unit","_activeThrowable"];
	[_unit,adv_safezone_targetPos,adv_safezone_radius,_activeThrowable,ace_advanced_throwing_ammoMagLookup getVariable [(typeOf _activeThrowable),"MiniGrenade"],true] call adv_safezone_scriptfnc;
}] call CBA_fnc_addEventHandler;

_handle;