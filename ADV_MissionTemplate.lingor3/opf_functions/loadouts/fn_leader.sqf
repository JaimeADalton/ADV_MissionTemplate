﻿/*
unit loadout script by Belbo
creates a specific loadout for playable units. Add the items to their respective variables. (expected data type is given).
The kind of ammo a player gets with this loadout does not necessarily have to be specified.
*/

//clothing - (string)
_uniform = ["U_O_CombatUniform_ocamo"];
_vest = ["V_HarnessOSpec_brn"];
_headgear = ["H_HelmetSpecB_blk"];
_backpack = [""];
if ( ADV_par_opfNVGs == 1 ) then { _backpack = ["B_AssaultPack_ocamo","B_AssaultPack_cbr"]; };
_insignium = "";
_useProfileGoggles = 1;		//If set to 1, goggles from your profile will be used. If set to 0, _goggles will be added (or profile goggles will be removed when _goggles is left empty).
_goggles = "";

//weapons - primary weapon - (string)
_primaryweapon = "arifle_Katiba_GL_F";

//primary weapon items - (array)
_optic = ["optic_Arco"];
_attachments = [""];
if ( ADV_par_opfNVGs == 1 ) then { _attachments pushBack "acc_flashlight"; };
if ( ADV_par_opfNVGs == 2 ) then { _attachments pushback "acc_pointer_IR"; };
_silencer = "muzzle_snds_H";		//if silencer is added

//primary weapon ammo (if a primary weapon is given) and how many tracer mags - (integer)
_primaryweaponAmmo = [4,1];
_additionalAmmo = [3,0,false];

//40mm Grenades - (integer)
_40mmHeGrenadesAmmo = 3;
_40mmSmokeGrenadesWhite = 0;
_40mmSmokeGrenadesYellow = 1;
_40mmSmokeGrenadesOrange = 1;
_40mmSmokeGrenadesRed = 1;
_40mmSmokeGrenadesPurple = 0;
_40mmSmokeGrenadesBlue = 0;
_40mmSmokeGrenadesGreen = 0;
_40mmFlareWhite = 0;
_40mmFlareYellow = 5;
_40mmFlareRed = 0;
_40mmFlareGreen = 0;
_40mmFlareIR = 0;

//weapons - handgun - (string)
_handgun = "hgun_Rook40_F";

//handgun items - (array)
_itemsHandgun = [];
_handgunSilencer = "muzzle_snds_L";		//if silencer is added

//handgun ammo (if a handgun is given) - (integer)
_handgunAmmo = [2,0];

//weapons - launcher - (string)
_launcher = "";

//launcher ammo (if a launcher is given) - (integer) 
_launcherAmmo = [0,0];

//binocular - (string)
_binocular = "Rangefinder";

//throwables - (integer)
_grenadeHE = 2;
_grenadeSmokeWhite = 1;
_grenadeSmokeYellow = 1;
_grenadeSmokeOrange = 0;
_grenadeSmokeRed = 0;
_grenadeSmokePurple = 0;
_grenadeSmokeBlue = 0;
_grenadeSmokeGreen = 0;
_chemlightYellow = 0;
_chemlightRed = 1;
_chemlightGreen = 0;
_chemlightBlue = 0;
_IRgrenade = 1;

//first aid kits and medi kits- (integer)
_FirstAidKits = 2;
_MediKit = 0;		//if set to 1, a MediKit and all FirstAidKits will be added to the backpack; if set to 0, FirstAidKits will be added to inventory in no specific order.

//items added specifically to uniform: - (array)
_itemsUniform = [];

//items added specifically to vest: - (array)
_itemsVest = [];

//items added specifically to Backpack: - (array)
_itemsBackpack = [];

//linked items (don't put "ItemRadio" in here, as it's set with _equipRadio) - (array)
_itemsLink = [
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemMap",
	"NVGoggles_OPFOR"
];
		
//items added to any container - (array)
_items = [];

//MarksmenDLC-objects:
if (304400 in (getDLCs 1) || 332350 in (getDLCs 1)) then {
};

	//CustomMod items//
	
//ACRE items
_acreBackpack = ["B_AssaultPack_blk"];		//for backpack radio in case unit hasn't got a backpack
_ACREradios = ["ACRE_PRC343","ACRE_PRC148","ACRE_PRC117F"];
//TFAR items
_givePersonalRadio = true;
_giveRiflemanRadio = false;
_tfar_microdagr = 0;		//adds the tfar microdagr to set the channels for a rifleman radio

//ACE items (if ACE is running on the server) - (integers)
_ACE_EarPlugs = 1;

