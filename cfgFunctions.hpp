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
        class getDisplayName {};
        class getObjectSize {};
        class initModule {postInit = 1;};
        class removeFort {};
    };

    class drop {
        file = MODULES_DIRECTORY\grad-fortifications\functions\drop;

        class dropFort {};
        class initDropCrate {};
    };


    class place {
        file = MODULES_DIRECTORY\grad-fortifications\functions\place;

        class addKeyEHs {};
        class addMouseEHs {};
        class addUpdatePFH {};
        class cancelPlacement {};
        class placeFortification {};
        class removeAllEHs {};
        class setDirection {};
        class setPosition {};
        class spawnFortification {};
        class startPlacement {};
    };

    class ui {
        file = MODULES_DIRECTORY\grad-fortifications\functions\ui;

        class doBuild {};
        class doDrop {};
        class loadFortDialog {};
        class onSelChanged {};
        class rotateModel {};
        class updateItemList {};
        class updateModel {};
    };
};
