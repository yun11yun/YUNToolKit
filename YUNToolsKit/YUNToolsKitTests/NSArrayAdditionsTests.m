//
//  NSArrayAdditionsTests.m
//  YUNToolsKit
//
//  Created by Orange on 6/13/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSArray+YUNToolsKitAdditions.h"

@interface NSArrayAdditionsTests : XCTestCase

@end

@implementation NSArrayAdditionsTests

- (void)test {
    NSArray *array = @[@"1", @"2", @"3", @"4", @"5"];
    NSString *random = (NSString *)[array randomObject];
    XCTAssert([array containsObject:random]);
}

@end
