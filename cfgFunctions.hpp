#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_fortifications {
    class common {
        file = MODULES_DIRECTORY\grad-fortifications\functions;


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
};
