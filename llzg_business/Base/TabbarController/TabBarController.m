//
//  TabBarController.m
//  TennisBook
//
//  Created by 谢意强 on 14-4-9.
//  Copyright (c) 2014年 xingyifeiling. All rights reserved.
//

#import "TabBarController.h"
#import "RootNavigationController.h"
#import "AppDelegate.h"
@interface TabBarController ()<UITabBarControllerDelegate>
@property(nonatomic,strong)NSMutableArray *tabbarArr;
@end

@implementation TabBarController
{
    
}
+ (instancetype)instance{
    AppDelegate *delegete = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *vc = delegete.window.rootViewController;
    if ([vc isKindOfClass:[TabBarController class]]) {
        return (TabBarController *)vc;
    }else{
        return nil;
    }
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    BOOL isLaunch = [[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"];
    if(!isLaunch){
        
    } else {
        [self createSubViews];
    }
   
}
- (void)createSubViews
{
    
    self.delegate = self;
    self.tabbarArr = [NSMutableArray array];
//    HomeViewController *home = [[HomeViewController alloc] init];
//    [self addOneChildController:home title:@"首页" norImage:@"tabe_home_icon" selectedImage:@"tabe_home_icon_pre"];
//
//    PicInventoryViewController *pictureVC = [PicInventoryViewController new];
//
//
//    [self addOneChildController:pictureVC title:@"图库" norImage:@"tabber_picture_icon" selectedImage:@"tabber_picture_icon_pre"];
//
//
//
//    ActivityViewController *activityVC = [ActivityViewController new];
//    [self addOneChildController:activityVC title:@"活动" norImage:@"tabber_activity_icon" selectedImage:@"tabbar_activity_icon_se"];
//
//    MineViewController *myVC = [[MineViewController alloc] init];
//    [self addOneChildController:myVC title:@"我的" norImage:@"tabber_me_icon" selectedImage:@"tabber_me_icon_pre"];
//
//
    self.viewControllers = self.tabbarArr;

}
- (void)addOneChildController:(UIViewController *)childVc title:(NSString *)title norImage:(NSString *)norImage selectedImage:(NSString *)selectedImage
{
//
    childVc.view.backgroundColor = [UIColor whiteColor];
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:norImage];
    UIImage *selImage = [UIImage imageNamed:selectedImage];
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];



//    [childVc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor hexStringToColor:@"333333"],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
//      [childVc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor hexStringToColor:@"666666"],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    childVc.tabBarItem.selectedImage = selImage;
    RootNavigationController  *nav = [[RootNavigationController alloc] initWithRootViewController:childVc];
    UIImage *image = [[UIImage alloc] init];
    [nav.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [nav.navigationBar setShadowImage:image];
    [self.tabbarArr addObject:nav];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
   
    //这里我判断的是当前点击的tabBarItem的标题
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        //如果用户ID存在的话，说明已登陆
//        UserModel *user = [UserModel currentUser];
//        if(![user.isLogin isEqualToString:@"yes"]) {
//            LoginViewController *login = [LoginViewController new];
//            [self presentViewController:login animated:YES completion:nil];
//            return NO;
//        } else {
            return YES;
//        }
        
    } else {
        return YES;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
