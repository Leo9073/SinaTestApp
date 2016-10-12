//
//  WYHomeViewController.m
//  我赢微博
//
//  Created by Leo on 10/10/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYHomeViewController.h"
#import "WYAccount.h"
#import "WYAccountTool.h"
#import "AFNetworking.h"
#import "WYStatus.h"
#import "WYUser.h"

@interface WYHomeViewController ()
@property (strong,nonatomic) NSMutableArray *statusArr;
@end

@implementation WYHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = [self creatItemWithImageName:@"navigationbar_friendsearch" andHighlightedImageName:@"navigationbar_friendsearch_highlighted"];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [self creatItemWithImageName:@"navigationbar_pop" andHighlightedImageName:@"navigationbar_pop_highlighted"];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self getOtherName];
    [self getWeiboData];
}

//获取用户信息
- (void)getOtherName {
    
    WYAccount *account = [WYAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    
    //发送GET请求
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.weibo.com/2/users/show.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        self.navigationItem.title = responseObject[@"name"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//获取微博数据
- (void)getWeiboData {
    
    WYAccount *account = [WYAccountTool account];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    params[@"count"] = @10;
    
    //发送GET请求
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.weibo.com/2/statuses/friends_timeline.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //        NSLog(@"%@",responseObject);
//        self.statusArr = responseObject[@"statuses"];
//        [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [self.statusArr addObject:obj];
//        }];
//        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


//提取方法原则：把相同的部分放进方法中，不同的部分当作参数传递
- (UIBarButtonItem *)creatItemWithImageName:(NSString *)imageName andHighlightedImageName:(NSString *)highlightedImageName {
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
    item.customView = button;
    return item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.statusArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *ID = @"STATUS";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    WYStatus *status = self.statusArr[indexPath.row];
    cell.textLabel.text = status.text;
    WYUser *user = status.user;
    cell.detailTextLabel.text = user.name;
    
    return cell;
}

//懒加载
- (NSMutableArray *)statusArr {
    if (_statusArr == nil) {
        _statusArr = [NSMutableArray array];
    }
    return _statusArr;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
