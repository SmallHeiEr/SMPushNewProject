//
//  XFCheckUpdateView.h
//  仿苏宁更新
//
//  Created by 黄雪峰 on 15/12/1.
//  Copyright © 2015年 55iOS. All rights reserved.
//

#import <UIKit/UIKit.h>



static const CGFloat width1 = 300;//宽度
static const CGFloat hight1 = 190;//高度
static const CGFloat mHeaderHeight = 50;//title高度
static const CGFloat mMaxHeight = 250;//scroll关于的最大
//一个按钮
static const CGFloat mBtnHeight    = 30;
static const CGFloat mBtnWidth     = 110;



@interface XFCheckUpdateView : UIView

@property (nonatomic, retain) NSString       *title;//标题
@property (nonatomic, retain) UILabel        *titleLabel;//标题label
@property (nonatomic, retain) NSString       *message;//内容
@property (nonatomic, retain) NSString       *url;//trackViewUrl:APP下载网址
@property (nonatomic, retain) NSString       *buttonTitle;//去更新

@property(nonatomic,assign)BOOL isForce;//是否为强制更新

@property (nonatomic, strong) UIView         *mainView;//存放内容的

//公开出去的方法，供AppDelegate掉用
+ (void)checkUpdate:(NSString *)APPID window:(UIWindow *)window;

@end
