//
//  UIView+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "UIView+YUNToolsKitAdditions.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (YUNToolsKitAdditions)

- (UIImage *)imageRepresentation {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)hide {
    self.alpha = 0.0f;
}

- (void)show {
    self.alpha = 1.0f;
}

- (void)fadeOut {
    UIView *view = self;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        view.alpha = 0.0f;
    } completion:nil];
}

- (void)fadeOutAndRemoveFromSuperview {
    UIView *view = self;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        view.alpha = 0.0f;
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
    }];
}

- (void)fadeIn {
    UIView *view = self;
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        view.alpha = 1.0f;
    } completion:nil];
}

- (NSArray *)superviews {
    NSMutableArray *superviews = [[NSMutableArray alloc] init];
    
    UIView *view = self;
    UIView *superview = nil;
    while (view) {
        superview = [view superview];
        if (!superview) {
            break;
        }
        
        [superviews addObject:superview];
        view = superview;
    }
    
    return superviews;
}

- (id)firstSuperviewOfClass:(Class)superviewClass {
    for (UIView *view = [self superview]; view != nil; view = [view superview]) {
        if ([view isKindOfClass:superviewClass]) {
            return view;
        }
    }
    return nil;
}

- (void)setYun_x:(CGFloat)yun_x
{
    CGRect frame = self.frame;
    frame.origin.x = yun_x;
    self.frame = frame;
}

- (CGFloat)yun_x
{
    return self.frame.origin.x;
}

- (void)setYun_y:(CGFloat)yun_y
{
    CGRect frame = self.frame;
    frame.origin.y = yun_y;
    self.frame = frame;
}

- (CGFloat)yun_y
{
    return self.frame.origin.y;
}

- (void)setYun_width:(CGFloat)yun_width
{
    CGRect frame = self.frame;
    frame.size.width = yun_width;
    self.frame = frame;
}

- (CGFloat)yun_width
{
    return self.frame.size.width;
}

- (void)setYun_height:(CGFloat)yun_height
{
    CGRect frame = self.frame;
    frame.size.height = yun_height;
    self.frame = frame;
}

- (CGFloat)yun_height
{
    return self.frame.size.height;
}

- (void)setYun_size:(CGSize)yun_size
{
    CGRect frame = self.frame;
    frame.size = yun_size;
    self.frame = frame;
}

- (CGSize)yun_size
{
    return self.frame.size;
}

- (void)setYun_origin:(CGPoint)yun_origin
{
    CGRect frame = self.frame;
    frame.origin = yun_origin;
    self.frame = frame;
}

- (CGPoint)yun_origin
{
    return self.frame.origin;
}

@end
