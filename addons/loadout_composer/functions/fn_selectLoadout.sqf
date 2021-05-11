/* AIL_fnc_selectLoadout

Params:
	0 control: 
	1 selectedIndex: 
Return:
	
*/

#include "includes.hpp"

params ["_control", "_selectedIndex"];
{
	(AIL_DISPLAY displayCtrl _x) lbSetCurSel 2;
} forEach [UNIFORM_CHOICE_IDC, VEST_CHOICE_IDC, BACKPACK_CHOICE_IDC];
{[_x] call AIL_fnc_initializeContainer} forEach ["uniform", "vest", "backpack"];