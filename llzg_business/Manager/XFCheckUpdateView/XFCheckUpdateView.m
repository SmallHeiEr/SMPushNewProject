//
//  XFCheckUpdateView.m
//  仿苏宁更新
//
//  Created by mac on 15/12/1.
//  Copyright © 2015年 55iOS. All rights reserved.
//

#import "XFCheckUpdateView.h"

@implementation XFCheckUpdateView

//公开出去的方法，供AppDelegate掉用
+ (void)checkUpdate:(NSString *)APPID window:(UIWindow *)window
{
//
//    NSMutableDictionary *paraDic = [NSMutableDictionary dictionary];
//    [paraDic setObject:@"2" forKey:@"device_type"];
//    [RequestEngine requestByPostTransformWithDeadToken:@"codeURL" withParameters:paraDic withBlock:^(NSURLSessionDataTask *task, id responseObject) {
//        NSNumber *status = [responseObject objectForKey:@"status"];
//        if(status.integerValue == 1)
//        {
//
//            NSDictionary *data = [responseObject objectForKey:@"data"];
//            NSString *bundle = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
//            NSString *resultBundle = [data objectForKey:@"v_code"];
////            if ([[data objectForKey:@"is_sh"] isEqualToString:@"1"]) {
////
////            } else {
//            if(resultBundle.integerValue > bundle.integerValue)
//            {
//                NSString *version_Status = [data objectForKey:@"must_up"];
//                NSString  *content = [data objectForKey:@"v_content"];
//                if(version_Status.integerValue ==1)
//                {
//                    XFCheckUpdateView *alert = [[XFCheckUpdateView alloc] init];
//                    [alert initWithTitle:@"更新提示" message:content buttonTitle:@"立即更新" andIsForce:YES];
//                    alert.url = [data objectForKey:@"v_url"];
//                    [window addSubview:alert];
//                }
//                else
//                {
////                    XFCheckUpdateView *alert = [[XFCheckUpdateView alloc] init];
////                    [alert initWithTitle:@"更新提示" message:content  buttonTitle:@"立即更新" andIsForce:NO];
////                    alert.url = [data objectForKey:@"v_url"];
////                    [window addSubview:alert];
//                }
//
//            }
////            if(resultBundle.integerValue == bundle.integerValue)
////            {
////                [userD setValue:@"yes" forKey:@"isLogin"];
////            }else
////            {
////                [userD setValue:@"no" forKey:@"isLogin"];
////
////            }
//        }
////        }
//    } withErrorBlock:^(NSURLSessionDataTask *task, NSError *error) {
//
//    } withNeedHud:NO withNeedCatch:YES andVC:nil];
//
//
}



#pragma mark -- 相当于初始化赋值
- (void)initWithTitle:(NSString*)title message:(NSString*)message buttonTitle:(NSString*)buttonTitle andIsForce:(BOOL) isForce
{
    self.frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT + 20);
    self.buttonTitle = buttonTitle;
    self.title = title;
    self.message = message;
    self.isForce = isForce;
    [self createUI];
}

- (void)initWithNoforceTitle:(NSString*)title message:(NSString*)message buttonTitle:(NSString*)buttonTitle
{
    self.frame =CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT + 20);
    self.buttonTitle = buttonTitle;
    self.title = title;
    self.message = message;
    
    [self createUI];
}




