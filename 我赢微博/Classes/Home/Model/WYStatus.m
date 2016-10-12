//
//  WYStatus.m
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYStatus.h"

@implementation WYStatus

+ (instancetype)statusWithDict:(NSDictionary *)dict {
    
    WYStatus *status = [[self alloc]init];
    status.idstr = dict[@"idstr"];
    status.text = dict[@"text"];
    status.user = dict[@"user"];
    return status;
}
@end
