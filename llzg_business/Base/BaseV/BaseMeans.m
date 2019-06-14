//
//  BaseMeans.m
//  YC.Cy
//
//  Created by Simon on 2017/4/11.
//  Copyright © 2017年 朱鹏飞. All rights reserved.
//

#import "BaseMeans.h"
//#import "YYText.h"

//#import <YYTextView.h>

@implementation BaseMeans
+ (BOOL)NULLString:(id)str {
    if (str == nil) {
        return NO;
    } else if ([str isEqual:[NSNull null]]) {
        return NO;
    } else {
        return YES;
    }
}
+(NSString *)strQuKong:(NSString *)str {
    NSString *quStr = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return quStr;
}
+(NSString *)dictionaryToJsonString:(NSMutableDictionary *)dic
{
    NSError *error = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    
    if (error) {
        return nil;
    }
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
+ (NSAttributedString *)addTextString:(NSString *)str image:(UIImage *)img {
    
    
    
    NSDictionary *dic = @{
                          NSFontAttributeName:FONT_RSize(14),
                          NSKernAttributeName:@(MYWidth(0.5)),
                          NSForegroundColorAttributeName:SIXSIXSIXColor,
                          };
 
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
        [attStr addAttributes:dic range:NSMakeRange(0, attStr.length)];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 5;
        imageView.frame = CGRectMake(0, 0, (SCWidth - MYWidth(30)), (SCWidth - MYWidth(30))/img.size.width *img.size.height);
    
//        NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:imageView contentMode:UIViewContentModeScaleAspectFit attachmentSize:imageView.frame.size alignToFont:FONT_RSize(14) alignment:YYTextVerticalAlignmentCenter];
//        [attStr appendAttributedString:attachText];
    
    return attStr;
}
+ (NSString *)arrayToJSONString:(NSMutableArray *)array

{
    
    NSError *error = nil;

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
 
    return jsonString;
}


//渐变
//colors 渐变的颜色
//locations 渐变颜色的分割点
//startPoint&endPoint 颜色渐变的方向，范围在(0,0)与(1.0,1.0)之间，如(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
+ (UIColor*)colorFromHexRGB:(NSString *)inColorString alpha:(CGFloat)alpha
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:alpha];
    return result;
}
+ (void)JianBianWithLabel:(UILabel *)jLabel colors:(NSArray *)colors view:(UIView *)sView  {
    // 创建渐变层
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = jLabel.frame;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [sView.layer addSublayer:gradientLayer];
    gradientLayer.mask = jLabel.layer;
    jLabel.frame = gradientLayer.bounds;
}
+ (void)getAlertWithTitle:(NSString *)title message:(NSString *)massage vc:(UIViewController *)vc time:(NSTimeInterval)time
{
    UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:title message:massage preferredStyle:UIAlertControllerStyleAlert];
    [vc presentViewController:alert1 animated:YES completion:^{
        if (MAXFLOAT != time) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [alert1 dismissViewControllerAnimated:YES completion:nil];
            });
        }
    }];
}
+ (CGFloat)getNumWidthWithStr:(NSString *)str
{
    CGFloat w = 0;
   
    w = str.length * 7.5;
    return w;
}
+ (CGFloat)getHeightWithStr:(NSString *)str height:(CGFloat)height fontSize:(UIFont *)size
{
    if (str == nil || [str isEqual:[NSNull null]]) {
        return 0;
    }
    NSDictionary *myDic = @{
                            NSFontAttributeName:size,
                            NSKernAttributeName:@(MYWidth(0.5)),
                            //                            NSParagraphStyleAttributeName:paragraphStyle,
                            };
    CGRect rect = [str boundingRectWithSize:CGSizeMake(1000, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:myDic context:nil];
    return rect.size.width + MYWidth(0.5);
}
//截取图片
+ (NSMutableArray *)jieQuString:(NSString *)str {
    NSMutableArray *valueArr = [NSMutableArray array];
    if (str != nil) {
        NSString *houZhui = @"";
        if ([str rangeOfString:@".jpg"].location != NSNotFound) {
            houZhui = @".jpg";
        } else if ([str rangeOfString:@".png"].location != NSNotFound) {
            houZhui = @".png";
        } else if ([str rangeOfString:@".jpeg"].location != NSNotFound) {
            houZhui = @".jpeg";
        } else {
            return nil;
        }
        NSArray *Arr = [NSArray array];
        Arr = [str componentsSeparatedByString:houZhui];
        
        for (NSString *str1 in Arr) {
            NSRange range1 = [str1 rangeOfString:@"http://"];
            NSString *str2 = @"";
            NSString *str3 = str1;
            if (range1.location != NSNotFound) {
                
                str2 = [NSString stringWithFormat:@"%@%@", [str1 substringFromIndex:range1.location], houZhui];//图片str
                str3 = [str1 substringToIndex:range1.location];//图片前文字str
            }
//            NSString *str3 = [str1 substringToIndex:range1.location];//图片前文字str
            NSDictionary *dic = @{
                                  @"text":str3,
                                  @"imgStr":str2,
                                  };
            [valueArr addObject:dic];
        }
        
       return valueArr;
    } else {
        return nil;
    }
    
}
+ (CGFloat)getHeightWithStr:(NSString *)str width:(CGFloat)width fontSize:(UIFont *)size
{
    if (str == nil || [str isEqual:[NSNull null]]) {
        return 0;
    }
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setLineSpacing:5];
    NSDictionary *myDic = @{
                            NSFontAttributeName:size,
                            NSKernAttributeName:@(MYWidth(0.5)),
//                            NSParagraphStyleAttributeName:paragraphStyle,
                            };
    CGRect rect = [str boundingRectWithSize:CGSizeMake(width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:myDic context:nil];
   
    return rect.size.height;
}
//获取拼音首字母(传入汉字字符串, 返回大写拼音首字母)
+ (NSString *)firstCharactor:(NSString *)aString
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}



