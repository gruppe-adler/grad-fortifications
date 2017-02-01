#define grad_fortifications_vehicle_ITEMLIST                42100
#define grad_fortifications_vehicle_ITEMLISTTITLEVEHICLE    42101
#define grad_fortifications_vehicle_ITEMLISTTITLE           42102
#define grad_fortifications_vehicle_TAKEBUTTON              42103
#define grad_fortifications_vehicle_STOREBUTTON             42104

#define grad_fortifications_vehicle_BG_W                    (3*grad_fortifications_Padding_X + 4*grad_fortifications_Column_W + 2*grad_fortifications_ItemSpace_X + grad_fortifications_Item_W)
#define grad_fortifications_vehicle_BG_X                    CENTER(1, grad_fortifications_vehicle_BG_W)

#define grad_fortifications_vehicle_Column1_X               (grad_fortifications_vehicle_BG_X + grad_fortifications_Padding_X)
#define grad_fortifications_vehicle_Button_X                (grad_fortifications_vehicle_Column1_X + grad_fortifications_Column_W + grad_fortifications_ItemSpace_X)
#define grad_fortifications_vehicle_Column2_X               (grad_fortifications_vehicle_Button_X + grad_fortifications_Item_W + grad_fortifications_ItemSpace_X)
#define grad_fortifications_vehicle_Column3_X               (grad_fortifications_vehicle_Column2_X + grad_fortifications_Column_W + grad_fortifications_Padding_X)

#define grad_fortifications_vehicle_Button_Y                CENTER(1, 2*grad_fortifications_Item_H + grad_fortifications_ItemSpace_Y)
