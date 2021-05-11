/* AIL_fnc_registerArsenalEventHandler

Params:
	None
Return:
	
*/

#include "includes.hpp"

private _eh = ["ace_arsenal_loadoutsDisplayOpened", {
	params ["_display"];
	_display ctrlCreate ["AIL_buttonShow", -1];
	uiNamespace setVariable ["AIL_Display", _display];
}] call CBA_fnc_addEventHandler;
missionNamespace setVariable ["AIL_aceArsenalEventHandler", _eh];