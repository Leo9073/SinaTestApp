//
//  WYAccountTool.h
//  我赢微博
//
//  Created by Leo on 10/12/16.
//  Copyright © 2016 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYAccount.h"

@interface WYAccountTool : NSObject
+ (void)saveAccount:(WYAccount *)account;
+(WYAccount *)account;
@end
