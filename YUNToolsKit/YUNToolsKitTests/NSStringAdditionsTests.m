//
//  NSStringAdditionsTests.m
//  YUNToolsKit
//
//  Created by Orange on 6/13/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+YUNToolsKitAdditions.h"

@interface NSStringAdditionsTests : XCTestCase

@end

@implementation NSStringAdditionsTests

- (void)testEncryption {
    NSString *string = @"huang";
    
    NSString *MD5String = [string MD5Sum];
    NSString *SHA1String = [string SHA1Sum];
    
    
}

@end
