//
//  UtilsMacros.h
//  llzg_business
//
//  Created by llzg on 2019/6/11.
//  Copyright © 2019 llzg. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h


//获取系统对象

#define kApplication [UIApplication sharedApplication]

#define kAppWindow [UIApplication sharedApplication].delegate.window

#define kAppDelegate [AppDelegate shareAppDelegate]

#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController

#define kUserDefaults [NSUserDefaults standardUserDefaults]

#define kNotificationCenter [NSNotificationCenter defaultCenter]

//获取系统版本
#define iOS_Version [[[UIDevice currentDevice] systemVersion] floatValue]

//客户端版本号
#define CLIENT_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//取项目的 bundle  id
#define  KBundleAppName  [[[NSBundle mainBundle] infoDictionary] objectForKey:(__bridge NSString *)kCFBundleNameKey]

//取项目的 bundle  id
#define  KBundleIdentifier  [[NSBundle mainBundle] bundleIdentifier]

//取项目的 window
#define KEYWINDOW [UIApplication sharedApplication].keyWindow
#define APPDEL ((AppDelegate *)[UIApplication sharedApplication].delegate)

#ifndef __OPTIMIZE__
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
#ifndef __OPTIMIZE__
#define HCLog(fmt, ...) NSLog((@"[文件名 :%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define HCLog(...);
#endif

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

#define IFNONULLSTR(str)  [BaseMeans NULLString:str]?str:@""

// 获取CGSize
#define RectWithAttributeName(text, maxSize, font) [text length] > 0 ? [text boundingRectWithSize:CGSizeMake(maxSize, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{ NSFontAttributeName : font } context:nil].size : CGSizeZero


//是否是ipX
#define IsIPHONEX [[UIApplication sharedApplication] statusBarFrame].size.height>20?1:0
// 获取当前屏幕的宽度
#define SCWidth [UIScreen mainScreen].bounds.size.width
// 获取当前屏幕的高度
#define SCHeight [UIScreen mainScreen].bounds.size.height
#define SCMYHeight (SCHeight-tabBarheight+49)
#define MYWidth(with) ((with)*(SCWidth/375.0f))

#define MYHeight(height) ((height)*(IsIPHONEX?((SCHeight- 24 - 34)/667):(SCHeight / 667)))
#define navigationAppHeight (([UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height))
#define tabBarheight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)



#endif /* UtilsMacros_h */
