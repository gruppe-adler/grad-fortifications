# GRAD Fortifications (WIP)
GRAD Fortifications will be an object placement system similar to [Plank](https://github.com/kami-/plank), but more user friendly for mission creators and players.

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)
* [ACE3](https://github.com/acemod/ACE3)

## Installation

### Manually
1. Create a folder in your mission root folder and name it `modules`. Then create one inside there and call it `grad-fortifications`.
2. Download the contents of this repository ( there's a download link at the side ) and put it into the directory you just created.
3. Append the following lines of code to the `description.ext`:

```sqf
#include "modules\grad-fortifications\grad_fortifications.hpp"

class CfgFunctions {
    #include "modules\grad-fortifications\cfgFunctions.hpp"
};

class RscTitles {
    #include "modules\grad-fortifications\dialog\hint\title.hpp"

    class Default {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    };
};
```

### Via `npm`
_for details about what npm is and how to use it, look it up on [npmjs.com](https://www.npmjs.com/)_

1. Install package `grad-fortifications` : `npm install --save grad-fortifications`
2. Append the following lines of code to the `description.ext`:

```sqf
#define MODULES_DIRECTORY node_modules
#include "node_modules\grad-fortifications\grad_fortifications.hpp"

class CfgFunctions {
    #include "node_modules\grad-fortifications\cfgFunctions.hpp"
};

class RscTitles {
    #include "node_modules\grad-fortifications\dialog\hint\title.hpp"

    class Default {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    };
};
```

## Usage
### Build Fortifications
To build a fortification, open up your fortification menu with ACE-Selfinteraction go to Equipment and Fortifications. If the action is not shown, you don't have any fortifications in your inventory.

Select a fortification from the menu and hit build to start placement. Collision lines will be drawn around the object. If any line is red, that line is colliding with something. If all lines are yellow, the fortification is not on the ground.

Use the mousewheel to manipulate the fortification. Use any of these modifier keys:

Modifier Key | Effect
-------------|--------------------------------------
none         | change distance to player
shift        | rotate around z-axis
ctrl         | change height above ground
alt          | increase speed of other manipulations

### Drop Fortifications
You can also drop fortifications from your inventory by selecting it and hitting the *Drop* key. This will create a wooden crate near your current position. You and other players can interact with this crate with ACE and drag or carry it, load it into vehicles, pick it up into your fortification inventory, or build it directly. When canceling the placement of a fortification that you started directly, the fortification will go back into its crate on the current position.

## Functions
### Add Fortifications
To add fortifications to a unit use `[unit,type,amount] call grad_fortifications_fnc_addFort`:

Parameter | Explanation
----------|-----------------------------------------------------------------------
unit      | Object - The unit to add the fortification to.
type      | String - The type of fortification.
amount    | Number - The amount of fortifications to add (optional). Default is 1.

### Remove Fortifications
To remove fortifications from a unit use `[unit,type,amount] call grad_fortifications_fnc_removeFort`:

Parameter | Explanation
----------|--------------------------------------------------------------------------
unit      | Object - The unit to remove the fortification from.
type      | String - The type of fortification.
amount    | Number - The amount of fortifications to remove (optional). Default is 1.

### Collision Debug Mode
If one of your fortifications is hard to place, you can turn on the collision debug mode to see what's causing problems with `[debugMode] call grad_fortifications_fnc_setCollisionDebugMode`:

Parameter | Explanation
----------|----------------------------------
debugMode | Bool - Turn debug mode on or off.

## Configuration
This is entirely optional. Any object will work as a fortification out of the box. However you can configure fortifications if they don't work the way you like.

Add the class `CfgGradFortifications` to your `description.ext`, then put the fortifications that you want to configure into that class. These attributes are available:

Attribute       | Default Value | Explanation
----------------|---------------|-------------------------------------------------------------------------------
boundingBoxSize | 1             | size factor of bounding box - smaller means collision detection is less strict
canFloat        | 0             | can this fortification be placed while floating? (1/0)
canCollide      | 0             | can this fortification be placed while colliding with other objects? (1/0)
surfaceNormal   | 1             | will this fortification automatically adjust its up-vector to terrain? (1/0)

### Example:

```sqf
class CfgGradFortifications {
    class Land_BagFence_Long_F {
        boundingBoxSize = 1;
        canFloat = 1;
        canCollide = 1;
    };

    class Land_HBarrier_5_F {
        boundingBoxSize = 0.8;
        surfaceNormal = 0;
    };
};
```

***

## Credits
### Creative Commons
https://creativecommons.org/licenses/by/3.0/

1. Fortifications action icon (slight modifications to improve low resolution display): *Sandbags* by Chris from the Noun Project
2. Checkmark icon (modified): *checkmark* by ✦ Shmidt Sergey ✦ from the Noun Project
3. Not on ground icon (modified): *Error* by Shastry from the Noun Project
4. Collision icon (modified): *Cross* by Doub.co from the Noun Project

### Flaticon Basic
http://file000.flaticon.com/downloads/license/license.pdf

1. Shift key icon (also modified to show ctrl and alt instead):  
Made by [Freepik](http://www.flaticon.com/authors/freepik) from www.flaticon.com
