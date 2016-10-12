//
//  WYAccountTool.m
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYAccountTool.h"

@implementation WYAccountTool

//把账号account保存到沙盒文件中
+ (void)saveAccount:(WYAccount *)account {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"account.data"];
    [NSKeyedArchiver archiveRootObject:account toFile:path];
}

//从沙盒文件中读取数据，并还原成account对象
+(WYAccount *)account {
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    path = [path stringByAppendingPathComponent:@"account.data"];
    WYAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return account;
}
@end
