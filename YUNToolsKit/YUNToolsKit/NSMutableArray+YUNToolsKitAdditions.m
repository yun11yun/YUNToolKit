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
    for (NSUInteger i = [self count] - 1; i > 0; i--) {
        [self exchangeObjectAtIndex:arc4random_uniform(i + 1)
                  withObjectAtIndex:i];
    }
}

@end
