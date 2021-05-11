/* AIL_fnc_openAIL

Params:
	0 control: 
Return:
	
*/

#include "includes.hpp"

params ["_control"];
private _display = ctrlParent _control;
private _contentPanel = _display displayCtrl 302; // ACE contentPanel
private _buttonSave = _display displayCtrl 304; // ACE buttonSave
private _textEditBox = _display displayCtrl 303; // ACE textEditBox
private _buttonLoad = _display displayCtrl 305; // ACE buttonLoad
private _buttonShare = _display displayCtrl 306; // ACE buttonShare
private _buttonDelete = _display displayCtrl 307; // ACE buttonDelete
private _buttonRename = _display displayCtrl 308; // ACE buttonRename
_contentPanel ctrlRemoveAllEventHandlers "LBSelChanged";
_contentPanel ctrlRemoveAllEventHandlers "LBDblClick";
_buttonLoad ctrlRemoveAllEventHandlers "ButtonClick";
_texEditBox ctrlSetText "";
{
	_x ctrlEnable false;
	_x ctrlCommit 0;
} forEach [_buttonSave, _textEditBox, _buttonShare, _buttonDelete, _buttonRename];
_contentPanel ctrlAddEventHandler ["LBSelChanged", "_this call AIL_fnc_selectLoadout"];
_buttonLoad ctrlAddEventHandler ["ButtonClick", "_this call AIL_fnc_applyLoadout"];
_display ctrlCreate ["AIL_panel", -1];
{[_x] call AIL_fnc_initializeContainer} forEach ["uniform", "vest", "backpack"];
ctrlDelete _control;