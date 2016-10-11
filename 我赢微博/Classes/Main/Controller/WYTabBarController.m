//
//  WYTabBarController.m
//  我赢微博
//
//  Created by Leo on 10/10/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYTabBarController.h"
#import "WYHomeViewController.h"
#import "WYProfileViewController.h"
#import "WYDiscoverViewController.h"
#import "WYMessageCenterViewController.h"
#import "WYNavigationViewController.h"

@interface WYTabBarController ()

@end

@implementation WYTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    WYHomeViewController *homeVC = [[WYHomeViewController alloc]init];
    [self addChildWithController:homeVC andTitle:@"首页" andImageName:@"tabbar_home" andSelecterImageName:@"tabbar_home_selected"];
    
    WYMessageCenterViewController *messageVC = [[WYMessageCenterViewController alloc]init];
    [self addChildWithController:messageVC andTitle:@"消息" andImageName:@"tabbar_message_center" andSelecterImageName:@"tabbar_message_center_selected"];
    
    WYDiscoverViewController *discoverVC = [[WYDiscoverViewController alloc]init];
    [self addChildWithController:discoverVC andTitle:@"广场" andImageName:@"tabbar_discover" andSelecterImageName:@"tabbar_discover_selected"];
    
    WYProfileViewController *profileVC = [[WYProfileViewController alloc]init];
    [self addChildWithController:profileVC andTitle:@"我" andImageName:@"tabbar_profile" andSelecterImageName:@"tabbar_profile_selected"];
}

//提取方法的原则：把共同的放到方法中，不同的当作参数来传递
- (void)addChildWithController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelecterImageName:(NSString *)selecterImageName {
    
    childVC.title = title;
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    [childVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateNormal];
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selecterImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    WYNavigationViewController *nav = [[WYNavigationViewController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
