/* AIL_fnc_setLoadButtonState

Params:
	None
Return:
	
*/

#include "includes.hpp"

private _buttonLoad = AIL_DISPLAY displayCtrl 305; // ACE buttonLoad
private _checkState = call AIL_fnc_checkAllContainersLoad;
_buttonLoad ctrlEnable _checkState;
_buttonLoad ctrlCommit 0;