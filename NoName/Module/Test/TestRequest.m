//
//  TestRequest.m
//  NoName
//
//  Created by Danish on 2018/10/30.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "TestRequest.h"

@implementation TestRequest

{
    NSString *_name;
    NSString *_pwd;
}

- (id)initWithUserName:(NSString *)userName password:(NSString *)pwd {
    self = [super init];
    if (self) {
        _name = userName;
        _pwd = pwd;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/app/login";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
             @"username":_name,
             @"password":_pwd
             };
}

@end