+ (NSString *)imageToString:(UIImage *)image
{
    // UIImage --> NSData
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    
    // NSData --> NSString
    NSString *imageDataString = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    NSLog(@"____%@", imageDataString);
    return imageDataString;
}
+ (void)smallRMBByLabel:(UILabel *)label font:(int)font //(首字母型号不同的label)
{
    //label  需要操作的Label
    //font   该字符的字号
    NSMutableAttributedString *noteString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange stringRange = NSMakeRange(0, 1); //该字符串的位置
    [noteString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:stringRange];
    [label setAttributedText: noteString];
}
+ (NSMutableAttributedString *)labelAddMoreAttString:(NSMutableAttributedString *)attStr string:(NSString *)str color:(UIColor *)color font:(int)font tSpace:(float)space //多字体颜色label
{
    //需要设置的位置
    NSRange redRange = NSMakeRange([[attStr string] rangeOfString:str].location, [[attStr string] rangeOfString:str].length);
    //设置颜色
    [attStr addAttribute:NSForegroundColorAttributeName value:color range:redRange];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[attStr string] length])];
    [attStr addAttribute:NSKernAttributeName value:@(MYWidth(0.5)) range:NSMakeRange(0, [[attStr string] length])];
    return attStr;
}
+ (NSData *)compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength {
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength*1024) return data;
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(image, compression);
        if (data.length < maxLength*1024 * 0.9) {
            min = compression;
        } else if (data.length > maxLength*1024) {
            max = compression;
        } else {
            break;
        }
    }
    //    UIImage *resultImage = [UIImage imageWithData:data];
    return data;
}
// 字符串转图片
+ (UIImage *)imageFromString:(NSString *)string
{
    // NSString --> NSData
    NSData *data=[[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    // NSData --> UIImage
    UIImage *image = [UIImage imageWithData:data];
    return image;
}
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


//判断手机号是否合法
+ (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    /**
     * 正则：手机号（精确）
     * <p>移动：134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、178、182、183、184、187、188</p >
     * <p>联通：130、131、132、145、155、156、175、176、185、186</p >
     * <p>电信：133、153、173、177、180、181、189</p >
     * <p>全球星：1349</p >
     * <p>虚拟运营商：170</p >
     */
//        public static final String REGEX_MOBILE_EXACT  = "^((13[0-9])|(14[5,7])|(15[0-3,5-9])|(17[0-9])|(18[0-9])|(147))\\d{8}$";
//    ^((13[0-9])|(15[0-9])|(18[0-9])|(17[0-9])|(147))\\d{8}$
    NSString *MOBILE = @"^((13[0-9])|(14[0-9])|(15[0-9])|(17[0-9])|(18[0-9])|(147))\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSLog(@"%d", [regextestmobile evaluateWithObject:mobileNum]);
    return [regextestmobile evaluateWithObject:mobileNum];
}
//时间转成时间戳
+ (NSString *)timeWithTimeString:(NSString *)timeString
{
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate * now = [dateformatter dateFromString:timeString];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[now timeIntervalSince1970]];
    return timeSp;
}
//时间戳转成时间
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString type:(NSInteger)type
{
    
    NSTimeInterval time=[timeString doubleValue]/1000;//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSLog(@"date:%@",[detaildate description]);
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    if (type == 0) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    } else if (type == 1) {
        [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    } else if (type == 1) {
        [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    }
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    return currentDateStr;
}
+(NSString *)handleDate:(NSString *)time_Stamp{
    
    //    NSString *str;
    NSMutableString *str;
    //
    NSDate *date = [NSDate date];
    NSTimeInterval cur_time = date.timeIntervalSince1970;
    
    NSTimeInterval result = cur_time - [time_Stamp doubleValue]/1000;
    
    //    NSLog(@"result = %lf",result);
    NSDateFormatter *dataFormatter = [NSDateFormatter new];
    [dataFormatter setDateFormat:@"YYY年MM月dd日"];
    
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:[time_Stamp doubleValue]];
    
    if (result < 60) {
        str = [NSMutableString stringWithFormat:@"刚刚"];
    }else if(result >= 60 && result < 3600) {
        str = [NSMutableString stringWithFormat:@"%d分钟前",(int)result/60];
    }else if (result > 60*60 && result < 60*60*24) {
        str = [NSMutableString stringWithFormat:@"%d小时前",(int)result/(60*60)];
    }else if (result >= 60*60*24 && result < 60*60*24*30) {
        str = [NSMutableString stringWithFormat:@"%d天前",(int)result/(60*60*24)];
    }else if (result >= 60*60*24*30 && result < 60*60*24*30*12) {
        
        str = [NSMutableString stringWithFormat:@"%@",[dataFormatter stringFromDate:newDate]];
    }else{
        [dataFormatter setDateFormat:@"YYY年"];
        
        str = [NSMutableString stringWithFormat:@"%@",[dataFormatter stringFromDate:newDate]];
    }
    
    return str;
}
/*  判断用户输入的密码是否符合规范，符合规范的密码要求：
 1. 长度大于8位
 2. 密码中必须同时包含数字和字母
 */
+(BOOL)judgePassWordLegal:(NSString *)pass{
    BOOL result = false;
    if ([pass length] >= 6){
        // 判断长度大于8位后再接着判断是否同时包含数字和字符
        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,14}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:pass];
    }
    return result;
}

//姓名格式
+ (BOOL) deptNumInputShouldName:(NSString *)str
{
    NSString *regex = @"[\u4e00-\u9fa5a-zA-Z]{2,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}
//行距（方法放到后面，容易不好使）
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space{
    if (label.text == nil || [label.text isEqual:[NSNull null]]) {
        return;
    }
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText  attributes:@{NSKernAttributeName : @(MYWidth(0.5))}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}
//行距（方法放到后面，容易不好使）
+ (NSMutableAttributedString *)changeLineSpaceForattString:(NSMutableAttributedString *)attStr WithSpace:(float)space{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [[attStr string] length])];
    [attStr addAttribute:NSKernAttributeName value:@(MYWidth(0.5)) range:NSMakeRange(0, [[attStr string] length])];
    return attStr;
}
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

#pragma mark 生成image
+ (UIImage *)GetmakeImageWithView:(UIView *)view andWithSize:(CGSize)size
{
    
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}
@end
