//
//  NNVideoVC.m
//  NoName
//
//  Created by Danish on 2018/10/26.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "NNVideoVC.h"
#import "NNPlayer.h"
#import <AVFoundation/AVFoundation.h>
#import "TestRequest.h"
#import "TestHomePageApi.h"

@interface NNVideoVC ()

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)AVPlayer *player;
@property (nonatomic, strong)AVPlayerItem *playerItem;
@property (nonatomic, assign)BOOL isReadToPlay;
@property (strong, nonatomic)UISlider *avSlider;//用来现实视频的播放进度，并且通过它来控制视频的快进快退
@property (strong, nonatomic)UIButton *playBtn;
@property (nonatomic, strong)UIImageView *testImgView;
@end

@implementation NNVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.player = [[NNPlayer alloc]init];
//    self.player.urlStr = @"http://139.129.98.157/video/2017/8/9/1502606540659_343391.mp4";
//    [self.view.layer addSublayer:_player.playerLayer];
//    [_player.player play];
    
    //获取状态栏的rect
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    //获取导航栏的rect
    CGRect navRect = self.navigationController.navigationBar.frame;
    NSLog(@"%f == %f",statusRect.size.height,navRect.size.height);
    //那么导航栏+状态栏的高度
    float orignH = statusRect.size.height+navRect.size.height;
    
//    NSLog(@"video-->%f",self.navigationController.navigationBar.);
//    self.playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://video.weibo.com/show?fid=1034:0988e59a12e5178acb7f23adc3fe5e97"]];
//    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
//    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
//    playerLayer.frame = CGRectMake(0, orignH, NN_ScreenW, 300);
//    [self.view.layer addSublayer:playerLayer];
//    [self.player play];
//
//    [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    self.avSlider.hidden = NO;
    self.playBtn.hidden = NO;
    self.testImgView.hidden = NO;

    
//    TestRequest *testRequest = [[TestRequest alloc]initWithUserName:@"dyy" password:@"Dyy123"];
//    [testRequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"====%@",request.responseObject);
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"%@",request.error);
//    }];
    
    TestHomePageApi *homePageApi = [[TestHomePageApi alloc]init];
    [homePageApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"====%@",request.responseObject);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"%@",request.error);
    }];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status = [change[NSKeyValueChangeNewKey] intValue];
        
    
        switch (status) {
            case AVPlayerStatusUnknown:
                NSLog(@"视频资源出现未知错误");
                self.isReadToPlay = NO;
                break;
            case AVPlayerStatusReadyToPlay:
                
                NSLog(@"准好播放了");
                self.isReadToPlay = YES;
                break;
                
            case AVPlayerStatusFailed:
                self.isReadToPlay = NO;
                NSLog(@"item 有误");
            break;
                
            default:
                break;
        }
    }
    
    [object removeObserver:self forKeyPath:@"status"];
}

#pragma mark- action methods

- (void)playBtnClick {
    [self.player play];
}

- (void)slideAction {
    //slider的value值为视频的时间
    float seconds = self.avSlider.value;
    //让视频从指定的CMTime对象处播放。
    CMTime startTime = CMTimeMakeWithSeconds(seconds, self.playerItem.currentTime.timescale);
    //让视频从指定处播放
    [self.player seekToTime:startTime completionHandler:^(BOOL finished) {
        if (finished) {
            [self playBtnClick];
        }
    }];
}

#pragma mark @property methods

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, NN_ScreenW, NN_ScreenH)];
        _scrollView.pagingEnabled = YES;
        
    }
    return _scrollView;
}

- (UISlider *)avSlider {
    if (!_avSlider) {
        _avSlider = [[UISlider alloc]init];
        [self.view addSubview:_avSlider];
        [_avSlider addTarget:self action:@selector(slideAction) forControlEvents:UIControlEventTouchUpInside];
        [_avSlider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(400);
            make.right.mas_equalTo(10);
        
        }];
        
    }
    return _avSlider;
}

- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [NNUI buttonWithTitle:@"播放" color:[UIColor redColor] target:self action:@selector(playBtnClick)];
        [self.view addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.avSlider.mas_bottom).offset(50);
            make.centerX.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(100, 80));
        }];
    }
    return _playBtn;
}

- (UIImageView *)testImgView {
    if (!_testImgView) {
        _testImgView = [NNUI imageViewWithImageUrlStr:@"http://pic29.nipic.com/20130511/9252150_174018365301_2.jpg"];
        [self.view addSubview:_testImgView];
        [_testImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(self.playBtn.mas_bottom).offset(30);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _testImgView;
}

//- (AVPlayer *)player {
//    if (!_player) {
//
//
//    }
//    return _player;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