#pragma mark -- 构建UI
- (void)createUI
{
    //背景半透明
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.frame];
    [backgroundView setBackgroundColor:[UIColor blackColor]];
    [backgroundView setAlpha:0.35];
    [self addSubview:backgroundView];
    
    //主界面
    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width1, hight1)];
    self.mainView.backgroundColor = [UIColor whiteColor];
    
    //titleLabel
    CGSize titleSize = CGSizeZero;
    if (self.title && [self.title length] > 0)
    {
        titleSize = [self.title sizeWithFont:[UIFont fontWithName:@"Helvetica-Bold" size:18.0f]];
    }
    if (titleSize.width > 0)
    {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width1, mHeaderHeight)];
        self.titleLabel.text = self.title;
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0f];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor orangeColor];
    }
    [self.mainView addSubview:self.titleLabel];
    
    //scrollview
    UIScrollView *msgView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, mHeaderHeight, width1, (hight1- mHeaderHeight * 2))];
    msgView.backgroundColor = [UIColor whiteColor];
    
    if (self.message && [self.message length]>0)
    {
        CGSize messageSize = [self.message sizeWithFont:[UIFont systemFontOfSize:16.0f] constrainedToSize:CGSizeMake(width1-20, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        
        
        if (messageSize.width > 0)
        {
            //这里是高度最小的时候
            UILabel *msgLabel = [[UILabel alloc] init];
            msgLabel.font = [UIFont systemFontOfSize:16.0f];
            msgLabel.text = self.message;
            msgLabel.numberOfLines   = 0;
            msgLabel.textAlignment   = NSTextAlignmentLeft;
            msgLabel.backgroundColor = [UIColor clearColor];
            msgLabel.frame = CGRectMake(10, 10, width1-20, messageSize.height + 5);
            
            //这里是大最大高度使scrollview开始拉伸
            if(messageSize.height > mMaxHeight)
            {
                msgView.frame = CGRectMake(msgView.frame.origin.x, msgView.frame.origin.y, msgView.frame.size.width, mMaxHeight + 25);
                self.mainView.frame = CGRectMake(0, 0, width1, mHeaderHeight * 2 + msgView.frame.size.height);
                msgLabel.textAlignment = NSTextAlignmentLeft;
                msgLabel.frame = CGRectMake(10, 10, width1 - 20, messageSize.height);
                msgView.contentSize = CGSizeMake(msgView.frame.size.width, msgLabel.frame.size.height + 20);
            }
            
            //最大高度之内 拉伸backview的高度
            else if (messageSize.height > (hight1-mHeaderHeight * 2) - 10)
            {
                msgView.frame = CGRectMake(msgView.frame.origin.x, msgView.frame.origin.y, msgView.frame.size.width, messageSize.height + 25);
                self.mainView.frame = CGRectMake(0, 0, width1, mHeaderHeight * 2 + msgView.frame.size.height);
                msgLabel.textAlignment = NSTextAlignmentLeft;
                msgLabel.frame = CGRectMake(10, 10, width1 - 20, messageSize.height + 5);
            }
            
            msgLabel.backgroundColor = [UIColor whiteColor];
            [msgView addSubview:msgLabel];
            [self.mainView addSubview:msgView];
        }
    }
    
    //设置按钮显示区域
    if (self.isForce == NO)
    {
        UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, self.mainView.frame.size.height-mHeaderHeight+11, width1, mHeaderHeight)];
        
        UIButton *cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0+(width1/2-mBtnWidth)/2, 0, mBtnWidth, mBtnHeight)];
        [cancelBtn  setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.backgroundColor = RGBA_COLOR(36, 193, 64, 1);
        cancelBtn.layer.cornerRadius = 5;
        [cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
        [btnView addSubview:cancelBtn];

        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(width1/2+(width1/2-mBtnWidth)/2, 0, mBtnWidth, mBtnHeight)];
        btn.backgroundColor = RGBA_COLOR(36, 193, 64, 1);
        btn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0f];
        btn.titleLabel.textColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitle:self.buttonTitle forState:UIControlStateNormal];
        
        btn.tag = 888;
        btn.layer.cornerRadius = 5;
        [btnView addSubview:btn];
        [self.mainView addSubview: btnView];
        
        
        
    }else
    {
        UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, self.mainView.frame.size.height-mHeaderHeight+11, width1, mHeaderHeight)];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((width1 - mBtnWidth)/2, 0, mBtnWidth, mBtnHeight)];
        btn.backgroundColor = RGBA_COLOR(36, 193, 64, 1);
        btn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:17.0f];
        btn.titleLabel.textColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitle:self.buttonTitle forState:UIControlStateNormal];
        
        btn.tag = 888;
        btn.layer.cornerRadius = 5;
        [btnView addSubview:btn];
        [self.mainView addSubview: btnView];

    
    
    }
    
    self.mainView.center = self.center;
    [self addSubview:self.mainView];
}


- (void)buttonClicked:(id)sender
{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.url]];
}

-(void)cancelClick
{
    [self removeFromSuperview];


}

//弹出动画
+ (void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur
{
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = dur;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray array];
    
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    [changeOutView.layer addAnimation:animation forKey:nil];
}

@end
