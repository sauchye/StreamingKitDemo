//
//  ViewController.m
//  StreamingKitDemo
//
//  Created by Saucheong Ye on 16/09/2017.
//  Copyright © 2017 sauchye.com. All rights reserved.
//

#import "ViewController.h"
#import "STKAudioPlayer.h"

@interface ViewController () <STKAudioPlayerDelegate>

@property (strong, nonatomic) STKAudioPlayer *audioPlayer;
@property (nonatomic, weak)  NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;


@end

static NSString *urlString = @"http://testpic.yxxy.tv/audio/1504688560.mp3";
//@"http://download.lingyongqian.cn/music/ForElise.mp3";
//;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.audioPlayer play:urlString];
}

- (STKAudioPlayer *)audioPlayer{
    if (!_audioPlayer) {
        _audioPlayer = [[STKAudioPlayer alloc] init];
        _audioPlayer.delegate = self;
    }
    return _audioPlayer;
}

- (void)startTimer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)tick{
    
//    float progress = self.audioPlayer.progress;
    float duration = self.audioPlayer.duration;
    self.durationLabel.text = [NSString stringWithFormat:@"%.2f", duration];
    NSLog(@"=====duration=====\n%.f", duration);
//    NSLog(@"=====progress=====\n%.f", progress);
    
    
}


/// Raised when an item has started playing
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer didStartPlayingQueueItemId:(NSObject*)queueItemId{
    
    [self startTimer];
    
}
/// Raised when an item has finished buffering (may or may not be the currently playing item)
/// This event may be raised multiple times for the same item if seek is invoked on the player
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer didFinishBufferingSourceWithQueueItemId:(NSObject*)queueItemId{
    
}
/// Raised when the state of the player has changed
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer stateChanged:(STKAudioPlayerState)state previousState:(STKAudioPlayerState)previousState{
    
}
/// Raised when an item has finished playing
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer didFinishPlayingQueueItemId:(NSObject*)queueItemId withReason:(STKAudioPlayerStopReason)stopReason andProgress:(double)progress andDuration:(double)duration{
    
}
/// Raised when an unexpected and possibly unrecoverable error has occured (usually best to recreate the STKAudioPlauyer)
-(void) audioPlayer:(STKAudioPlayer*)audioPlayer unexpectedError:(STKAudioPlayerErrorCode)errorCode{
    
}


@end
