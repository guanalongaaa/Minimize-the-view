//
//  GoComFloatingWindow.h
//  gocom
//
//  Created by guanal on 2017/5/25.
//  Copyright © 2017年 gocomtech. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol GoComFloatingWindowTouchDelegate <NSObject>
//悬浮窗点击事件
- (void)assistiveTocuhs;
@end

@interface GoComFloatingWindow : UIWindow

{
    UIImageView *_imageView;
}
@property(nonatomic ,assign)NSInteger time;
@property(nonatomic ,assign)BOOL isShowMenu;
@property(nonatomic ,strong)UIImage *showImage;
@property(nonatomic ,strong)UIImageView *showImageView;
@property(nonatomic ,assign)CGRect startFrame;
@property(nonatomic ,assign)BOOL isCannotTouch;

@property(nonatomic ,strong)id<GoComFloatingWindowTouchDelegate> floatDelegate;
- (id)initWithFrame:(CGRect)frame imageName:(NSString*)name;
- (void)close;
- (void)startWithTime:(NSInteger) time presentview:(UIView *)presentView inRect:(CGRect) rect;
- (UIImage *)clipcircleImageFromView:(UIView *)view inRect:(CGRect) frame;

@end
