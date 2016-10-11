//
//  WYNewFeatureViewController.m
//  我赢微博
//
//  Created by Leo on 10/11/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYNewFeatureViewController.h"
#import "UIView+Extension.h"
#import "WYTabBarController.h"

@interface WYNewFeatureViewController () <UIScrollViewDelegate>
@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) UIPageControl *PC;
@end

@implementation WYNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.frame = self.view.bounds; //设置大小
    self.scrollView.delegate = self;
    CGFloat imageWidth = self.view.width;
    for (int i = 0; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i+1]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.userInteractionEnabled = YES;
        imageView.x = i*imageWidth;
        imageView.y = 0;
        imageView.width = self.view.width;
        imageView.height = self.view.height;
        [self.scrollView addSubview:imageView];
        
        //如果是第四张图片时，则添加分享按钮
        if (i == 3) {
            [self configSharedButtonWith:imageView];
        }
    }
    self.scrollView.contentSize = CGSizeMake(imageWidth*4, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
    
    
    //配置页面控制视图
    self.PC = [[UIPageControl alloc]init];
    self.PC.centerX = self.view.width/2;
    self.PC.centerY = self.view.height-20;
    self.PC.numberOfPages = 4;
    self.PC.pageIndicatorTintColor = [UIColor grayColor];
    self.PC.currentPageIndicatorTintColor = [UIColor blackColor]; //当前页颜色
    [self.view addSubview:self.PC];
}

- (void)configSharedButtonWith:(UIImageView *)imageView {
    
    UIButton *sharedButton = [[UIButton alloc]init];
    [sharedButton setTitle:@"分享给大家" forState:UIControlStateNormal];
    [sharedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sharedButton setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [sharedButton setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    sharedButton.width = 150;
    sharedButton.height = 50;
    sharedButton.centerX = self.view.width/2;
    sharedButton.centerY = self.view.height-200;
    [sharedButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:sharedButton];
    
    //开始微博按钮配置
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateSelected];
    startButton.width = 110;
    startButton.height = 36;
    startButton.centerX = self.view.width/2;
    startButton.centerY = self.view.height-150;
    [startButton addTarget:self action:@selector(buttonTaped:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
}

//对当前按钮的状态进行取反
- (void)buttonClicked:(UIButton *)button {
    
    button.selected = !button.isSelected;
}

- (void)buttonTaped:(UIButton *)button {
    
    button.selected = !button.isSelected;
    WYTabBarController *rootVC = [[WYTabBarController alloc]init];
    //获取应用程序的主窗口
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //设置主窗口的根控制器
    window.rootViewController = rootVC;
}

#pragma mark -- UIScrollViewDelegate滚动视图的代理事件

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    self.PC.currentPage = self.scrollView.contentOffset.x/self.view.width;
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
