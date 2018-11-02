//
//  TestRequest.h
//  NoName
//
//  Created by Danish on 2018/10/30.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "NNRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestRequest : NNRequest

- (id)initWithUserName:(NSString *)userName password:(NSString *)pwd;

@end

NS_ASSUME_NONNULL_END
