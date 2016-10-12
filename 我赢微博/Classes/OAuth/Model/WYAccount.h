//
//  WYAccount.h
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYAccount : NSObject <NSCoding>

//用于调用access_token，接口获取授权后的access token
@property (copy,nonatomic) NSString *access_token;
//access_token的生命周期，单位是秒数
@property (copy,nonatomic) NSString *expires_in;
//access_token的生命周期（该参数即将废弃，开发者请使用expires_in）
@property (copy,nonatomic) NSString *remind_in;
//当前授权用户的UID
@property (copy,nonatomic) NSString *uid;

+ (instancetype)accountWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
