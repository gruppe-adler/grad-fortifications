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
        class addFortRemote {};
        class allowDemolition {};
        class doAnimation {};
        class getDisplayName {};
        class getModuleRoot {};
        class getObjectSize {};
        class initModule {postInit = 1;};
        class removeFort {};
        class setCollisionDebugMode {};
        class stopAnimation {};
    };

    class drop {
        file = MODULES_DIRECTORY\grad-fortifications\functions\drop;

        class buildDroppedClient {};
        class dropFort {};
        class initDropCrate {};
        class requestInteractionServer {};
    };


    class place {
        file = MODULES_DIRECTORY\grad-fortifications\functions\place;

        class addKeyEHs {};
        class addMouseEHs {};
        class addUpdatePFH {};
        class cancelPlacement {};
        class demolish {};
        class hideObjectClients {};
        class initFort {};
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
        class loadFortDialog {};
        class onSelChanged {};
        class openHint {};
        class rotateModel {};
        class updateHint {};
        class updateItemList {};
        class updateModel {};
    };
};
