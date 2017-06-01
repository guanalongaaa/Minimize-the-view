# Minimize-the-view

/Users/guanalong/Desktop/test2.gif
![Alt text](https://github.com/guanalongaaa/Minimize-the-view/raw/master/test2.gif)



#- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
// Override point for customization after application launch.

    self.floatWindow = [[GoComFloatingWindow alloc]initWithFrame:CGRectMake(100, 100, 76, 76) imageName:@"av_call.png"];
    [self.floatWindow makeKeyAndVisible];
    self.floatWindow.hidden = YES;

return YES;
#}


-(void)click{

AppDelegate *deleage = (AppDelegate *)[UIApplication sharedApplication].delegate;
deleage.floatWindow.isCannotTouch = NO;
__weak typeof (self) weakSelf = self;
deleage.floatWindow.floatDelegate = weakSelf;

[deleage.floatWindow startWithTime:self.time presentview:self.view inRect:CGRectMake(100, 100, 100, 100)];

[self.navigationController dismissViewControllerAnimated:NO completion:^{

}];

}
