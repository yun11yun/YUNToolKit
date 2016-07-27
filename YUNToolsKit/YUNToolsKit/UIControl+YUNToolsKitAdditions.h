//
//  UIControl+YUNToolsKitAdditions.h
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Provides extensions to 'UIControl' for various common tasks.
 */
@interface UIControl (YUNToolsKitAdditions)

/**
 Removes all targets and actions for all events from an internal dispatch table.
 */
- (void)removeAllTargets;

/**
 Sets exclusive target for specified event, all previous targets will be removed, usefull for table cells etc
 */
- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
