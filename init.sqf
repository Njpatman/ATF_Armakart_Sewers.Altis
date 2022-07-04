//-------------Track Controls-------------\\

	//Everything that uses BIS_fnc_getParamValue can be found in Armakart_Main\Params.hpp

		//Track Title\\

			Track_Title = 'Sewers'; // Should be name of your track, shown at intro

		//Number of Laps/Checkpoints\\

			Laps_number = ["Laps_number", 3] call BIS_fnc_getParamValue; // Can be as high as you want, just don't go under 2

		//Customization Phase Time\\

			Customization_Phase_Time = ["Customization_Phase_Time", 55] call BIS_fnc_getParamValue;

		//Voting Phase\\

			Voting_Phase_Enabled = ["Voting_Phase_Enabled", 1] call BIS_fnc_getParamValue;

			Voting_Phase_Time = ["Voting_Phase_Time", 25] call BIS_fnc_getParamValue;

		//Powerup Creep\\

			Powerup_Creep_Enabled = ["Powerup_Creep_Enabled", 1] call BIS_fnc_getParamValue;

		//Intro Cam Controls\\

			Radius_cam = 16; // Circle radius (distance to the checkpoints) 

			Angle_cam = random 360;// Starting angle (compass direction) 

			Altitude_cam = 0; // Camera altitude (height above ground) 

			Speed_cam = 0.26; // Higher is faster

		//Kart Classname\\

			Kart_Classname = "C_Quadbike_01_F";

/*
\\---------------------------------------//
*/

//Simply extends init.sqf
#include "Armakart_Main\Armakart_Init.sqf";