_ace_FAK = 1;		//overwrites the values for bandages, morphine and tourniquet and adds a specified number of bandages and morphine. Defined in fn_aceFAK.sqf
_ACE_fieldDressing = 3;
_ACE_packingBandage = 6;
_ACE_elasticBandage = 6;
_ACE_quikclot = 6;
_ACE_atropine = 0;
_ACE_adenosine = 0;
_ACE_epinephrine = 0;
_ACE_morphine = 2;
_ACE_tourniquet = 2;
_ACE_bloodIV = 0;
_ACE_bloodIV_500 = 0;
_ACE_bloodIV_250 = 0;
_ACE_plasmaIV = 0;
_ACE_plasmaIV_500 = 0;
_ACE_plasmaIV_250 = 0;
_ACE_salineIV = 0;
_ACE_salineIV_500 = 0;
_ACE_salineIV_250 = 0;
_ACE_bodyBag = 0;
_ACE_personalAidKit = 0;
_ACE_surgicalKit = 0;

_ACE_SpareBarrel = 0;
_ACE_UAVBattery = 0;
_ACE_wirecutter = 0;
_ACE_Clacker = 0;
_ACE_M26_Clacker = 0;
_ACE_DeadManSwitch = 0;
_ACE_DefusalKit = 0;
_ACE_Cellphone = 0;
_ACE_MapTools = 1;
_ACE_CableTie = 2;
_ACE_EntrenchingTool = 0;
_ACE_sprayPaintColor = "RANDOM";

_ACE_key = 1;	//0 = no key, 1 = side dependant key, 2 = master key, 3 = lockpick
_ACE_flashlight = 1;
_ACE_kestrel = 0;
_ACE_altimeter = 0;
_ACE_ATragMX = 0;
_ACE_rangecard = 0;
_ACE_DAGR = 0;
_ACE_microDAGR = 1;
_ACE_RangeTable_82mm = 0;
_ACE_MX2A = 0;
_ACE_HuntIR_monitor = 0;
_ACE_HuntIR = 0;
_ACE_m84 = 0;
_ACE_HandFlare_Green = 0;
_ACE_HandFlare_Red = 0;
_ACE_HandFlare_White = 0;
_ACE_HandFlare_Yellow = 0;

//AGM Variables (if AGM is running) - (bool)
_ACE_isMedic = 0;		//0 = no medic; 1 = medic; 2 = doctor;
_ACE_isEngineer = 1;	//0 = no specialist; 1 = engineer; 2 = repair specialist;
_ACE_isEOD = false;
_ACE_isPilot = false;

//Tablet-Items
_tablet = false;
_androidDevice = true;
_microDAGR = false;
_helmetCam = true;

//scorch inv items
_scorchItems = [""];
_scorchItemsRandom = ["sc_cigarettepack","sc_chips","sc_candybar","","",""];

