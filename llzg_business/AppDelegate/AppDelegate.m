//
//  AppDelegate.m
//  llzg_business
//
//  Created by llzg on 2019/5/31.
//  Copyright © 2019 llzg. All rights reserved.
//

#import "AppDelegate.h"
#import "GHWalkThroughView.h"
#import "XFCheckUpdateView.h"
#import "TabBarController.h"

@interface AppDelegate ()<GHWalkThroughViewDataSource>

//启动页面
@property (nonatomic, strong) GHWalkThroughView* ghView;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    //    UMeng
    [self setUMengOptions:launchOptions];
    //检查版本
    [self checkVersion];
    
    [self loginNetCloud];
    
    //设置keymanager
    [self setKeyManager];
    
    [self checkNetStatus];
    //    启动页停留2秒
    [NSThread sleepForTimeInterval:2];
    return YES;
}
#pragma mark -checkversion
-(void)checkVersion
{
    [XFCheckUpdateView checkUpdate:@"" window:self.window];
}
-(void)loginNetCloud
{
    
    BOOL isLaunch = [[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"];
    if(!isLaunch)
    {
        TabBarController *RootVC = [[TabBarController alloc] init];
        self.window.rootViewController = RootVC;
        [self.window makeKeyAndVisible];
        [self setupFirstLaunch:self.window];
        //
    } else {
        TabBarController *RootVC = [[TabBarController alloc] init];
        self.window.rootViewController = RootVC;
        [self.window makeKeyAndVisible];
        
    }
}
#pragma mark -chectNet
-(void)checkNetStatus
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                //未知网络
                NSLog(@"未知网络");
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                //                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您已关闭数据链接权限" message:@"请前往设置中开启" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                //                [alert show];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                //手机自带网络
                NSLog(@"当前使用的是2g/3g/4g网络");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                //WIFI
                NSLog(@"当前在WIFI网络下");
            }
        }
    }];
    
    
    
}
#pragma mark IQKeyManager
-(void)setKeyManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.enableAutoToolbar = YES;
    manager.toolbarDoneBarButtonItemText = @"完成";
    [[IQKeyboardManager sharedManager]setKeyboardDistanceFromTextField:0];
}

#pragma  - mark   -  firstlaouch
-(void)setupFirstLaunch:(UIView*)view{
    
    _ghView = [[GHWalkThroughView alloc] initWithFrame:self.window.bounds];
    [_ghView setDataSource:self];
    self.ghView.floatingHeaderView = nil;
    [self.ghView setWalkThroughDirection:GHWalkThroughViewDirectionHorizontal];
    [self.ghView showInView:view animateDuration:0];
    
}
-(NSInteger) numberOfPages{
    return 4;
}
- (UIImage*) bgImageforPage:(NSInteger)index{
    UIImage* image = [UIImage imageNamed:[NSString stringWithFormat:@"laounch%zd",index+1]];
    return image;
}
#pragma mark UMeng
- (void)setUMengOptions:(NSDictionary *)launchOptions
{
//    /* 打开调试日志 */
//    [[UMSocialManager defaultManager] openLog:YES];
//
//    /* 设置友盟appkey */
//    [[UMSocialManager defaultManager] setUmSocialAppkey:USHARE_UMENG_APPKEY];
    
    [self configUSharePlatforms];
    
    [self confitUShareSettings];
    
    
    //    if(iOS_Version >= 10.0)
    //    {
    //        //    推送
    //        [UMessage startWithAppkey:USHARE_UMENG_APPKEY launchOptions:launchOptions httpsEnable:YES];
    //        //注册通知，如果要使用category的自定义策略，可以参考demo中的代码。
    //        [UMessage registerForRemoteNotifications];
    //
    //        //iOS10必须加下面这段代码。
    //        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    //        center.delegate=self;
    //        UNAuthorizationOptions types10 = UNAuthorizationOptionBadge|UNAuthorizationOptionAlert|UNAuthorizationOptionSound;
    //        [center requestAuthorizationWithOptions:types10 completionHandler:^(BOOL granted, NSError * _Nullable error) {
    //            if (granted) {
    //                //点击允许
    //                //这里可以添加一些自己的逻辑
    //            } else {
    //                //点击不允许
    //                //这里可以添加一些自己的逻辑
    //            }
    //        }];
    //
    //    }
    //    //打开日志，方便调试
    //    [UMessage setLogEnabled:YES];
    
    //        self.userInfo = launchOptions;
    //    [self goToPush];
}
- (void)confitUShareSettings
{
//    /* 打开图片水印    */
//    [UMSocialGlobal shareInstance].isUsingWaterMark = YES;
//    [UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}
- (void)configUSharePlatforms
{
//    /* 设置微信的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:USHARE_WECHAT_APPKEY appSecret:USHARE_WECHAT_APPSECRET redirectURL:USHARE_CALLBACK_Address];
//    /* 移除相应平台的分享，如微信收藏 */
//    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
//    /* 设置分享到QQ互联的appID     */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:USHARE_QQ_ID/*设置QQ平台的appID*/  appSecret:nil redirectURL:USHARE_CALLBACK_Address];
//    /* 设置新浪的appKey和appSecret */
//    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:USHARE_SINA_APPKEY  appSecret:USHARE_SINA_APPSECRET redirectURL:USHARE_CALLBACK_Address];
}
//#pragma - mark - 回调
//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
//    if (!result) {
//
//    }
//    return result;
//}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
