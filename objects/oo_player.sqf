	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2018 Nicolas BOITEUX

	CLASS OO_PLAYER
	
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

	CLASS("OO_PLAYER")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("code","health");
		PRIVATE VARIABLE("object","camera");

		PUBLIC FUNCTION("array","constructor") { 
			DEBUG(#, "OO_PLAYER::constructor")
			MEMBER("health", 100);
			player setDir 0;
			player enablesimulation false;
			hideObject player;
		};

		PUBLIC FUNCTION("","cameraShake") {
			DEBUG(#, "OO_PLAYER::cameraShake")
			enableCamShake true;
			addCamShake [1, 0.5, 25];
		};

		PUBLIC FUNCTION("","moveTo") {
			DEBUG(#, "OO_PLAYER::moveTo")
			if(random 1 > 0.5) then {
				MEMBER("cameraShake", nil);
			} else {
				["rotateTexture", [
					"textures\foret.jpg", 
					"textures\mousse.jpg", 
					"textures\mur.jpg", 
					"textures\mur2.jpg",
					"textures\fond1.jpg",
					"textures\fond2.jpg",
					"textures\fond3.jpg",
					"textures\fond4.jpg"
				]] spawn cb_cubeworld;
			};
		};

		PUBLIC FUNCTION("","deconstructor") { 
			DEBUG(#, "OO_PLAYER::deconstructor")
			DELETE VARIABLE("this");
			DELETE VARIABLE("health");
			DELETE VARIABLE("camera");
		};
	ENDCLASS;