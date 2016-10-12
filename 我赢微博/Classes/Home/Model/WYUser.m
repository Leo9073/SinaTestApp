//
//  WYUser.m
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYUser.h"

@implementation WYUser

+ (instancetype)userWithDict:(NSDictionary *)dict {
    
    WYUser *user = [[self alloc]init];
    user.idstr = dict[@"idstr"];
    user.screen_name = dict[@"screen_name"];
    user.name = dict[@"name"];
    return user;
}
@end
