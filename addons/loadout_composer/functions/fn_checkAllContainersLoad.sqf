/* AIL_fnc_checkAllContainersLoad

Params:
	None
Return:
	
*/

#include "includes.hpp"

private _ok = true;
{
	private _loadInfo = [_x] call AIL_fnc_containerLoadInfo;
	_loadInfo params ["_load", "_maxLoad"];
	if (_load > _maxLoad) then {
		_ok = false;
	};
} forEach ["uniform", "vest", "backpack"];
_ok