//
//  SHIPINViewController.m
//  最小化视图
//
//  Created by love on 2017/5/25.
//  Copyright © 2017年 guanal. All rights reserved.
//

#import "SHIPINViewController.h"
#import "AppDelegate.h"
#import "GoComFloatingWindow.h"

#define IMScreenHeight  [[UIScreen mainScreen] bounds].size.height
#define IMScreenWidth  [[UIScreen mainScreen] bounds].size.width

@interface SHIPINViewController ()<GoComFloatingWindowTouchDelegate>

@property (nonatomic ,strong)UILabel *timeLable;
@property (nonatomic ,strong)NSTimer *timer;
@property(nonatomic ,assign)NSInteger time;
@end

@implementation SHIPINViewController

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"123456");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *timelable = [[UILabel alloc ] initWithFrame:CGRectMake(0, 0, 60, 10)];
    timelable.center = CGPointMake(self.view.frame.size.width /2, self.view.frame.size.height / 2 + 12);
    timelable.font = [UIFont systemFontOfSize:12];
    timelable.textColor = [UIColor whiteColor];
    timelable.textAlignment = NSTextAlignmentCenter;
    
    self.timeLable = timelable;
    [self.view addSubview:timelable];
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *callBackButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50, 40)];
    [callBackButton setTitle:@"缩小" forState:UIControlStateNormal];
    [callBackButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [callBackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:callBackButton];
    
    [self start];
    
}


- (void)start {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(changeTimeLable) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    [_timer fire];
}

- (void)changeTimeLable {
    self.timeLable.text = [self changeTimeFormater:self.time];
    self.time++;
//    if(_timeStart) {
//        self.time++;
//    }
}

-(void)click{
    
    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
    deleage.floatWindow.isCannotTouch = NO;
    __weak typeof (self) weakSelf = self;
    deleage.floatWindow.floatDelegate = weakSelf;
    
    [deleage.floatWindow startWithTime:self.time presentview:self.view inRect:CGRectMake(100, 100, 100, 100)];
    
    [self.navigationController dismissViewControllerAnimated:NO completion:^{
        
    }];

}


-(void)assistiveTocuhs {
    
    AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
    deleage.floatWindow.isCannotTouch = YES;
    //    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:self];
    //    navigationController.navigationBar.hidden = YES;
    //    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:navigationController animated:NO completion:^{
    //
    //    }];
    //    [deleage.floatWindow close];
    
}


- (NSString *)changeTimeFormater:(NSInteger)time{
    NSInteger minutecount = time / 60;
    
    NSInteger secondcount = time % 60;
    NSString *timeString;
    if (minutecount > 60) {
        NSInteger hour = minutecount / 60;
        minutecount = hour % 60;
        if (hour > 10) {
            if (minutecount < 10 && secondcount < 10) {
                timeString = [NSString stringWithFormat:@"%ld:0%ld:0%ld",hour,minutecount,secondcount];
                return timeString;
            }
            if (minutecount < 10) {
                timeString = [NSString stringWithFormat:@"%ld:%ld:%ld",hour,minutecount,secondcount];
                return timeString;
            }
            if (secondcount < 10) {
                timeString = [NSString stringWithFormat:@"%ld:%ld:0%ld",hour,minutecount,secondcount];
                return timeString;
                
            }
        } else {
            if (minutecount < 10 && secondcount < 10) {
                timeString = [NSString stringWithFormat:@"0%ld:0%ld:0%ld",hour,minutecount,secondcount];
                return timeString;
            }
            if (minutecount < 10) {
                timeString = [NSString stringWithFormat:@"0%ld:%ld:%ld",hour,minutecount,secondcount];
                return timeString;
            }
            if (secondcount < 10) {
                timeString = [NSString stringWithFormat:@"0%ld:%ld:0%ld",hour,minutecount,secondcount];
                return timeString;
                
            }
        }
        
    }
    if (minutecount < 10 && secondcount < 10) {
        timeString = [NSString stringWithFormat:@"0%ld:0%ld",minutecount,secondcount];
        return timeString;
    }
    if (minutecount < 10) {
        timeString = [NSString stringWithFormat:@"0%ld:%ld",minutecount,secondcount];
        return timeString;
    }
    if (secondcount < 10) {
        timeString = [NSString stringWithFormat:@"%ld:0%ld",minutecount,secondcount];
        return timeString;
        
    }
    return [NSString stringWithFormat:@"%ld:%ld",minutecount,secondcount];
}

@end

