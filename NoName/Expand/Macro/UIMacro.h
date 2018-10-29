//
//  UIMacro.h
//  NoName
//
//  Created by Danish on 2018/10/26.
//  Copyright © 2018 Danish. All rights reserved.
//

#ifndef UIMacro_h
#define UIMacro_h


/**
 * Macro For Font
 */
#define NN_FONT(size) [UIFont systemFontOfSize:size]
#define NN_BoldFONT(size) [UIFont boldSystemFontOfSize:size]
#define NN_FONT_NAME(size) [UIFont fontWithName:name size:size]

/**
 * Macro For Color
 */
#define NN_HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define NN_COLOR_Tabbar_Selected  NN_HEXCOLOR(0x51C1B7)
#define NN_COLOR_Tabbar_UnSelected  NN_HEXCOLOR(0x999999)

#endif /* UIMacro_h */
