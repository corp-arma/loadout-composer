/* AIL_fnc_selectedLoadout

Params:
	None
Return:
	
*/

#include "includes.hpp"

private _loadoutList = AIL_DISPLAY displayCtrl 302; // ACE loadout list (contentPanel)
private _row = (lnbCurSelRow _loadoutList);
if (_row == -1) exitWith { nil };
private _loadoutName = _loadoutList lnbText [_row, 1];
private _loadout = [_loadoutName] call AIL_fnc_aceLoadout;
private _invalidItems = [_loadout] call AIL_fnc_loadoutInvalidItems;
if ((count _invalidItems > 0)) exitWith { nil };
_loadout