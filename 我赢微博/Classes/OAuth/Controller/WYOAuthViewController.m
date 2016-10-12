//
//  WYOAuthViewController.m
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYOAuthViewController.h"
#import "AFNetworking.h"
#import "WYAccount.h"
#import "WYAccountTool.h"
#import "WYTabBarController.h"

@interface WYOAuthViewController () <UIWebViewDelegate>
@property (strong,nonatomic) UIWebView *webView;
@end

@implementation WYOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //client_id	true	string	申请应用时分配的AppKey。
   //redirect_uri	true	string	授权回调地址，站外应用需与设置的回调地址一致，站内应用需填写canvas page的地址。
    
    //创建网页视图
    NSString *urlPath = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",@"3713340735",@"http://www.wyzc.com"];
    NSURL *url = [NSURL URLWithString:urlPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.webView = [[UIWebView alloc]init];
    self.webView.frame = self.view.bounds;
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    [self.webView loadRequest:request];    
}

//requestToken:c11465b0a79b21274a86af27a3ceeea2
#pragma mark -- UIWebViewDelegate代理事件

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    //获取Token
    NSString *url = request.URL.absoluteString;
    //返回绝对路径，即回调网址http://www.wyzc.com/?code=c11465b0a79b21274a86af27a3ceeea2
    NSRange range = [url rangeOfString:@"code="];
    if (range.length > 0) {
        NSUInteger  index = range.location+range.length;
        NSString *code = [url substringFromIndex:index];
        
        //获取access_token接口，必须使用POST方式
        //https://api.weibo.com/oauth2/access_token
//        client_id	true	string	申请应用时分配的AppKey。
//        client_secret	true	string	申请应用时分配的AppSecret。
//        grant_type	true	string	请求的类型，填写authorization_code
//        grant_type为authorization_code时
//        必选	类型及范围	说明
//        code	true	string	调用authorize获得的code值。
//        redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
        
        //设置请求中的各项参数
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        params[@"client_id"] = @"3713340735";
        params[@"client_secret"] = @"c5d11836e310e70efc021ac59ea7863a";
        params[@"grant_type"] = @"authorization_code";
        params[@"code"] = code;
        params[@"redirect_uri"] = @"http://www.wyzc.com";
        NSString *strUrl = @"https://api.weibo.com/oauth2/access_token";
        
        //发送POST请求
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:strUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"请求成功---->%@",responseObject);
            //创建一个账号用于保存请求到的字典中的数据，登录成功后保存账号到沙盒文件，下次登录直接从沙盒中读取数据
            WYAccount *account = [WYAccount accountWithDict:responseObject];
            [WYAccountTool saveAccount:account];
            
            //登录成功后跳转到主窗口
            WYTabBarController *rootViewController = [[WYTabBarController alloc]init];
            UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
            keywindow.rootViewController = rootViewController;
            [keywindow makeKeyAndVisible];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"请求失败---->%@",error);
        }];
    }
    return YES;
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
