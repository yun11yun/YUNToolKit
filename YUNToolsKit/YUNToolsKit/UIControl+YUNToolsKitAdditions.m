//
//  UIControl+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/12/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "UIControl+YUNToolsKitAdditions.h"

@implementation UIControl (YUNToolsKitAdditions)

- (void)removeAllTargets {
    [[self allTargets] enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        [self removeTarget:obj action:NULL forControlEvents:UIControlEventAllEvents];
    }];
}

- (void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    NSSet *targets = [self allTargets];
    for (id currentTarget in targets) {
        NSArray *actions = [self actionsForTarget:currentTarget forControlEvent:controlEvents];
        for (NSString *currentAction in actions) {
            [self removeTarget:currentTarget action:NSSelectorFromString(currentAction) forControlEvents:controlEvents];
        }
    }
    [self addTarget:target action:action forControlEvents:controlEvents];
}

@end
