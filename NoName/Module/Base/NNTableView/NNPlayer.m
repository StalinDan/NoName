//
//  NNPlayer.m
//  NoName
//
//  Created by Danish on 2018/10/29.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "NNPlayer.h"

@interface NNPlayer ()

@end

@implementation NNPlayer


#pragma mark - @property method

- (AVPlayer *)player {
    if (!_player) {
        _player = [AVPlayer playerWithPlayerItem:self.playerItem];
    }
    return _player;
}

- (AVPlayerItem *)playerItem {
    if (!_playerItem) {
        //初始化一个播放单元
        _playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:self.urlStr]];
    }
    return _playerItem;
}

- (AVPlayerLayer *)playerLayer {
    if (!_playerLayer) {
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.frame = CGRectMake(0, 0, 300, 200);
    }
    return _playerLayer;
}

- (NSString *)urlStr {
    if (_urlStr == nil || _urlStr.length == 0) {
        return @"";
    }
    return _urlStr;
}

@end
