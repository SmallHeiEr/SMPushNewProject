//
//  RootNavigationController.m
//  llzg_business
//
//  Created by llzg on 2019/6/11.
//  Copyright © 2019 llzg. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.interactivePopGestureRecognizer.delegate = nil;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ranking_back_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
//        viewController.navigationItem.leftBarButtonItem.tintColor = UIColorMMDFromRGB(228, 59, 142, 1.0);
    }
    [super pushViewController:viewController animated:YES];
}





#pragma mark -- Event

- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
