/*
* 
* - Initializes checkpoints
* 
*/ 

{

	_CP_name = vehicleVarName _x;

	Loaded_CP_NUM = Loaded_CP_NUM + 1;

	uiSleep 0.0925;

	if !((_CP_name in Manual_Checkpoint_Array) || (_CP_name isEqualTo "CP_1")) then {

		_CP_Trigger = createTrigger ["EmptyDetector", getPos _x];
		_CP_Trigger attachTo [_x, [0,0,0]];
		detach _CP_Trigger;

		[_CP_Trigger, CP_Size_Array] remoteExec ["setTriggerArea", 0, true];
		[_CP_Trigger, ["WEST", "PRESENT", true]] remoteExec ["setTriggerActivation", 0, true];
		[_CP_Trigger, ["vehicle player in thisList",
		"
			_trigger = thisTrigger;

			_CP = getPos _trigger nearestObject 'VR_3DSelector_01_complete_F'; 
				
			CP_Name_str = vehicleVarName _CP; 
			
			_CP_Num_Array = toArray CP_Name_str; 
			
			_CP_Num_1 = _CP_Num_Array select 3; 
			
			_CP_Num_1 = _CP_Num_1 - 48; 
			
			_CP_Num_1_str = str _CP_Num_1; 
			
			_Next_CP_Num_str = _CP_Num_1_str; 
			
			_CP_Num_2 = _CP_Num_Array select 4; 
			
			if !(isNil '_CP_Num_2') then { 
			
				_CP_Num_2 = _CP_Num_2 - 48; 
				
				_CP_Num_2_str = str _CP_Num_2; 
				
				_Next_CP_Num_str = _Next_CP_Num_str + (_CP_Num_2_str); 
				
				_CP_Num_3 = _CP_Num_Array select 5; 
			
				if !(isNil '_CP_Num_3') then { 
				
					_CP_Num_3 = _CP_Num_3 - 48; 
				
					_CP_Num_3_str = str _CP_Num_3; 
				
					_Next_CP_Num_str = _Next_CP_Num_str + (_CP_Num_3_str); 
					
				}; 
				
			}; 
			
			_CP_Num_str = 'Prev_CP_Num = ' + (_Next_CP_Num_str) + ' - 1'; 
			
			[] call compile _CP_Num_str; 
			
			if (Prev_CP_Num isEqualTo Current_Checkpoint) then { 
			
				Current_Checkpoint = Current_Checkpoint + 1;  
				
				systemChat '|Armakart System| : Checkpoint obtained!'; 
			
			};

		", ""] ] remoteExec ["setTriggerStatements", 0, true];
		[_CP_Trigger, 0.5] remoteExec ["setTriggerInterval", 0, true];

	};

} forEach (allMissionObjects "VR_3DSelector_01_complete_F");

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart System| : Completed Initializing Checkpoints.";
diag_log format ["|Armakart System| : Time for Checkpoints to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

