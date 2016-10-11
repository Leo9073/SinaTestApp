//
//  WYTabBar.m
//  我赢微博
//
//  Created by Leo on 10/11/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYTabBar.h"
#import "UIView+Extension.h"

@interface WYTabBar ()
@property (weak,nonatomic) UIButton *plusButton;
@end

@implementation WYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *plusButton = [[UIButton alloc]init];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateSelected];
        plusButton.width = plusButton.currentBackgroundImage.size.width;
        plusButton.height = plusButton.currentBackgroundImage.size.height;
        [self addSubview:plusButton];
        self.plusButton = plusButton;
    }
    return self;
}

//约束
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.plusButton.center = CGPointMake(self.width*0.5, self.height*0.5);
    
    //均匀分配子控件的宽度 UITabBarButton
    CGFloat buttonWidth = self.width/5.0;
    int index = 0;
    for (UIView *view in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            view.x = index*buttonWidth;
            index++;
        }
        if (index == 2) {
            index++;
        }
    }
}

@end
