//
//  UserManager.m
//  Wanyingjinrong
//
//  Created by Jason on 15/11/13.
//  Copyright © 2015年 www.jizhan.com. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        User *user = [User new];
        self.user = user;
    }
    return self;
}

+ (UserManager *)sharedManager {
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [self new];
    });
    return instance;
}



@end
