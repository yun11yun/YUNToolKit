//
//  NSNumber+YUNToolsKitAdditions.h
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (YUNToolsKitAdditions)

///--------------
/// @name Date from timestamp
///--------------

/**
 Creates an instance of `NSDate` using current number as timestamp.
 @return NSDate with current number as unix timestamp or `nil` if current number contains 0.
 */
- (NSDate *)dateValue;

@end
