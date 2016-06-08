//
//  NSArray+YUNToolsKitAdditions.h
//  YUNToolsKit
//
//  Created by Orange on 6/8/16.
//  Copyright © 2016 Tordian. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Provides extension to 'NSArray' for various common tasks.
 */
@interface NSArray (YUNToolsKitAdditions)

///------------------------
/// @name Querying an Array
///------------------------

/**
 Returns the object in the array with a random index value.
 
 @return The object in the array with a random index value. If the array is empty, returns 'nil'.
 */
- (id)randomObject;

///--------------------------
/// @name Deriving New Arrays
///--------------------------

/**
 Returns a new array with its elements shuffled.
 
 @return A new array containing the receiving array's elements rearranged in a random order.
 */
- (NSArray *)shuffledArray;

/**
 Returns the object returned by 'mutableCopyWithZone:' where the zone is 'nil'.
 
 This differs from 'mutableCopy' in that it makes any contained 'NSArray' objects or 'NSDictionary' objects mutable as well. The returned dictionary
 */
- (NSMutableArray *)deepMutableCopy NS_RETURNS_RETAINED;

///--------------
/// @name Hashing
///--------------

/**
 Returns a string of the MD5 sum of the receiver.
 
 @return The string of the MD5 sum of the receiver.
 
 Internally, 'NSPropertyListSerialization' is used to created the hash. Only objects that can be serialized should be 
 contained in the receiver when calling this method.
 */
- (NSString *)MD5Sum;

/**
 Returns a string of the SHA1 sum of the receiver.
 
 @return The string of the SHA1 sum of the receiver.
 
 Internally, 'NSPropertyListSerization' is used to created the hash. Only objects that can be serialized should be 
 contained in the receiver when calling this method.
 */
- (NSString *)SHA1Sum;

@end
