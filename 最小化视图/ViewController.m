//
//  ViewController.m
//  最小化视图
//
//  Created by love on 2017/5/25.
//  Copyright © 2017年 guanal. All rights reserved.
//

#import "ViewController.h"
#import "SHIPINViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"进入" forState:UIControlStateNormal];
    
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)buttonClick:(UIButton *)sender{
    
    UIButton *button = sender;
    button.userInteractionEnabled = NO;
    SHIPINViewController *secondViewController = [[SHIPINViewController alloc] init];
    UINavigationController *navigationcontoller = [[UINavigationController alloc]initWithRootViewController:secondViewController];
    navigationcontoller.navigationBar.hidden = YES;
    [self presentViewController:navigationcontoller animated:YES completion:^{
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
