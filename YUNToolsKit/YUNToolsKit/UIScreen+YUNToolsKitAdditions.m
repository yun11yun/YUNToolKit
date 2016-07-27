//
//  UIScreen+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "UIScreen+YUNToolsKitAdditions.h"

@implementation UIScreen (YUNToolsKitAdditions)

- (CGRect)currentBounds {
    return [self boundsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (CGRect)boundsForOrientation:(UIInterfaceOrientation)orientation {
    CGRect bounds = [self bounds];
    
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        CGFloat buffer = bounds.size.width;
        
        bounds.size.width = bounds.size.height;
        bounds.size.height = buffer;
    }
    return bounds;
}

- (BOOL)isRetinaDisplay {
    static dispatch_once_t predicate;
    static BOOL answer;
    
    dispatch_once(&predicate, ^{
        answer = ([self respondsToSelector:@selector(scale)] && [self scale] == 2);
    });
    return answer;
}

@end
