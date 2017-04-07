﻿/*
ADV_fnc_changeName by Belbo

Changes the name of an AI-unit.

Possible call - has to be executed on each client locally:
[TARGET,FIRSTNAME,LASTNAME] call ADV_fnc_changeName;

_this select 0 = unit that has to be renamed.
_this select 1 = first name.
_this select 2 = last name.
*/

params [
	["_target", objNull, [objNull]],
	["_firstName", "Peter", [""]],
	["_lastName", "Schmitz", [""]],
	"_wholeName"
];
_wholeName = format ["%1 %2",_firstName,_lastName];
_return = [_firstName,_lastName,_wholeName];

(driver _target) setName _return;
_target setName _return;

_return;