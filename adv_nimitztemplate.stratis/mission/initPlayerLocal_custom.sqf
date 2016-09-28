﻿/*
this initPlayerLocal is supposed to be mission specific.
It's being executed right after the mission is being loaded.
Every call, spawn or execVM that's mission specific should be placed in here.

Everything in here will only be executed on the clients and not on the server.
*/
if (isDedicated) exitWith {};
//////////////////////////////////////////////////////////////////////////////////
//calls before mission start (during the loading- and briefing-screen):			//
//////////////////////////////////////////////////////////////////////////////////
// place your custom content here:




//ADV_handle_tpw_core = [] execvm "scripts\tpw_core.sqf"; 
//ADV_handle_tpw_civs = [10,150,5,5,4,50,0,8,10,1] execvm "scripts\tpw_civs.sqf";
//////////////////////////////////////////////////////////////////////////////////
//calls after mission start (after the briefing-screen):
waitUntil {time > 1};
//////////////////////////////////////////////////////////////////////////////////
// place your custom content here:
adv_evh_respawnMover = player addEventhandler ["RESPAWN",{
	player setPosATL (getPosATL respawn_helper);
	player setDir (getDir respawn_helper);
}];
ADV_handle_logisticAction = werkbank_1 addAction [("<t color=""#33FFFF"">" + ("Logistik-Menü") + "</t>"), {createDialog "adv_logistic_mainDialog";},nil,3,false,true,"","true",5];



//////////////////////////////////////////////////////////////////////////////////
//end of the init-script:
if (true) exitWith {};