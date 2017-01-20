#include "..\ui_toolkit.hpp"
#include "defines.hpp"

class grad_fortifications_empty {
    idd = -1;
    fadein = 0;
    fadeout = 0;
    duration = 0;
};

class grad_fortifications_hint {
    idd = grad_fortifications_hint_TITLE;
    duration = 99999;

    enableSimulation = 1;
    enableDisplay = 1;

    onLoad = "uiNamespace setVariable ['grad_fortifications_hint', _this select 0];";
    onUnload = "uiNamespace setVariable ['grad_fortifications_hint', displayNull];";

    class ControlsBackground {
        class BG1: grad_fortifications_RscText {
            idc = grad_fortifications_hint_BG_LINE1;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
            y = grad_fortifications_hint_Y + 0*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);

            colorBackground[] = {0,0,0,0.65};
        };
        class Text1: grad_fortifications_RscText {
            idc = grad_fortifications_hint_TXT_LINE1;

			sizeEx = grad_fortifications_hint_textScale;

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 0*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic1: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE1;

            w = grad_fortifications_hint_picture_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X + grad_fortifications_spacing_X;
            y = grad_fortifications_hint_Y + 0*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };

        class BG2: grad_fortifications_RscText {
            idc = grad_fortifications_hint_BG_LINE2;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
            y = grad_fortifications_hint_Y + 1*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);

            colorBackground[] = {0,0,0,0.65};
        };
        class Text2: grad_fortifications_RscText {
            idc = grad_fortifications_hint_TXT_LINE2;

			sizeEx = grad_fortifications_hint_textScale;

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 1*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic2: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE2;

            w = grad_fortifications_hint_picture_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X + grad_fortifications_spacing_X;
            y = grad_fortifications_hint_Y + 1*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };

        class BG3: grad_fortifications_RscText {
            idc = grad_fortifications_hint_BG_LINE3;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
            y = grad_fortifications_hint_Y + 2*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);

            colorBackground[] = {0,0,0,0.65};
        };
        class Text3: grad_fortifications_RscText {
            idc = grad_fortifications_hint_TXT_LINE3;

			sizeEx = grad_fortifications_hint_textScale;

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 2*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic3: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE3;

            w = grad_fortifications_hint_picture_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X + grad_fortifications_spacing_X;
            y = grad_fortifications_hint_Y + 2*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };

        class BG4: grad_fortifications_RscText {
            idc = grad_fortifications_hint_BG_LINE4;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
            y = grad_fortifications_hint_Y + 3*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);

            colorBackground[] = {0,0,0,0.65};
        };
        class Text4: grad_fortifications_RscText {
            idc = grad_fortifications_hint_TXT_LINE4;

			sizeEx = grad_fortifications_hint_textScale;

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 3*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic4: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE4;

            w = grad_fortifications_hint_picture_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X + grad_fortifications_spacing_X;
            y = grad_fortifications_hint_Y + 3*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };

        class BG5: grad_fortifications_RscText {
            idc = grad_fortifications_hint_BG_LINE5;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
            y = grad_fortifications_hint_Y + 4*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);

            colorBackground[] = {0,0,0,0.65};
        };
        class Text5: grad_fortifications_RscText {
            idc = grad_fortifications_hint_TXT_LINE5;

			sizeEx = grad_fortifications_hint_textScale;

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 4*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic5: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE5;

            w = grad_fortifications_hint_picture_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X + grad_fortifications_spacing_X;
            y = grad_fortifications_hint_Y + 4*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
    };
};
