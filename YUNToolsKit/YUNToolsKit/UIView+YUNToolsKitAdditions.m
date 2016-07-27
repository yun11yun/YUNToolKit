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

@end
