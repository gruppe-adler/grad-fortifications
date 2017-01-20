//CONTROLS =====================================================================
#define grad_fortifications_DIALOG          42000
#define grad_fortifications_TITLE           42001
#define grad_fortifications_ITEMLIST        42002
#define grad_fortifications_BUILDBUTTON     42003
#define grad_fortifications_DROPBUTTON      42004
#define grad_fortifications_3DMODEL         42005


//DIMENSIONS AND POSITIONS =====================================================
#define grad_fortifications_textSize       (0.04 * TEXT_SCALE)

#define grad_fortifications_Item_H         (0.025 * Y_SCALE)
#define grad_fortifications_Item_W         (0.025 * X_SCALE)
#define grad_fortifications_ItemSpace_Y    (0.0025 * Y_SCALE)
#define grad_fortifications_ItemSpace_X    (0.0025 * X_SCALE)

#define grad_fortifications_Padding_Y      (0.5 * grad_fortifications_Item_H)
#define grad_fortifications_Padding_X      (0.5 * grad_fortifications_Item_W)

#define grad_fortifications_Column_W       (0.35 * X_SCALE)
#define grad_fortifications_Column_H       (0.4 * Y_SCALE)

#define grad_fortifications_Column1_X      (grad_fortifications_BG_X + grad_fortifications_Padding_X)
#define grad_fortifications_Column2_X      (grad_fortifications_Column1_X + grad_fortifications_Column_W + grad_fortifications_Padding_X)

#define grad_fortifications_Itemlist_H     (grad_fortifications_Column_H - grad_fortifications_Item_H - grad_fortifications_ItemSpace_Y)
#define grad_fortifications_Picture_H      (0.4* (grad_fortifications_Column_H-grad_fortifications_ItemSpace_Y))
#define grad_fortifications_Description_H  (0.6* (grad_fortifications_Column_H-grad_fortifications_ItemSpace_Y))

#define grad_fortifications_BG_W           (3*grad_fortifications_Padding_X + 3*grad_fortifications_Column_W)
#define grad_fortifications_BG_H           (2*grad_fortifications_Padding_Y + grad_fortifications_Column_H)
#define grad_fortifications_BG_X           CENTER(1, grad_fortifications_BG_W)
#define grad_fortifications_BG_Y           CENTER(1, grad_fortifications_BG_H)

#define grad_fortifications_Button_W       (0.2 * X_SCALE)

#define grad_fortifications_CloseButton_W  (grad_fortifications_Item_H - (2 * grad_fortifications_ItemSpace_Y))
#define grad_fortifications_TopBar_Y       (grad_fortifications_BG_Y - grad_fortifications_Item_H * 1.1)
