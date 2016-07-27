//
//  UIScreenAdditionsTests.m
//  YUNToolsKit
//
//  Created by Orange on 6/13/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <XCTest/XCTest.h>

#import <UIKit/UIKit.h>

#import "UIScreen+YUNToolsKitAdditions.h"

@interface UIScreenAdditionsTests : XCTestCase

@end

@implementation UIScreenAdditionsTests

- (void)testCurrentBounds {
    CGRect rect = [[UIScreen mainScreen] currentBounds];
    NSLog(@"rect-- %@", NSStringFromCGRect(rect));
}


@end
