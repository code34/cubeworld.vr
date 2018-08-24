	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2018 Nicolas BOITEUX

	CLASS OO_CUBEWORLD 
	
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

	CLASS("OO_CUBEWORLD")
		PRIVATE VARIABLE("array", "walls");
		PRIVATE VARIABLE("code","this");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_CUBEWORLD::constructor")
			MEMBER("walls", []);
		};

		PUBLIC FUNCTION("array","createWall") {
			DEBUG(#, "OO_CUBEWORLD::createWall")
			private _wall = objNull;
			private _walls = [
				// ground
				[[(_this select 0), (_this select 1), 0], 0],
				// roof
				[[(_this select 0), (_this select 1), 10], 0],
				// back
				[[(_this select 0), (_this select 1) - 5, 5], 180],
				// left
				[[(_this select 0)-5, (_this select 1), 5], 270],
				// right
				[[(_this select 0)+5, (_this select 1), 5], 90],
				// front
				[[(_this select 0), (_this select 1) + 5, 5], 0]
				];

			{
				_wall =  "UserTexture10m_F" createVehicle (_x select 0);
				_wall setPos (_x select 0);
				_wall setDir (_x select 1);
				MEMBER("walls", nil)  pushBack _wall;
			} forEach _walls;
			(MEMBER("walls", nil) select 0) setVectorDirAndUp [[0,0,-1],[0,1,0]];
			(MEMBER("walls", nil) select 1) setVectorDirAndUp [[0,0,1],[0,1,0]];
		};

		PUBLIC FUNCTION("array","rotateTexture") {
			_jpg = selectRandom _this;
			{
				["applyTexture", [_x, _jpg]] call MEMBER("this", nil);
				sleep 0.1;
			}foreach [0,1,2,3,4,5,6];
		};

		PUBLIC FUNCTION("array","applyTexture") {
			DEBUG(#, "OO_CUBEWORLD::applyTexture")
			(MEMBER("walls", nil) select (_this select 0)) setObjectTexture [0, (_this select 1)];
		};

		PUBLIC FUNCTION("","getThis") FUNC_GETVAR("this");

		PUBLIC FUNCTION("","deconstructor") { 
			DEBUG(#, "OO_CUBEWORLD::deconstructor")
			DELETE_VARIABLE("walls");
			DELETE_VARIABLE("this");
		};
	ENDCLASS;