//
//  WYNewFeatureViewController.m
//  我赢微博
//
//  Created by Leo on 10/11/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYNewFeatureViewController.h"
#import "UIView+Extension.h"

@interface WYNewFeatureViewController ()
@property (strong,nonatomic) UIScrollView *scrollView;
@property (strong,nonatomic) UIPageControl *PC;
@end

@implementation WYNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.frame = self.view.bounds; //设置大小
    CGFloat imageWidth = self.view.width;
    for (int i = 0; i < 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i+1]];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.x = i*imageWidth;
        imageView.y = 0;
        imageView.width = self.view.width;
        imageView.height = self.view.height;
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(imageWidth*4, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
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
