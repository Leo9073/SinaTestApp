//
//  WYAccount.m
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import "WYAccount.h"

@implementation WYAccount

//实现对象方法
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.access_token = dict[@"access_token"];
        self.expires_in = dict[@"expires_in"];
        self.remind_in = dict[@"remind_in"];
        self.uid = dict[@"uid"];
    }
    return self;
}


//实现类方法
+ (instancetype)accountWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

#pragma mark -- NSCoding协议方法

//序列化,把对象保存到沙盒路径时调用
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
}

//反序列化,从沙盒中读取数据还原成对象调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
    }
    return self;
}


@end
