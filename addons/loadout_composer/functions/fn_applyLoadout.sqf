/* AIL_fnc_applyLoadout

Params:
	0 control: 
Return:
	
*/

#include "includes.hpp"

params ["_control"];
private _loadout = getUnitLoadout player;
UNIFORM(_loadout) set [CONTAINER_ITEMS, ["uniform"] call AIL_fnc_lnbToItems];
VEST(_loadout) set [CONTAINER_ITEMS, ["vest"] call AIL_fnc_lnbToItems];
BACKPACK(_loadout) set [CONTAINER_ITEMS, ["backpack"] call AIL_fnc_lnbToItems];
player setUnitLoadout _loadout;
{
	(AIL_DISPLAY displayCtrl _x) lbSetCurSel 0;
} forEach [UNIFORM_CHOICE_IDC, VEST_CHOICE_IDC, BACKPACK_CHOICE_IDC];
{[_x] call AIL_fnc_initializeContainer} forEach ["uniform", "vest", "backpack"];
[AIL_DISPLAY, "Loaded!"] call ace_arsenal_fnc_message;