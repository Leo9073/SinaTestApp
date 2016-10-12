//
//  WYStatus.h
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYUser.h"

@interface WYStatus : NSObject
//用户ID
@property (copy,nonatomic) NSString *idstr;
//微博信息内容
@property (copy,nonatomic) NSString *text;
//用户信息字段
@property (strong,nonatomic) WYUser *user;

+ (instancetype)statusWithDict:(NSDictionary *)dict;

@end
