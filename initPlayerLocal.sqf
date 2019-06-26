
	#include "objects\oop.h"
	#include "config\dik_macro.hpp"

	call compile preprocessFileLineNumbers "objects\oo_cubeworld.sqf";
	call compile preprocessFileLineNumbers "objects\oo_keyhandler.sqf";
	call compile preprocessFileLineNumbers "objects\oo_player.sqf";

	setDate [2018, 1, 1, 8, 0];
	private _position = [(position player) select 0, ((position player) select 1) + 4, 2];
	cb_player = ["new", _position] call OO_PLAYER;
	cb_cubeworld = "new" call OO_CUBEWORLD;
	cb_keyhandler = "new" call OO_KEYHANDLER;
	["createWall", _position] call cb_cubeworld;