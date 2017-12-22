	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2018 Nicolas BOITEUX

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "objects\oop.h"
	#include "config\dik_macro.hpp"

	call compile preprocessFileLineNumbers "objects\oo_cubeworld.sqf";
	call compile preprocessFileLineNumbers "objects\oo_keyhandler.sqf";
	call compile preprocessFileLineNumbers "objects\oo_player.sqf";

	setDate [2018, 1, 1, 8, 0];
	private _position = [(position player) select 0, ((position player) select 1) + 4, 2];
	private cb_player = NEW(OO_PLAYER, _position);
	private cb_cubeworld = NEW(OO_CUBEWORLD, nil);
	private cb_keyhandler = NEW(OO_KEYHANDLER, nil);
	["createWall", _position] call cb_cubeworld;