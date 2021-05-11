/* AIL_fnc_itemMass

Params:
	0 type: 
Return:
	
*/

#include "includes.hpp"

params ["_type"];
private _cfg = _type call CBA_fnc_getItemConfig;
if (isNumber (_cfg / "ItemInfo" / "mass")) exitWith {
	getNumber (_cfg / "ItemInfo" / "mass");
};
if (isNumber (_cfg / "mass")) exitWith {
	getNumber (_cfg / "mass");
};
throw (format ["Mass not found for '%1'", _cfg]);