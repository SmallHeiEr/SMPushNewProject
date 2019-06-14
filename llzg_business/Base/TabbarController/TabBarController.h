//
//  TabBarController.h
//  TennisBook
//
//  Created by谢意强 on 14-4-9.
//  Copyright (c) 2014年 xingyifeiling. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuShowSecondDelegate <NSObject>

-(void)showMenuSecondwithNavigation:(NSInteger)tag;

@end

@interface TabBarController : UITabBarController
{
    
    
}
+ (instancetype)instance;
- (void)createSubViews;





@end
