class grad_fortifications {
    idd = grad_fortifications_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    class ControlsBackground {
        class MainBackground: grad_fortifications_RscBackground {
            x = grad_fortifications_BG_X;
            y = grad_fortifications_BG_Y;
            w = grad_fortifications_BG_W;
            h = grad_fortifications_BG_H;
        };

        class TopBar: grad_fortifications_RscBackground {
            x = grad_fortifications_BG_X;
            y = grad_fortifications_TopBar_Y;
            w = grad_fortifications_BG_W;
            h = grad_fortifications_Item_H;

            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R', 0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",
                1
            };
        };

        class DialogTitleText: grad_fortifications_RscText {
            idc = grad_fortifications_TITLE;
            text = "MY FORTIFICATIONS";
            sizeEx = 0.04 * TEXT_SCALE;

            x = grad_fortifications_BG_X;
            y = grad_fortifications_TopBar_Y;
            w = grad_fortifications_BG_W;
            h = grad_fortifications_Item_H;
        };

        class ItemListBG: grad_fortifications_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,0.4};

            x = grad_fortifications_Column1_X;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y;
            w = grad_fortifications_Column_W;
            h = grad_fortifications_Column_H;
        };

        class PreviewPictureBG: grad_fortifications_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,0.4};

            x = grad_fortifications_Column2_X;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y;
            w = 2*grad_fortifications_Column_W;
            h = grad_fortifications_Column_H;
        };
    };

    class Controls {
        class ItemList: grad_fortifications_RscListNBox {
            idc = grad_fortifications_ITEMLIST;

            x = grad_fortifications_Column1_X;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y + grad_fortifications_ItemSpace_Y;
            w = grad_fortifications_Column_W;
            h = grad_fortifications_Column_H - 2*grad_fortifications_ItemSpace_Y;

            onLBSelChanged = "_this call grad_fortifications_fnc_onSelChanged";
        };

        class BuildButton: grad_fortifications_RscButton {
            idc = grad_fortifications_BUILDBUTTON;
            text = "BUILD";
            action = "['NORMAL'] call grad_fortifications_fnc_doBuild; closeDialog 0";

            x = grad_fortifications_BG_X + grad_fortifications_BG_W - grad_fortifications_Button_W;
            y = grad_fortifications_BG_Y + grad_fortifications_BG_H + grad_fortifications_ItemSpace_Y;
            w = grad_fortifications_Button_W;
            h = grad_fortifications_Item_H;
        };

        class DropButton: grad_fortifications_RscButton {
            idc = grad_fortifications_DROPBUTTON;
            text = "DROP";
            action = "_this call grad_fortifications_fnc_doDrop";

            x = grad_fortifications_BG_X + grad_fortifications_BG_W - grad_fortifications_ItemSpace_X - 2*grad_fortifications_Button_W;
            y = grad_fortifications_BG_Y + grad_fortifications_BG_H + grad_fortifications_ItemSpace_Y;
            w = grad_fortifications_Button_W;
            h = grad_fortifications_Item_H;
        };

        class CloseButton: grad_fortifications_RscCloseButton {
          idc = -1;
          x = grad_fortifications_BG_X + grad_fortifications_BG_W - grad_fortifications_ItemSpace_X - grad_fortifications_CloseButton_W;
          y = grad_fortifications_TopBar_Y + grad_fortifications_ItemSpace_Y;
          w = grad_fortifications_CloseButton_W;
          h = grad_fortifications_CloseButton_W;
        };
    };

    class Objects {
        class previewModel {
            idc = grad_fortifications_3DMODEL;
            type = 82;
            model = "\A3\Structures_F\Items\Food\Can_V3_F.p3d";
            scale = 0.05;

            direction[] = {-0.40, 0.35, 0.65};
			up[] = {0, 0.65, -0.35};

            x = grad_fortifications_Column2_X + grad_fortifications_Column_W;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y + 0.5*grad_fortifications_Column_H;
            z = 0.2;

            xBack = grad_fortifications_Column2_X + grad_fortifications_Column_W;
            yBack = grad_fortifications_BG_Y + grad_fortifications_Padding_Y + 0.5*grad_fortifications_Column_H;
            zBack = 1.2;

            inBack = 1;
            enableZoom = 0;
            zoomDuration = 0.001;
            onLoad = "_this call grad_fortifications_fnc_rotateModel;";
        };
    };
};
