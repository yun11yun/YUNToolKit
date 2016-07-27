//
//  NSMutableArray+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "NSMutableArray+YUNToolsKitAdditions.h"

@implementation NSMutableArray (YUNToolsKitAdditions)

- (void)shuffle
{
    if (self.count == 0) {
        return;
    }
    for (NSUInteger i = [self count] - 1; i > 0; i--) {
        [self exchangeObjectAtIndex:arc4random_uniform((u_int32_t)(i + 1))
                  withObjectAtIndex:i];
    }
}

@end
