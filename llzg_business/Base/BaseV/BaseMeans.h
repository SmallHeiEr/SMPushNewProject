//
//  BaseMeans.h
//  YC.Cy
//
//  Created by Simon on 2017/4/11.
//  Copyright © 2017年 朱鹏飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseMeans : NSObject
//添加富文本
+ (NSAttributedString *)addTextString:(NSString *)str image:(UIImage *)img;
//空字符串置@“”
+ (BOOL)NULLString:(id)str;
//图片转url
+ (void)POSTimagePostData:(UIImage *)img name:(NSString *)name hudView:(UIView *)hudView success:(void(^)(id responseObject))responseOBJ filed:(void(^)(id error))err;
//截取图片
+ (NSMutableArray *)jieQuString:(NSString *)str;
//去空格
+(NSString *)strQuKong:(NSString *)str;
//数组和字典转Json字符串
+(NSString *)dictionaryToJsonString:(NSMutableDictionary *)dic;
+ (NSString *)arrayToJSONString:(NSMutableArray *)array;
//多字体颜色label
+ (NSMutableAttributedString *)labelAddMoreAttString:(NSMutableAttributedString *)attStr string:(NSString *)str color:(UIColor *)color font:(int)font tSpace:(float)space;
//+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
+ (UIColor*)colorFromHexRGB:(NSString *)inColorString alpha:(CGFloat)alpha;
//参数1：存到哪     参数2：
//按固定标准压缩图片
+ (NSData *)compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength;

+ (void)getAlertWithTitle:(NSString *)title message:(NSString *)massage vc:(UIViewController *)vc time:(NSTimeInterval)time;
//渐变
+ (void)JianBianWithLabel:(UILabel *)jLabel colors:(NSArray *)colors view:(UIView *)sView;
+ (NSString *)imageToString:(UIImage *)image;
+ (UIImage *)imageFromString:(NSString *)string;
+ (NSString *)firstCharactor:(NSString *)aString;
//自适应宽高
+ (CGFloat)getHeightWithStr:(NSString *)str height:(CGFloat)height fontSize:(UIFont *)size;
+ (CGFloat)getHeightWithStr:(NSString *)str width:(CGFloat)width fontSize:(UIFont *)size;
//颜色转化为uiimg
+ (UIImage *)imageWithColor:(UIColor *)color;
//手机号规格
+ (BOOL)isMobileNumber:(NSString *)mobileNum;
//姓名格式
+ (BOOL) deptNumInputShouldName:(NSString *)str;
//密码长度大于8位必须同时包含数字和字母
+(BOOL)judgePassWordLegal:(NSString *)pass;
//时间戳转换成时间阶段
+(NSString *)handleDate:(NSString *)time_Stamp;
//时间转成时间戳
+ (NSString *)timeWithTimeString:(NSString *)timeString;
//时间戳转换成时间
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString type:(NSInteger)type;

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;


// 生成image
+ (UIImage *)GetmakeImageWithView:(UIView *)view andWithSize:(CGSize)size;
@end
