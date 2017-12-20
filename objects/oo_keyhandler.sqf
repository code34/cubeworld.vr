	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2018 Nicolas BOITEUX

	CLASS OO_KEYHANDLER
	
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

	CLASS("OO_KEYHANDLER")
		PRIVATE VARIABLE("code","this");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_KEYHANDLER::constructor")
			waitUntil {!(isNull (findDisplay 46))};
			MEMBER("keyHandler", nil);
		};

		PUBLIC FUNCTION("","keyHandler") {
			DEBUG(#, "OO_KEYHANDLER::keyHandler")
			(findDisplay 46) displayAddEventHandler ["KeyDown", format[" ['keyCatcher', _this] call %1", MEMBER("this", nil)]];
		};

		PUBLIC FUNCTION("array","keyCatcher") {
			switch (_this select 1) do { 
				case 17 : { MEMBER("keyUp", nil); }; 
				case 31 : { MEMBER("keyDown", nil); }; 
				case 30 : { MEMBER("keyLeft", nil); }; 
				case 32 : { MEMBER("keyRight", nil); }; 
				default {  /*...code...*/ }; 
			};
		};

		PUBLIC FUNCTION("","keyUp") { hint "UP"; };
		PUBLIC FUNCTION("","keyDown") { hint "DOWN"; };
		PUBLIC FUNCTION("","keyLeft") { hint "LEFT"; };
		PUBLIC FUNCTION("","keyRight") { hint "RIGHT"; };

		PUBLIC FUNCTION("","deconstructor") { 
			DEBUG(#, "OO_KEYHANDLER::deconstructor")
			DELETE VARIABLE("this");
		};
	ENDCLASS;