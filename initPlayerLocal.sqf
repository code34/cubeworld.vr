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

	#include "oop.h"

	call compile preprocessFileLineNumbers "oo_cubeworld.sqf";
	setDate [2018, 1, 1, 8, 0];

	private _cubeworld = NEW(OO_CUBEWORLD, nil);
	
	["createWall", position player] call _cubeworld;
	["rotateTexture", ["fond1.jpg", "fond2.jpg", "fond3.jpg", "fond4.jpg"]] spawn _cubeworld;