//Addon Content:
switch (true) do {
	case (ADV_par_opfWeap == 1): {
		//RHS
		_primaryweapon = "rhs_weap_ak74m_gp25";
		_optic = ["rhs_acc_pso1m2"];
		_attachments = ["rhs_acc_dtk"];
		_silencer = "rhs_acc_tgpa";		//if silencer is added
		_primaryweaponAmmo set [1,2];
		_handgun = "rhs_weap_makarov_pmm";
		_itemsHandgun = [];
		_handgunSilencer = "";
	};
	case (ADV_par_opfWeap == 2): {
		//RHS Guerilla
		_primaryweapon = "rhs_weap_akm_gp25";
		_optic = [""];
		_attachments = [""];
		_silencer = "";		//if silencer is added		
		_handgun = "";
		_itemsHandgun = [];
		_handgunSilencer = "";
	};
	case (ADV_par_opfWeap == 3): {
		//CUP
		_primaryweapon = "CUP_arifle_AK107_GL";
		_optic = ["CUP_optic_PSO_1"];
		_attachments = [""];
		_silencer = "CUP_muzzle_PBS4";		//if silencer is added
		_handgun = "CUP_hgun_PB6P9";
		_itemsHandgun = [];
		_handgunSilencer = "CUP_muzzle_PB6P9";
	};
	case (ADV_par_opfWeap == 4): {
		//HLC AK
		_primaryweapon = "hlc_rifle_aks74_GL";
		_optic = [""];
		_attachments = [""];
		_silencer = "hlc_muzzle_545SUP_AK";		//if silencer is added		
		if (isClass(configFile >> "CfgPatches" >> "RH_de_cfg")) then {
			_handgun = "RH_mak";
			_itemsHandgun = [""];
			_handgunSilencer = "RH_pmsd";
		};
	};
	default {};
};
switch (ADV_par_opfUni) do {
	case 1: {
		//RHS EMR-Summer
		_uniform = ["rhs_uniform_emr_patchless"];
		_vest = ["rhs_6b23_digi_6sh92_radio","rhs_6b13_Flora_6sh92_radio","rhs_6b13_6sh92_radio"];
		_headgear = ["rhs_6b28","rhs_6b28_ess","rhs_6b26_green","rhs_6b26_ess_green","rhs_6b27m_green","rhs_6b27m_green_ess","rhs_6b27m","rhs_6b27m_ess","rhs_6b28_green","rhs_6b28_green_ess"];
		_backpack = ["rhs_assault_umbts"];
	};
	case 2: {
		//RHS Flora
		_uniform = ["rhs_uniform_flora_patchless"];
		_vest = ["rhs_6b13_Flora_6sh92_radio","rhs_6b13_6sh92_radio"];
		_headgear = ["rhs_6b26","rhs_6b26_ess","rhs_6b26_green","rhs_6b26_ess_green","rhs_6b27m_green","rhs_6b27m_green_ess","rhs_6b27m","rhs_6b27m_ess","rhs_6b28_green","rhs_6b28_green_ess"];
		_backpack = ["rhs_assault_umbts"];
	};
	case 3: {
		//RHS Mountain Flora
		_uniform = ["rhs_uniform_mflora_patchless"];
		_vest = ["rhs_6b23_ML_6sh92_radio"];
		_headgear = ["rhs_6b26_green","rhs_6b26_ess_green","rhs_6b27m_green","rhs_6b27m_green_ess","rhs_6b27m","rhs_6b27m_ess","rhs_6b28_green","rhs_6b28_green_ess"];
		_backpack = ["rhs_assault_umbts"];
	};
	case 4: {
		//Guerilla
		_uniform = ["U_OG_Guerrilla_6_1","U_OG_Guerilla2_2","U_OG_Guerilla2_1","U_OG_Guerilla2_3","U_OG_Guerilla3_1"];
		_headgear = ["H_Watchcap_cbr","H_Watchcap_camo","H_Booniehat_khk","H_Booniehat_oli","H_Cap_blk","H_Cap_oli","H_Cap_tan","H_Cap_brn_SPECOPS","H_MilCap_ocamo",
			"H_Cap_headphones","H_ShemagOpen_tan"];
		_ACREradios = ["","ACRE_PRC343","ACRE_PRC77"];
		_binocular = "Binocular";
	};
	case 5: {
		//Afghan Militia (EricJ's Taliban)
		_uniform = ["U_Afghan01NH","U_Afghan02NH","U_Afghan03NH"];
		if (isClass(configFile >> "CfgPatches" >> "maa_Uniform")) then {_uniform append ["TRYK_U_taki_BL","TRYK_U_taki_COY","TRYK_U_taki_wh","TRYK_U_taki_G_BL","TRYK_U_taki_G_COY","TRYK_U_taki_G_WH","TRYK_ZARATAKI","TRYK_ZARATAKI2","TRYK_ZARATAKI3"]};
		_vest = ["V_HarnessOGL_brn","V_HarnessOGL_gry","rhs_vest_commander","V_BandollierB_cbr","V_BandollierB_khk"];
		_headgear = ["","H_Shemag_olive","H_ShemagOpen_tan","H_ShemagOpen_khk","Afghan_01Hat","Afghan_02Hat","Afghan_03Hat","Afghan_04Hat","Afghan_05Hat","Afghan_06Hat"];
		_goggles = "";
		_useProfileGoggles = 0;
		_binocular = "Binocular";
		_acreBackpack = ["rhs_sidor"];
		_ACREradios = ["","ACRE_PRC343","ACRE_PRC77"];
	};
	default {};
};

//TFAR-manpacks
if ( isClass(configFile >> "CfgPatches" >> "task_force_radio") && (ADV_par_Radios == 1 || ADV_par_Radios == 3) ) then {
	_backpack = switch (ADV_par_opfUni) do {
		case 1: {["tf_mr3000_rhs"]};
		case 2: {["tf_mr3000_rhs"]};
		case 3: {["tf_mr3000_rhs"]};
		case 5: {[""]};
		default {["tf_bussole"]};
	};
};
if ( isClass (configFile >> "CfgPatches" >> "acre_main") && (ADV_par_Radios == 1 || ADV_par_Radios == 3)) then {
	_backpack = _acreBackpack;
};

switch (toUpper (str (_this select 0))) do {
	case "OPF_LEADER_LOGISTIC": {
		_ACE_isMedic = 2;
		_ACE_isEngineer = 2;
		_ACE_isEOD = true;
		_tablet = true;
		_androidDevice = false;
	};
	case "OPF_LEADER_COMMAND": {
		_ACE_isMedic = 2;
		_tablet = true;
		_androidDevice = false;
		_40mmFlareYellow = 0;
		_ACE_HuntIR_monitor = 1;
		_ACE_HuntIR = 5;
	};
};

///// No editing necessary below this line /////
_player = _this select 0;
[_player] call ADV_fnc_gear;
CL_IE_Module_Enabled = true;

true;