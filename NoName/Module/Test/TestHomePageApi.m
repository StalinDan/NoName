//
//  TestHomePageApi.m
//  NoName
//
//  Created by Danish on 2018/10/30.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "TestHomePageApi.h"

@implementation TestHomePageApi

- (NSString *)requestUrl {
    return @"/homepage";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}


@end
