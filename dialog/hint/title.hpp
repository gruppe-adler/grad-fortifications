#include "..\ui_toolkit.hpp"
#include "defines.hpp"

class grad_fortifications_hintLine {
	access = 0;
	type = CT_STATIC;
    style = ST_LEFT;
	idc = -1;
	colorBackground[] = { 0,0,0, 0.8 };
	colorText[] = {1, 1, 1, 1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
    w = grad_fortifications_hint_W;
	h = grad_fortifications_hint_H;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "PuristaLight";
	sizeEx = 0.04 * TEXT_SCALE;
	linespacing = 1;
    duration = 1e+1000;
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

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 0*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic1: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE1;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
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

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 1*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic2: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE2;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
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

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 2*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic3: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE3;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
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

            w = grad_fortifications_hint_Text_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_Text_X;
            y = grad_fortifications_hint_Y + 3*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
        class Pic4: grad_fortifications_RscPicture {
            idc = grad_fortifications_hint_PIC_LINE4;

            w = grad_fortifications_hint_W;
            h = grad_fortifications_hint_H;
            x = grad_fortifications_hint_X;
            y = grad_fortifications_hint_Y + 3*(grad_fortifications_spacing_Y + grad_fortifications_hint_H);
        };
    };
};
