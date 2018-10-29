//
//  CommonMacro.h
//  NoName
//
//  Created by Danish on 2018/10/26.
//  Copyright © 2018 Danish. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

/**
 *  Global Objects
 */
#define kAppDelegate            ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define kAppWindow              [UIApplication sharedApplication].delegate.window
#define kRootViewController     [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kNotifCenter            [NSNotificationCenter defaultCenter]

/**
 * Macro For Log
 */
#pragma mark - Log

#ifdef DEBUG
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

/**
 *  Macro For Device Info
 */
#pragma mark - Device Info

#define NN_ScreenW [UIScreen mainScreen].bounds.size.width
#define NN_ScreenH [UIScreen mainScreen].bounds.size.height

/**
 *
 */
#define NOT     !
#define IS_NULL !


#pragma mark - Funtion Method (宏 方法)

#define trimStr(str)            [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
// 拼接字符串
#define formatStr(format, ...)  [NSString stringWithFormat:format, ##__VA_ARGS__]

#define IMAGE(NAME)       [UIImage imageNamed:NAME]

/**
 *  弱引用对象
 *
 *  @param self 当前对象
 *
 *  @return 弱应用对象
 */
#define WEAKSELF typeof(self) __weak weakSelf = self;

/**
 *  强引用对象
 *
 *  @param self 当前对象
 *
 *  @return 强引用对象
 */
#define STRONGSELF typeof(self) __strong strongSelf = self;

//#pragma mark - Tools methods
///**
// *  判断一个对象是否为空
// *
// *  @param thing 对象
// *
// *  @return 返回结果
// */
//static inline BOOL ICIsObjectEmpty(id thing){
//    return thing == nil ||
//    ([thing isEqual:[NSNull null]]) ||
//    ([thing respondsToSelector:@selector(length)] && [(NSData *)thing length] == 0) ||
//    ([thing respondsToSelector:@selector(count)]  && [(NSArray *)thing count] == 0);
//}
//
///**
// *  判断一个字符串是否为0
// *
// *  @param string 字符串
// *
// *  @return 返回结果
// */
//static inline NSString *ICIsStringZero(NSString *string){
//
//    if (![string isKindOfClass:[NSString class]]) {
//
//        string = [NSString stringWithFormat:@"%@",string];
//    }
//
//    if ([string integerValue] == 0) {
//        return @"";
//    }
//
//    return string;
//}
//
///**
// *  判断一个字符串是否为空
// *
// *  @param string 字符串
// *
// *  @return 返回结果
// */
//static inline BOOL ICIsStringEmpty(NSString *string){
//
//    if (![string isKindOfClass:[NSString class]]) {
//
//        string = [NSString stringWithFormat:@"%@",string];
//    }
//
//    if (string == nil) {
//        return YES;
//    }
//
//    if (string.length == 0) {
//        return YES;
//    }
//
//    if ([string isEqualToString:@"<null>"]) {
//        return YES;
//    }
//
//    if ([string isEqualToString:@"(null)"]) {
//        return YES;
//    }
//
//    return NO;
//}


#endif /* CommonMacro_h */
