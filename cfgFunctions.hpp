#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_fortifications {
    class collision {
        file = MODULES_DIRECTORY\grad-fortifications\functions\collision;

        class checkCollisionPFH {};
        class getBoundingLines {};
        class getGroundLines {};
        class getVisualLines {};
        class isColliding {};
        class isOnGround {};
        class linesToWorld {};
        class shrinkLines {};
    };

    class common {
        file = MODULES_DIRECTORY\grad-fortifications\functions\common;

        class addFort {};
        class addVehicleInteractions {};
        class allowDemolition {};
        class allowPackUp {};
        class canTake {};
        class doAnimation {};
        class getDisplayName {};
        class getModuleRoot {};
        class getObjectSize {};
        class getVehicleInventorySize {};
        class initModule {postInit = 1;};
        class initSettings {preInit = 1;};
        class isOwner {};
        class isVehicle {};
        class removeFort {};
        class setBuildTimeFactor {};
        class setCollisionDebugMode {};
        class setDemolishTimeFactor {};
        class setPackUpTimeFactor {};
        class stopAnimation {};
        class storageAction {};
    };

    class drop {
        file = MODULES_DIRECTORY\grad-fortifications\functions\drop;

        class dropFort {};
        class initDropCrate {};
        class requestInteractionServer {};
        class respondInteractionClient {};
    };


    class place {
        file = MODULES_DIRECTORY\grad-fortifications\functions\place;

        class addKeyEHs {};
        class addMouseEHs {};
        class addUpdatePFH {};
        class cancelPlacement {};
        class demolish {};
        class initFort {};
        class packUp {};
        class placeFortification {};
        class removeAllEHs {};
        class setDirection {};
        class setPosition {};
        class setUp {};
        class spawnFortification {};
        class startPlacement {};
    };

    class ui {
        file = MODULES_DIRECTORY\grad-fortifications\functions\ui;

        class doBuild {};
        class doDrop {};
        class doTake {};
        class loadFortDialog {};
        class loadVehicleDialog {};
        class onSelChanged {};
        class openHint {};
        class rotateModel {};
        class updateButtons {};
        class updateHint {};
        class updateItemList {};
        class updateListTitles {};
        class updateModel {};
    };

    class vehicle {
        file = MODULES_DIRECTORY\grad-fortifications\functions\vehicle;

        class requestStoreTake {};
        class respondStoreTake {};
    };
};
