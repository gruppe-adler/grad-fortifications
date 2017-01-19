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
```

## Usage
### Build Fortifications
To build a fortification, open up your fortification menu with ACE-Selfinteraction go to Equipment and Fortifications. If the action is not shown, you don't have any fortifications in your inventory.

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
