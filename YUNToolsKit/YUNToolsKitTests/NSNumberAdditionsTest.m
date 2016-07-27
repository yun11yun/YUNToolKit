//
//  NSDateAdditionsTest.m
//  YUNToolsKit
//
//  Created by Orange on 6/13/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSNumber+YUNToolsKitAdditions.h"

@interface NSNumberAdditionsTest : XCTestCase

@end

@implementation NSNumberAdditionsTest

- (void)testDateValue {
    NSNumber *number = @(100000.00);
    NSDate *testDate = [number dateValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:100000];
    XCTAssert([testDate isEqualToDate:date]);
}

@end
