//
//  WYUser.h
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYUser : NSObject
@property (copy,nonatomic) NSString *idstr;
@property (copy,nonatomic) NSString *screen_name;
@property (copy,nonatomic) NSString *name;

+ (instancetype)userWithDict:(NSDictionary *)dict;
@end
