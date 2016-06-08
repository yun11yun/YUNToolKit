//
//  NSNumber+YUNToolsKitAdditions.m
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import "NSNumber+YUNToolsKitAdditions.h"

@implementation NSNumber (YUNToolsKitAdditions)

- (NSDate *)dateValue {
    NSTimeInterval timestamp = [self doubleValue];
    if (!timestamp) {
        return nil;
    }
    return [NSDate dateWithTimeIntervalSince1970:timestamp];
}

@end
