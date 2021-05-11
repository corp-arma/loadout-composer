/* AIL_fnc_aceLoadout

Params:
	0 name: 
Return:
	
*/

#include "includes.hpp"

params ["_name"];
private _loadouts = (profileNamespace getVariable "ace_arsenal_saved_loadouts") select {(_x select 0) == _name};
_loadouts select 0 select 1;