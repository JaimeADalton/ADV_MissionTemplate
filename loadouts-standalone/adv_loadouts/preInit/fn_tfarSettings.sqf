﻿/*
ADV_fnc_tfarSettings by Belbo
contains all the variables that are important for tfar
*/

if (isClass(configFile >> "CfgPatches" >> "tfar_core")) exitWith {
	//radios
	TFAR_DefaultRadio_Personal_West = "TFAR_anprc152";
	TFAR_DefaultRadio_Personal_East = "tfar_fadak";
	TFAR_DefaultRadio_Personal_Independent = "tfar_anprc148jem";
	
	TFAR_DefaultRadio_Rifleman_West = "tfar_anprc154";
	TFAR_DefaultRadio_Rifleman_East = "tfar_pnr1000a";
	TFAR_DefaultRadio_Rifleman_Independent = "tfar_anprc154";

	//frequencies
	//blufor
	TFAR_defaultFrequencies_sr_west = ["41.0","42.0","43.0","44.0","45.0","46.0","47.0","48.0"];
	TFAR_defaultFrequencies_lr_west = ["51.0","52.0","53.0","54.0","55.0","56.0","57.0","58.0","59.0"];
	
	TFAR_defaultFrequencies_sr_east = ["41.0","42.0","43.0","44.0","45.0","46.0","47.0","48.0"];
	TFAR_defaultFrequencies_lr_east = ["51.0","52.0","53.0","54.0","55.0","56.0","57.0","58.0","59.0"];
	
	TFAR_defaultFrequencies_sr_independent = ["61.0","62.0","63.0","64.0","65.0","66.0","67.0","68.0"];
	TFAR_defaultFrequencies_lr_independent = ["71.0","72.0","73.0","74.0","75.0","76.0","77.0","78.0","79.0"];
	
	_settingsSwWest = [false] call TFAR_fnc_generateSRSettings;
	_settingsLrWest = [false] call TFAR_fnc_generateLrSettings;
	
	_settingsSwEast = [false] call TFAR_fnc_generateSRSettings;
	_settingsLrEast = [false] call TFAR_fnc_generateLrSettings;
	
	_settingsSwGuer = [false] call TFAR_fnc_generateSwSettings;
	_settingsLrGuer = [false] call TFAR_fnc_generateLrSettings;
	
	_settingsSwWest set [2, TFAR_defaultFrequencies_sr_west];
	_settingsSwWest set [4, "_bluefor"];
	TFAR_freq_sw_west = _settingsSwWest;
	
	_settingsLrWest set [2, TFAR_defaultFrequencies_lr_west];
	_settingsLrWest set [4, "_bluefor"];
	TFAR_freq_lr_west = _settingsLrWest;
	
	_settingsSwEast set [2, TFAR_defaultFrequencies_sr_east];
	_settingsSwEast set [4, "_opfor"];
	TFAR_freq_sw_east = _settingsSwEast;
	
	_settingsLrEast set [2, TFAR_defaultFrequencies_lr_east];
	_settingsLrEast set [4, "_opfor"];
	TFAR_freq_lr_east = _settingsLrEast;
	
	_settingsSwGuer set [2, TFAR_defaultFrequencies_sr_independent];
	_settingsLrGuer set [2, TFAR_defaultFrequencies_lr_independent];

	call {
		if ([independent,west] call BIS_fnc_sideIsFriendly) exitWith {
			_settingsSWGuer set [4, "_bluefor"];
			_settingsLrGuer set [4, "_bluefor"];
		};
		if ([independent,east] call BIS_fnc_sideIsFriendly) exitWith {
			_settingsSWGuer set [4, "_opfor"];
			_settingsLrGuer set [4, "_opfor"];
		};
		_settingsSWGuer set [4, "_indfor"];
		_settingsLrGuer set [4, "_indfor"];
	};

	TFAR_freq_sw_independent = _settingsSwGuer;
	TFAR_freq_lr_independent = _settingsLrGuer;

};
if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {
	//radios
	TF_defaultWestPersonalRadio = "tf_anprc152";
	TF_defaultEastPersonalRadio = "tf_fadak";
	TF_defaultGuerPersonalRadio = "tf_anprc148jem";
	
	TF_defaultWestRiflemanRadio = "tf_anprc154";
	TF_defaultEastRiflemanRadio = "tf_pnr1000a";
	TF_defaultGuerRiflemanRadio = "tf_anprc154";

	//frequencies
	//blufor
	_settingsSwWest = false call TFAR_fnc_generateSwSettings;
	_settingsSwEast = false call TFAR_fnc_generateSwSettings;
	_settingsSwGuer = false call TFAR_fnc_generateSwSettings;
	
	_settingsLrWest = false call TFAR_fnc_generateLrSettings;
	_settingsLrEast = false call TFAR_fnc_generateLrSettings;
	_settingsLrGuer = false call TFAR_fnc_generateLrSettings;
	
	_settingsSwWest set [2, ["41","42","43","44","45","46","47","48"]];
	_settingsLrWest set [2, ["51","52","53","54","55","56","57","58","59"]];
	_settingsSwWest set [4, "_bluefor"];
	_settingsLrWest set [4, "_bluefor"];
	tf_freq_west = _settingsSwWest;
	tf_freq_west_lr = _settingsLrWest;

	_settingsSwEast set [2, ["41","42","43","44","45","46","47","48"]];
	_settingsLrEast set [2, ["51","52","53","54","55","56","57","58","59"]];

	_settingsSwGuer set [2, ["61","62","63","64","65","66","67","68"]];
	_settingsLrGuer set [2, ["71","72","73","74","75","76","77","78","79"]];
	
	_settingsSwEast set [4, "_opfor"];
	_settingsLrEast set [4, "_opfor"];
	tf_freq_east = _settingsSwEast;
	tf_freq_east_lr = _settingsLrEast;

	call {
		if ([independent,west] call BIS_fnc_sideIsFriendly) exitWith {
			_settingsSWGuer set [4, "_bluefor"];
			_settingsLrGuer set [4, "_bluefor"];
		};
		if ([independent,east] call BIS_fnc_sideIsFriendly) exitWith {
			_settingsSWGuer set [4, "_opfor"];
			_settingsLrGuer set [4, "_opfor"];
		};
		_settingsSWGuer set [4, "_indfor"];
		_settingsLrGuer set [4, "_indfor"];
	};

	tf_freq_guer = _settingsSwGuer;
	tf_freq_guer_lr = _settingsLrGuer;
};