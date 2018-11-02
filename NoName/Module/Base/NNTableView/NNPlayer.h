//
//  NNPlayer.h
//  NoName
//
//  Created by Danish on 2018/10/29.
//  Copyright © 2018 Danish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVPlayer.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNPlayer : NSObject

@property (nonatomic, strong) AVPlayer *player; //播放器
@property (nonatomic, strong) AVPlayerItem *playerItem; //播放单元
@property (nonatomic, strong) AVPlayerLayer *playerLayer; //播放界面

@property (nonatomic, strong) NSString *urlStr;

@end

NS_ASSUME_NONNULL_END
