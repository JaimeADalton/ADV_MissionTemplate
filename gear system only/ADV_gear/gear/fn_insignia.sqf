﻿params [
	["_target", player, [objNull]],
	"_insigniumArray","_insignium"
];

//adv insignia
if (isClass (configFile >> "CfgPatches" >> "adv_insignia")) then {
	if ( side (group _target) == west || (side (group _target) == independent) ) exitWith {
		_insigniumArray = switch (rank _target) do {
			case "PRIVATE": {["ADV_insignia_usarmy_00","ADV_insignia_usarmy_01","ADV_insignia_usarmy_02","ADV_insignia_usarmy_02"];};
			case "CORPORAL": {["ADV_insignia_usarmy_03"];};
			case "SERGEANT": {["ADV_insignia_usarmy_04","ADV_insignia_usarmy_04","ADV_insignia_usarmy_05","ADV_insignia_usarmy_06","ADV_insignia_usarmy_07"];};
			case "LIEUTENANT": {["ADV_insignia_usarmy_08","ADV_insignia_usarmy_09","ADV_insignia_usarmy_09"];};
			case "CAPTAIN": {["ADV_insignia_usarmy_10"];};
			case "MAJOR": {["ADV_insignia_usarmy_11","ADV_insignia_usarmy_11","ADV_insignia_usarmy_12"];};
			case "COLONEL": {["ADV_insignia_usarmy_13"];};
		};
		_insignium = _insigniumArray call BIS_fnc_selectRandom;
		[_target,_insignium] remoteExecCall ["BIS_fnc_setUnitInsignia",0,true];
	};
	if ( side (group _target) == east ) exitWith {
		_insigniumArray = switch (rank _target) do {
			case "PRIVATE": {["ADV_insignia_rus_00"];};
			case "CORPORAL": {["ADV_insignia_rus_01"];};
			case "SERGEANT": {["ADV_insignia_rus_02","ADV_insignia_rus_03","ADV_insignia_rus_04","ADV_insignia_rus_05"];};
			case "LIEUTENANT": {["ADV_insignia_rus_06","ADV_insignia_rus_07","ADV_insignia_rus_08"];};
			case "CAPTAIN": {["ADV_insignia_rus_09"];};
			case "MAJOR": {["ADV_insignia_rus_10","ADV_insignia_rus_10","ADV_insignia_rus_11"];};
			case "COLONEL": {["ADV_insignia_rus_12"];};
		};
		_insignium = _insigniumArray call BIS_fnc_selectRandom;
		[_target,_insignium] remoteExecCall ["BIS_fnc_setUnitInsignia",0,true];
	};
};

true;