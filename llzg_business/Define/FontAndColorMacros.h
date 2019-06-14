//
//  FontAndColorMacros.h
//  llzg_business
//
//  Created by llzg on 2019/6/11.
//  Copyright © 2019 llzg. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h


#define NINENINEColor               UIColorMMDFromRGB(153, 153, 153, 1.0)
#define SIXSIXSIXColor              UIColorMMDFromRGB(102, 102, 102, 1.0)
#define THRTHRTHRColor              UIColorMMDFromRGB(51, 51, 51, 1.0)
// 指定的颜色值
#define UIColorMMDFromRGB(r, g, b, a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
// 十六进制颜色值(eg：0x19C5FF00)
#define HexColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f green:((float)((rgbValue & 0xFF00) >> 8))/255.0f blue:((float)(rgbValue & 0xFF))/255.0f alpha:1.0]

#define FONT_BSize(fontSize)        iOS_Version >= 9.0?[UIFont fontWithName:@"PingFangSC-Semibold" size:MYHeight(fontSize)] : [UIFont fontWithName:@".PingFang-SC-Semibold" size:MYHeight(fontSize)]
#define FONT_MSize(fontSize)        iOS_Version >= 9.0?[UIFont fontWithName:@"PingFangSC-Medium" size:MYHeight(fontSize)] : [UIFont fontWithName:@".PingFang-SC-Medium" size:MYHeight(fontSize)]
#define FONT_RSize(fontSize)        iOS_Version >= 9.0?[UIFont fontWithName:@"PingFangSC-Regular" size:MYHeight(fontSize)] : [UIFont fontWithName:@".PingFang-SC-Regular" size:MYHeight(fontSize)]

//View圆角和加边框
#define ViewBorderRadius(View,Radius,Width,Color)   [View.layer setCornerRadius:(Radius)];[View.layer setMasksToBounds:YES];[View.layer setBorderWidth:(Width)];[View.layer setBorderColor:[Color CGColor]]

// View圆角
#define ViewRadius(View,Radius)     [View.layer setCornerRadius:(Radius)];[View.layer setMasksToBounds:YES]


//property属性快速声明

#define PropertyCopy(s)             @property(nonatomic,copy)s

#define PropertyAssign(s)           @property(nonatomic,assign)s

#define PropertyStrong(s)           @property(nonatomic,strong)s

//拼接字符串

#define NSStringFormat(format,...)  [NSString stringWithFormat:format,##__VA_ARGS__]

//获取一段时间间隔

#define kStartTime      CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();

#define kEndTime        NSLog(@"Time: %f",CFAbsoluteTimeGetCurrent()- start)








#endif /* FontAndColorMacros_h */
