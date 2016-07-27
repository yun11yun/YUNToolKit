//
//  NSMutableArrayAdditionsTests.m
//  YUNToolsKit
//
//  Created by Orange on 6/13/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <Foundation/Foundation.h>
#import "NSMutableArray+YUNToolsKitAdditions.h"

@interface NSMutableArrayAdditionsTests : XCTestCase

@end

@implementation NSMutableArrayAdditionsTests

- (void)testShuffle
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"1", @"2", @"3", @"4", @"5"]];
    [array shuffle];
    XCTAssertNotEqualObjects(@"1", [array firstObject]);
}

@end
