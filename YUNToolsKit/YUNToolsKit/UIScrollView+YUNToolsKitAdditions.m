//
//  UIScrollView+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/7/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "UIScrollView+YUNToolsKitAdditions.h"

@implementation UIScrollView (YUNToolsKitAdditions)

- (void)scrollToTop {
    [self scrollToTopAnimated:NO];
}

- (void)scrollToTopAnimated:(BOOL)animated {
    [self setContentOffset:CGPointMake(0.0f, 0.0f) animated:animated];
}

@end
