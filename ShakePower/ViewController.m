//
//  ViewController.m
//  ShakePower
//
//  Created by Alexander Chai on 9/26/15.
//  Copyright © 2015 AZALSAR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

AVAudioPlayer *sound;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"beisd" ofType:@"wav"];
    NSLog(path);
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    sound = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
//    sound.numberOfLoops=-1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion==UIEventSubtypeMotionShake){
        [sound stop];
        NSLog(@"playstart");
        [sound play];
    }
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion==UIEventSubtypeMotionShake){
        NSLog(@"playstop");
        [sound stop];
    }
}

@end
