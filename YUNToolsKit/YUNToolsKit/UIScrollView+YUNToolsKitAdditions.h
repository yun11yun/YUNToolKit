//
//  UIScrollView+YUNToolsKitAdditions.h
//  YUNToolsKit
//
//  Created by Orange on 6/7/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 Provides extensions to 'UIScrollView' for various common tasks.
 */
@interface UIScrollView (YUNToolsKitAdditions)

/**
 Scroll to the top of the receiver without animation.
 */
- (void)scrollToTop;

/**
 Scroll to the top of the receiver.
 
 @param animated 'YES' to animate the transition at a constant velocity to the new offset, 'NO' to make the transition immediate.
 */
- (void)scrollToTopAnimated:(BOOL)animated;

@end
