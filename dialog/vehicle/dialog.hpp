class grad_fortifications_vehicle: grad_fortifications {
    class ControlsBackground: ControlsBackground {
        class MainBackground: MainBackground {
            x = grad_fortifications_vehicle_BG_X;
            w = grad_fortifications_vehicle_BG_W;
        };
        class TopBar: TopBar {
            x = grad_fortifications_vehicle_BG_X;
            w = grad_fortifications_vehicle_BG_W;
        };
        class DialogTitleText: DialogTitleText {
            x = grad_fortifications_vehicle_BG_X;
            text = "FORTIFICATIONS";
        };

        class ItemListBG1: ItemListBG {
            x = grad_fortifications_vehicle_Column1_X;
        };
        class ItemListBG2: ItemListBG {
            x = grad_fortifications_vehicle_Column2_X;
        };

        class PreviewPictureBG: PreviewPictureBG {
            x = grad_fortifications_vehicle_Column3_X;
        };
    };

    class Controls: Controls {
        class ItemListVehicleTitle: grad_fortifications_RscText {
            idc = grad_fortifications_vehicle_ITEMLISTTITLEVEHICLE;
            x = grad_fortifications_vehicle_Column1_X;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y;
            w = grad_fortifications_Column_W;
            h = grad_fortifications_Item_H;

            sizeEx = 0.035 * TEXT_SCALE;
            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R', 0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",
                0.7
            };
        };

        class ItemListVehicle: ItemList {
            idc = grad_fortifications_vehicle_ITEMLIST;
            x = grad_fortifications_vehicle_Column1_X;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y + grad_fortifications_ItemSpace_Y + grad_fortifications_Item_H;
            h = grad_fortifications_Column_H - 2*grad_fortifications_ItemSpace_Y - grad_fortifications_Item_H;
            onLBSelChanged = "_this call grad_fortifications_fnc_onSelChanged";
        };

        class ItemListTitle: grad_fortifications_RscText {
            idc = grad_fortifications_vehicle_ITEMLISTTITLE;
            x = grad_fortifications_vehicle_Column2_X;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y;
            w = grad_fortifications_Column_W;
            h = grad_fortifications_Item_H;

            sizeEx = 0.035 * TEXT_SCALE;
            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R', 0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",
                0.7
            };
        };

        class ItemList: ItemList {
            idc = grad_fortifications_ITEMLIST;
            x = grad_fortifications_vehicle_Column2_X;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y + grad_fortifications_ItemSpace_Y + grad_fortifications_Item_H;
            h = grad_fortifications_Column_H - 2*grad_fortifications_ItemSpace_Y - grad_fortifications_Item_H;
            onLBSelChanged = "_this call grad_fortifications_fnc_onSelChanged";
        };

        class StoreButton: grad_fortifications_RscButton {
            idc = grad_fortifications_vehicle_STOREBUTTON;
            style = ST_CENTER;

            x = grad_fortifications_vehicle_Button_X;
            y = grad_fortifications_vehicle_Button_Y;
            w = grad_fortifications_Item_W;
            h = grad_fortifications_Item_H;

            colorBackground[] = {0,0.8,0,0.8};
            text = "<";
            action = "['STORE'] call grad_fortifications_fnc_requestStoreTake";
        };

        class TakeButton: grad_fortifications_RscButton {
            idc = grad_fortifications_vehicle_TAKEBUTTON;
            style = ST_CENTER;

            x = grad_fortifications_vehicle_Button_X;
            y = grad_fortifications_vehicle_Button_Y + grad_fortifications_Item_H + grad_fortifications_ItemSpace_Y;
            w = grad_fortifications_Item_W;
            h = grad_fortifications_Item_H;

            colorBackground[] = {0,0.8,0,0.8};
            text = ">";
            action = "['TAKE'] call grad_fortifications_fnc_requestStoreTake";
        };

        class BuildButton: BuildButton {
            idc = grad_fortifications_BUILDBUTTON;
            text = "BUILD";
            action = "[] call grad_fortifications_fnc_doBuild; closeDialog 0";

            x = grad_fortifications_vehicle_BG_X + grad_fortifications_vehicle_BG_W - grad_fortifications_Button_W;
            y = grad_fortifications_BG_Y + grad_fortifications_BG_H + grad_fortifications_ItemSpace_Y;
            w = grad_fortifications_Button_W;
            h = grad_fortifications_Item_H;
        };

        class CloseButton: CloseButton {
            x = grad_fortifications_vehicle_BG_X + grad_fortifications_vehicle_BG_W - grad_fortifications_ItemSpace_X - grad_fortifications_CloseButton_W;
        };
    };

    class Objects: Objects {
        class previewModel: previewModel {
            x = grad_fortifications_vehicle_Column3_X + grad_fortifications_Column_W;
            y = grad_fortifications_BG_Y + grad_fortifications_Padding_Y + 0.5*grad_fortifications_Column_H;
            z = 0.2;

            xBack = grad_fortifications_vehicle_Column3_X + grad_fortifications_Column_W;
            yBack = grad_fortifications_BG_Y + grad_fortifications_Padding_Y + 0.5*grad_fortifications_Column_H;
            zBack = 1.2;
        };
    };
};
